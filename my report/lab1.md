## lab1 学习笔记

### 练习一

makefile 相关：http://blog.csdn.net/liang13664759/article/details/1771246

1. makefile的基本规则：

   target ... : prerequisites ...
   command

   或者：

   targets : prerequisites ; command
   command

   target也就是一个目标文件，可以是Object File，也可以是执行文件。还可以是一个标签（Label）。prerequisites就是，要生成那个target所需要的文件或是目标。command也就是make需要执行的命令。（任意的Shell命令）

   在makefile中的命令必须以[tab]键开始


2. makefile的变量：

   用“=”定义变量，比如 obj=test1.o test2.o  在makefile中就可以用$(obj)来引用这个变量 类似c语言的宏

3. make工具有自动推导能力。

4. 伪目标 

   “伪目标”并不是一个文件，只是一个标签，由于“伪目标”不是文件，所以make无法生成它的依赖关系和决定它是否要执行。我们只有通过显示地指明这个“目标”才能让其生效。

   用一个特殊的标记“.PHONY”来显示地指明一个目标是“伪目标” 例：.PHONY:clean

5. makefile中，用 :=，表示变量赋值的时候立刻展开，这种情况，变量必须先定义后使用。用 =，表示变量被用的时候才展开。

6. 通常，make会把其要执行的命令行在命令执行前输出到屏幕上。当我们用“@”字符在命令行前，那么，这个命令将不被make显示出来

7. call函数是唯一一个可以用来创建新的参数化的函数。你可以写一个非常复杂的表达式，这个表达式中，你可以定义许多参数，然后你可以用call函数来向这个表达式传递参数。其语法是：

   $(call <expression>,<parm1>,<parm2>,<parm3>...)

   当make执行这个函数时，<expression>参数中的变量，如$(1)，$(2)，$(3)等，会被参数<parm1>，<parm2>，<parm3>依次取代。而<expression>的返回值就是call函数的返回值

8. dd 命令详解

    http://www.cnblogs.com/dkblog/archive/2009/09/18/1980715.html

   //生成一个有10000个块的文件，每个块默认512字节，用0填充
   dd if=/dev/zero of=bin/ucore.img count=10000
   //把bootblock中的内容写到第一个块
   dd if=bin/bootblock of=bin/ucore.img conv=notrunc
   //从第二个块开始写kernel中的内容
   dd if=bin/kernel of=bin/ucore.img seek=1 conv=notrunc

9. objdump命令详解 http://blog.csdn.net/beyondioi/article/details/7796414

###练习二

2.1demo结果跟示例不一样，问题与piazza上的一致，**待解决**。

 https://piazza.com/class/i5j09fnsl7k5x0?cid=991

 查看寄存器的值可得 cs的值为0xf000,eip的值为0xfff0  但是gdb显示的为

  0xfff0:   add  %al,(%bx,%si)   为什么显示的不是实际的物理地址 0xffff0 中的内容

### 练习三

首先清理环境：包括将flag置0和将段寄存器置0
```
	.code16
	    cli
	    cld
	    xorw %ax, %ax
	    movw %ax, %ds
	    movw %ax, %es
	    movw %ax, %ss
```

开启A20：通过将键盘控制器上的A20线置于高电位，全部32条地址线可用，
可以访问4G的内存空间。
```
	seta20.1:               # 等待8042键盘控制器不忙
	    inb $0x64, %al      # 
	    testb $0x2, %al     #
	    jnz seta20.1        #
	
	    movb $0xd1, %al     # 发送写8042输出端口的指令
	    outb %al, $0x64     #
	
	seta20.1:               # 等待8042键盘控制器不忙
	    inb $0x64, %al      # 
	    testb $0x2, %al     #
	    jnz seta20.1        #
	
	    movb $0xdf, %al     # 打开A20
	    outb %al, $0x60     # 
```

初始化GDT表：一个简单的GDT表和其描述符已经静态储存在引导区中，载入即可
```
	    lgdt gdtdesc
```

进入保护模式：通过将cr0寄存器PE位置1便开启了保护模式
```
	    movl %cr0, %eax
	    orl $CR0_PE_ON, %eax
	    movl %eax, %cr0
```

通过长跳转更新cs的基地址
```
	 ljmp $PROT_MODE_CSEG, $protcseg
	.code32
	protcseg:
```

设置段寄存器，并建立堆栈
```
	    movw $PROT_MODE_DSEG, %ax
	    movw %ax, %ds
	    movw %ax, %es
	    movw %ax, %fs
	    movw %ax, %gs
	    movw %ax, %ss
	    movl $0x0, %ebp
	    movl $start, %esp
```
转到保护模式完成，进入boot主方法
```
	    call bootmain
```



### 练习四

1. 关于cpu访问硬盘的IO地址寄存器的详细说明：

   http://blog.csdn.net/farmwang/article/details/49999879

2. elf 文件结构更详细的解释：

   http://blog.csdn.net/dengrengong/article/details/40051339

   http://bdxnote.blog.163.com/blog/static/844423520154502715467/

3. ​


### 练习五

1. read_eip 函数，eip不能直接读取，要靠ebp
2. 要记得到栈底的时候停止循环，栈底ebp[0]的值正好为0，因为第一次调用时的pushl  %ebp，把0放在了栈底
3. 弄明白堆栈结构即可 mooc视频讲的很清楚

### 练习六

1. 中断向量表一个表项占用8字节，其中2-3字节是段选择子，0-1字节和6-7字节拼成位移，两者联合便是中断处理程序的入口地址。

2. 应用程序如果要完成系统调用，要有一个从用户态转到内核态的过程，需要为此设立一个中断：

   ```SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK],3); ```

3. 在trap中，定义变量ticks变量，加上的关键字volatile提醒编译器它后面所定义的变量随时都有可能改变，因此编译后的程序每次需要存储或读取这个变量的时候，都会直接从变量地址中读取数据。如果没有volatile关键字，则编译器可能优化读取和存储，可能暂时使用寄存器中的值，如果这个变量由别的程序更新了的话，将出现不一致的现象

   ​