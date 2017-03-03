
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 ea 10 00       	push   $0x10ea16
  10001f:	e8 5d 2c 00 00       	call   102c81 <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 25 15 00 00       	call   101551 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 20 34 10 00 	movl   $0x103420,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 3c 34 10 00       	push   $0x10343c
  10003e:	e8 fa 01 00 00       	call   10023d <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 7c 08 00 00       	call   1008c7 <print_kerninfo>

    grade_backtrace();
  10004b:	e8 74 00 00 00       	call   1000c4 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 f0 28 00 00       	call   102945 <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 3a 16 00 00       	call   101694 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 9b 17 00 00       	call   1017fa <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 d2 0c 00 00       	call   100d36 <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 68 17 00 00       	call   1017d1 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  100069:	eb fe                	jmp    100069 <kern_init+0x69>

0010006b <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006b:	55                   	push   %ebp
  10006c:	89 e5                	mov    %esp,%ebp
  10006e:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100071:	83 ec 04             	sub    $0x4,%esp
  100074:	6a 00                	push   $0x0
  100076:	6a 00                	push   $0x0
  100078:	6a 00                	push   $0x0
  10007a:	e8 a5 0c 00 00       	call   100d24 <mon_backtrace>
  10007f:	83 c4 10             	add    $0x10,%esp
}
  100082:	90                   	nop
  100083:	c9                   	leave  
  100084:	c3                   	ret    

00100085 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100085:	55                   	push   %ebp
  100086:	89 e5                	mov    %esp,%ebp
  100088:	53                   	push   %ebx
  100089:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10008c:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10008f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100092:	8d 5d 08             	lea    0x8(%ebp),%ebx
  100095:	8b 45 08             	mov    0x8(%ebp),%eax
  100098:	51                   	push   %ecx
  100099:	52                   	push   %edx
  10009a:	53                   	push   %ebx
  10009b:	50                   	push   %eax
  10009c:	e8 ca ff ff ff       	call   10006b <grade_backtrace2>
  1000a1:	83 c4 10             	add    $0x10,%esp
}
  1000a4:	90                   	nop
  1000a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000a8:	c9                   	leave  
  1000a9:	c3                   	ret    

001000aa <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000aa:	55                   	push   %ebp
  1000ab:	89 e5                	mov    %esp,%ebp
  1000ad:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b0:	83 ec 08             	sub    $0x8,%esp
  1000b3:	ff 75 10             	pushl  0x10(%ebp)
  1000b6:	ff 75 08             	pushl  0x8(%ebp)
  1000b9:	e8 c7 ff ff ff       	call   100085 <grade_backtrace1>
  1000be:	83 c4 10             	add    $0x10,%esp
}
  1000c1:	90                   	nop
  1000c2:	c9                   	leave  
  1000c3:	c3                   	ret    

001000c4 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000ca:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000cf:	83 ec 04             	sub    $0x4,%esp
  1000d2:	68 00 00 ff ff       	push   $0xffff0000
  1000d7:	50                   	push   %eax
  1000d8:	6a 00                	push   $0x0
  1000da:	e8 cb ff ff ff       	call   1000aa <grade_backtrace0>
  1000df:	83 c4 10             	add    $0x10,%esp
}
  1000e2:	90                   	nop
  1000e3:	c9                   	leave  
  1000e4:	c3                   	ret    

001000e5 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e5:	55                   	push   %ebp
  1000e6:	89 e5                	mov    %esp,%ebp
  1000e8:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000eb:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000ee:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f1:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f4:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1000fb:	0f b7 c0             	movzwl %ax,%eax
  1000fe:	83 e0 03             	and    $0x3,%eax
  100101:	89 c2                	mov    %eax,%edx
  100103:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100108:	83 ec 04             	sub    $0x4,%esp
  10010b:	52                   	push   %edx
  10010c:	50                   	push   %eax
  10010d:	68 41 34 10 00       	push   $0x103441
  100112:	e8 26 01 00 00       	call   10023d <cprintf>
  100117:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011e:	0f b7 d0             	movzwl %ax,%edx
  100121:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100126:	83 ec 04             	sub    $0x4,%esp
  100129:	52                   	push   %edx
  10012a:	50                   	push   %eax
  10012b:	68 4f 34 10 00       	push   $0x10344f
  100130:	e8 08 01 00 00       	call   10023d <cprintf>
  100135:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100138:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10013c:	0f b7 d0             	movzwl %ax,%edx
  10013f:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100144:	83 ec 04             	sub    $0x4,%esp
  100147:	52                   	push   %edx
  100148:	50                   	push   %eax
  100149:	68 5d 34 10 00       	push   $0x10345d
  10014e:	e8 ea 00 00 00       	call   10023d <cprintf>
  100153:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100156:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015a:	0f b7 d0             	movzwl %ax,%edx
  10015d:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100162:	83 ec 04             	sub    $0x4,%esp
  100165:	52                   	push   %edx
  100166:	50                   	push   %eax
  100167:	68 6b 34 10 00       	push   $0x10346b
  10016c:	e8 cc 00 00 00       	call   10023d <cprintf>
  100171:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100174:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100178:	0f b7 d0             	movzwl %ax,%edx
  10017b:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100180:	83 ec 04             	sub    $0x4,%esp
  100183:	52                   	push   %edx
  100184:	50                   	push   %eax
  100185:	68 79 34 10 00       	push   $0x103479
  10018a:	e8 ae 00 00 00       	call   10023d <cprintf>
  10018f:	83 c4 10             	add    $0x10,%esp
    round ++;
  100192:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100197:	83 c0 01             	add    $0x1,%eax
  10019a:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  10019f:	90                   	nop
  1001a0:	c9                   	leave  
  1001a1:	c3                   	ret    

001001a2 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a2:	55                   	push   %ebp
  1001a3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001a5:	90                   	nop
  1001a6:	5d                   	pop    %ebp
  1001a7:	c3                   	ret    

001001a8 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001a8:	55                   	push   %ebp
  1001a9:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ab:	90                   	nop
  1001ac:	5d                   	pop    %ebp
  1001ad:	c3                   	ret    

001001ae <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ae:	55                   	push   %ebp
  1001af:	89 e5                	mov    %esp,%ebp
  1001b1:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001b4:	e8 2c ff ff ff       	call   1000e5 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001b9:	83 ec 0c             	sub    $0xc,%esp
  1001bc:	68 88 34 10 00       	push   $0x103488
  1001c1:	e8 77 00 00 00       	call   10023d <cprintf>
  1001c6:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001c9:	e8 d4 ff ff ff       	call   1001a2 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ce:	e8 12 ff ff ff       	call   1000e5 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001d3:	83 ec 0c             	sub    $0xc,%esp
  1001d6:	68 a8 34 10 00       	push   $0x1034a8
  1001db:	e8 5d 00 00 00       	call   10023d <cprintf>
  1001e0:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001e3:	e8 c0 ff ff ff       	call   1001a8 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001e8:	e8 f8 fe ff ff       	call   1000e5 <lab1_print_cur_status>
}
  1001ed:	90                   	nop
  1001ee:	c9                   	leave  
  1001ef:	c3                   	ret    

001001f0 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1001f0:	55                   	push   %ebp
  1001f1:	89 e5                	mov    %esp,%ebp
  1001f3:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1001f6:	83 ec 0c             	sub    $0xc,%esp
  1001f9:	ff 75 08             	pushl  0x8(%ebp)
  1001fc:	e8 81 13 00 00       	call   101582 <cons_putc>
  100201:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  100204:	8b 45 0c             	mov    0xc(%ebp),%eax
  100207:	8b 00                	mov    (%eax),%eax
  100209:	8d 50 01             	lea    0x1(%eax),%edx
  10020c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10020f:	89 10                	mov    %edx,(%eax)
}
  100211:	90                   	nop
  100212:	c9                   	leave  
  100213:	c3                   	ret    

00100214 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100214:	55                   	push   %ebp
  100215:	89 e5                	mov    %esp,%ebp
  100217:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  10021a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100221:	ff 75 0c             	pushl  0xc(%ebp)
  100224:	ff 75 08             	pushl  0x8(%ebp)
  100227:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10022a:	50                   	push   %eax
  10022b:	68 f0 01 10 00       	push   $0x1001f0
  100230:	e8 82 2d 00 00       	call   102fb7 <vprintfmt>
  100235:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100238:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10023b:	c9                   	leave  
  10023c:	c3                   	ret    

0010023d <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10023d:	55                   	push   %ebp
  10023e:	89 e5                	mov    %esp,%ebp
  100240:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100243:	8d 45 0c             	lea    0xc(%ebp),%eax
  100246:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100249:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10024c:	83 ec 08             	sub    $0x8,%esp
  10024f:	50                   	push   %eax
  100250:	ff 75 08             	pushl  0x8(%ebp)
  100253:	e8 bc ff ff ff       	call   100214 <vcprintf>
  100258:	83 c4 10             	add    $0x10,%esp
  10025b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100261:	c9                   	leave  
  100262:	c3                   	ret    

00100263 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100263:	55                   	push   %ebp
  100264:	89 e5                	mov    %esp,%ebp
  100266:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100269:	83 ec 0c             	sub    $0xc,%esp
  10026c:	ff 75 08             	pushl  0x8(%ebp)
  10026f:	e8 0e 13 00 00       	call   101582 <cons_putc>
  100274:	83 c4 10             	add    $0x10,%esp
}
  100277:	90                   	nop
  100278:	c9                   	leave  
  100279:	c3                   	ret    

0010027a <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10027a:	55                   	push   %ebp
  10027b:	89 e5                	mov    %esp,%ebp
  10027d:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100280:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100287:	eb 14                	jmp    10029d <cputs+0x23>
        cputch(c, &cnt);
  100289:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10028d:	83 ec 08             	sub    $0x8,%esp
  100290:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100293:	52                   	push   %edx
  100294:	50                   	push   %eax
  100295:	e8 56 ff ff ff       	call   1001f0 <cputch>
  10029a:	83 c4 10             	add    $0x10,%esp
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10029d:	8b 45 08             	mov    0x8(%ebp),%eax
  1002a0:	8d 50 01             	lea    0x1(%eax),%edx
  1002a3:	89 55 08             	mov    %edx,0x8(%ebp)
  1002a6:	0f b6 00             	movzbl (%eax),%eax
  1002a9:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002ac:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002b0:	75 d7                	jne    100289 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002b2:	83 ec 08             	sub    $0x8,%esp
  1002b5:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002b8:	50                   	push   %eax
  1002b9:	6a 0a                	push   $0xa
  1002bb:	e8 30 ff ff ff       	call   1001f0 <cputch>
  1002c0:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002c6:	c9                   	leave  
  1002c7:	c3                   	ret    

001002c8 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002c8:	55                   	push   %ebp
  1002c9:	89 e5                	mov    %esp,%ebp
  1002cb:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002ce:	e8 df 12 00 00       	call   1015b2 <cons_getc>
  1002d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002da:	74 f2                	je     1002ce <getchar+0x6>
        /* do nothing */;
    return c;
  1002dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002df:	c9                   	leave  
  1002e0:	c3                   	ret    

001002e1 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002e1:	55                   	push   %ebp
  1002e2:	89 e5                	mov    %esp,%ebp
  1002e4:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002eb:	74 13                	je     100300 <readline+0x1f>
        cprintf("%s", prompt);
  1002ed:	83 ec 08             	sub    $0x8,%esp
  1002f0:	ff 75 08             	pushl  0x8(%ebp)
  1002f3:	68 c7 34 10 00       	push   $0x1034c7
  1002f8:	e8 40 ff ff ff       	call   10023d <cprintf>
  1002fd:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100307:	e8 bc ff ff ff       	call   1002c8 <getchar>
  10030c:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10030f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100313:	79 0a                	jns    10031f <readline+0x3e>
            return NULL;
  100315:	b8 00 00 00 00       	mov    $0x0,%eax
  10031a:	e9 82 00 00 00       	jmp    1003a1 <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10031f:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100323:	7e 2b                	jle    100350 <readline+0x6f>
  100325:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10032c:	7f 22                	jg     100350 <readline+0x6f>
            cputchar(c);
  10032e:	83 ec 0c             	sub    $0xc,%esp
  100331:	ff 75 f0             	pushl  -0x10(%ebp)
  100334:	e8 2a ff ff ff       	call   100263 <cputchar>
  100339:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  10033c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10033f:	8d 50 01             	lea    0x1(%eax),%edx
  100342:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100345:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100348:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  10034e:	eb 4c                	jmp    10039c <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  100350:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100354:	75 1a                	jne    100370 <readline+0x8f>
  100356:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10035a:	7e 14                	jle    100370 <readline+0x8f>
            cputchar(c);
  10035c:	83 ec 0c             	sub    $0xc,%esp
  10035f:	ff 75 f0             	pushl  -0x10(%ebp)
  100362:	e8 fc fe ff ff       	call   100263 <cputchar>
  100367:	83 c4 10             	add    $0x10,%esp
            i --;
  10036a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10036e:	eb 2c                	jmp    10039c <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  100370:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100374:	74 06                	je     10037c <readline+0x9b>
  100376:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10037a:	75 8b                	jne    100307 <readline+0x26>
            cputchar(c);
  10037c:	83 ec 0c             	sub    $0xc,%esp
  10037f:	ff 75 f0             	pushl  -0x10(%ebp)
  100382:	e8 dc fe ff ff       	call   100263 <cputchar>
  100387:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  10038a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10038d:	05 40 ea 10 00       	add    $0x10ea40,%eax
  100392:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  100395:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  10039a:	eb 05                	jmp    1003a1 <readline+0xc0>
        }
    }
  10039c:	e9 66 ff ff ff       	jmp    100307 <readline+0x26>
}
  1003a1:	c9                   	leave  
  1003a2:	c3                   	ret    

001003a3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003a3:	55                   	push   %ebp
  1003a4:	89 e5                	mov    %esp,%ebp
  1003a6:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  1003a9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ae:	85 c0                	test   %eax,%eax
  1003b0:	75 4a                	jne    1003fc <__panic+0x59>
        goto panic_dead;
    }
    is_panic = 1;
  1003b2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003b9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003bc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003c2:	83 ec 04             	sub    $0x4,%esp
  1003c5:	ff 75 0c             	pushl  0xc(%ebp)
  1003c8:	ff 75 08             	pushl  0x8(%ebp)
  1003cb:	68 ca 34 10 00       	push   $0x1034ca
  1003d0:	e8 68 fe ff ff       	call   10023d <cprintf>
  1003d5:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003db:	83 ec 08             	sub    $0x8,%esp
  1003de:	50                   	push   %eax
  1003df:	ff 75 10             	pushl  0x10(%ebp)
  1003e2:	e8 2d fe ff ff       	call   100214 <vcprintf>
  1003e7:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003ea:	83 ec 0c             	sub    $0xc,%esp
  1003ed:	68 e6 34 10 00       	push   $0x1034e6
  1003f2:	e8 46 fe ff ff       	call   10023d <cprintf>
  1003f7:	83 c4 10             	add    $0x10,%esp
  1003fa:	eb 01                	jmp    1003fd <__panic+0x5a>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  1003fc:	90                   	nop
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    intr_disable();
  1003fd:	e8 d6 13 00 00       	call   1017d8 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100402:	83 ec 0c             	sub    $0xc,%esp
  100405:	6a 00                	push   $0x0
  100407:	e8 3e 08 00 00       	call   100c4a <kmonitor>
  10040c:	83 c4 10             	add    $0x10,%esp
    }
  10040f:	eb f1                	jmp    100402 <__panic+0x5f>

00100411 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100411:	55                   	push   %ebp
  100412:	89 e5                	mov    %esp,%ebp
  100414:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  100417:	8d 45 14             	lea    0x14(%ebp),%eax
  10041a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10041d:	83 ec 04             	sub    $0x4,%esp
  100420:	ff 75 0c             	pushl  0xc(%ebp)
  100423:	ff 75 08             	pushl  0x8(%ebp)
  100426:	68 e8 34 10 00       	push   $0x1034e8
  10042b:	e8 0d fe ff ff       	call   10023d <cprintf>
  100430:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100433:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100436:	83 ec 08             	sub    $0x8,%esp
  100439:	50                   	push   %eax
  10043a:	ff 75 10             	pushl  0x10(%ebp)
  10043d:	e8 d2 fd ff ff       	call   100214 <vcprintf>
  100442:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100445:	83 ec 0c             	sub    $0xc,%esp
  100448:	68 e6 34 10 00       	push   $0x1034e6
  10044d:	e8 eb fd ff ff       	call   10023d <cprintf>
  100452:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  100455:	90                   	nop
  100456:	c9                   	leave  
  100457:	c3                   	ret    

00100458 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100458:	55                   	push   %ebp
  100459:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10045b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100460:	5d                   	pop    %ebp
  100461:	c3                   	ret    

00100462 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100462:	55                   	push   %ebp
  100463:	89 e5                	mov    %esp,%ebp
  100465:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100468:	8b 45 0c             	mov    0xc(%ebp),%eax
  10046b:	8b 00                	mov    (%eax),%eax
  10046d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100470:	8b 45 10             	mov    0x10(%ebp),%eax
  100473:	8b 00                	mov    (%eax),%eax
  100475:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10047f:	e9 d2 00 00 00       	jmp    100556 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  100484:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100487:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10048a:	01 d0                	add    %edx,%eax
  10048c:	89 c2                	mov    %eax,%edx
  10048e:	c1 ea 1f             	shr    $0x1f,%edx
  100491:	01 d0                	add    %edx,%eax
  100493:	d1 f8                	sar    %eax
  100495:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100498:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10049b:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10049e:	eb 04                	jmp    1004a4 <stab_binsearch+0x42>
            m --;
  1004a0:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004aa:	7c 1f                	jl     1004cb <stab_binsearch+0x69>
  1004ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004af:	89 d0                	mov    %edx,%eax
  1004b1:	01 c0                	add    %eax,%eax
  1004b3:	01 d0                	add    %edx,%eax
  1004b5:	c1 e0 02             	shl    $0x2,%eax
  1004b8:	89 c2                	mov    %eax,%edx
  1004ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1004bd:	01 d0                	add    %edx,%eax
  1004bf:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004c3:	0f b6 c0             	movzbl %al,%eax
  1004c6:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004c9:	75 d5                	jne    1004a0 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d1:	7d 0b                	jge    1004de <stab_binsearch+0x7c>
            l = true_m + 1;
  1004d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004d6:	83 c0 01             	add    $0x1,%eax
  1004d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004dc:	eb 78                	jmp    100556 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004de:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004e8:	89 d0                	mov    %edx,%eax
  1004ea:	01 c0                	add    %eax,%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	c1 e0 02             	shl    $0x2,%eax
  1004f1:	89 c2                	mov    %eax,%edx
  1004f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f6:	01 d0                	add    %edx,%eax
  1004f8:	8b 40 08             	mov    0x8(%eax),%eax
  1004fb:	3b 45 18             	cmp    0x18(%ebp),%eax
  1004fe:	73 13                	jae    100513 <stab_binsearch+0xb1>
            *region_left = m;
  100500:	8b 45 0c             	mov    0xc(%ebp),%eax
  100503:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100506:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100508:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10050b:	83 c0 01             	add    $0x1,%eax
  10050e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100511:	eb 43                	jmp    100556 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100513:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100516:	89 d0                	mov    %edx,%eax
  100518:	01 c0                	add    %eax,%eax
  10051a:	01 d0                	add    %edx,%eax
  10051c:	c1 e0 02             	shl    $0x2,%eax
  10051f:	89 c2                	mov    %eax,%edx
  100521:	8b 45 08             	mov    0x8(%ebp),%eax
  100524:	01 d0                	add    %edx,%eax
  100526:	8b 40 08             	mov    0x8(%eax),%eax
  100529:	3b 45 18             	cmp    0x18(%ebp),%eax
  10052c:	76 16                	jbe    100544 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10052e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100531:	8d 50 ff             	lea    -0x1(%eax),%edx
  100534:	8b 45 10             	mov    0x10(%ebp),%eax
  100537:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100539:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053c:	83 e8 01             	sub    $0x1,%eax
  10053f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100542:	eb 12                	jmp    100556 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100544:	8b 45 0c             	mov    0xc(%ebp),%eax
  100547:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10054a:	89 10                	mov    %edx,(%eax)
            l = m;
  10054c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10054f:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100552:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  100556:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100559:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  10055c:	0f 8e 22 ff ff ff    	jle    100484 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  100562:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100566:	75 0f                	jne    100577 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  100568:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056b:	8b 00                	mov    (%eax),%eax
  10056d:	8d 50 ff             	lea    -0x1(%eax),%edx
  100570:	8b 45 10             	mov    0x10(%ebp),%eax
  100573:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  100575:	eb 3f                	jmp    1005b6 <stab_binsearch+0x154>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  100577:	8b 45 10             	mov    0x10(%ebp),%eax
  10057a:	8b 00                	mov    (%eax),%eax
  10057c:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  10057f:	eb 04                	jmp    100585 <stab_binsearch+0x123>
  100581:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  100585:	8b 45 0c             	mov    0xc(%ebp),%eax
  100588:	8b 00                	mov    (%eax),%eax
  10058a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10058d:	7d 1f                	jge    1005ae <stab_binsearch+0x14c>
  10058f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100592:	89 d0                	mov    %edx,%eax
  100594:	01 c0                	add    %eax,%eax
  100596:	01 d0                	add    %edx,%eax
  100598:	c1 e0 02             	shl    $0x2,%eax
  10059b:	89 c2                	mov    %eax,%edx
  10059d:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a0:	01 d0                	add    %edx,%eax
  1005a2:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005a6:	0f b6 c0             	movzbl %al,%eax
  1005a9:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005ac:	75 d3                	jne    100581 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005b1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b4:	89 10                	mov    %edx,(%eax)
    }
}
  1005b6:	90                   	nop
  1005b7:	c9                   	leave  
  1005b8:	c3                   	ret    

001005b9 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005b9:	55                   	push   %ebp
  1005ba:	89 e5                	mov    %esp,%ebp
  1005bc:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c2:	c7 00 08 35 10 00    	movl   $0x103508,(%eax)
    info->eip_line = 0;
  1005c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005cb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d5:	c7 40 08 08 35 10 00 	movl   $0x103508,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005df:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e9:	8b 55 08             	mov    0x8(%ebp),%edx
  1005ec:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  1005ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f2:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  1005f9:	c7 45 f4 2c 3d 10 00 	movl   $0x103d2c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100600:	c7 45 f0 94 b6 10 00 	movl   $0x10b694,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100607:	c7 45 ec 95 b6 10 00 	movl   $0x10b695,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10060e:	c7 45 e8 c9 d6 10 00 	movl   $0x10d6c9,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100615:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100618:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10061b:	76 0d                	jbe    10062a <debuginfo_eip+0x71>
  10061d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100620:	83 e8 01             	sub    $0x1,%eax
  100623:	0f b6 00             	movzbl (%eax),%eax
  100626:	84 c0                	test   %al,%al
  100628:	74 0a                	je     100634 <debuginfo_eip+0x7b>
        return -1;
  10062a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10062f:	e9 91 02 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100634:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10063b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10063e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100641:	29 c2                	sub    %eax,%edx
  100643:	89 d0                	mov    %edx,%eax
  100645:	c1 f8 02             	sar    $0x2,%eax
  100648:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10064e:	83 e8 01             	sub    $0x1,%eax
  100651:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100654:	ff 75 08             	pushl  0x8(%ebp)
  100657:	6a 64                	push   $0x64
  100659:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10065c:	50                   	push   %eax
  10065d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100660:	50                   	push   %eax
  100661:	ff 75 f4             	pushl  -0xc(%ebp)
  100664:	e8 f9 fd ff ff       	call   100462 <stab_binsearch>
  100669:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  10066c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10066f:	85 c0                	test   %eax,%eax
  100671:	75 0a                	jne    10067d <debuginfo_eip+0xc4>
        return -1;
  100673:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100678:	e9 48 02 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  10067d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100680:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100683:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100686:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  100689:	ff 75 08             	pushl  0x8(%ebp)
  10068c:	6a 24                	push   $0x24
  10068e:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100691:	50                   	push   %eax
  100692:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100695:	50                   	push   %eax
  100696:	ff 75 f4             	pushl  -0xc(%ebp)
  100699:	e8 c4 fd ff ff       	call   100462 <stab_binsearch>
  10069e:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1006a1:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006a7:	39 c2                	cmp    %eax,%edx
  1006a9:	7f 7c                	jg     100727 <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ab:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006ae:	89 c2                	mov    %eax,%edx
  1006b0:	89 d0                	mov    %edx,%eax
  1006b2:	01 c0                	add    %eax,%eax
  1006b4:	01 d0                	add    %edx,%eax
  1006b6:	c1 e0 02             	shl    $0x2,%eax
  1006b9:	89 c2                	mov    %eax,%edx
  1006bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006be:	01 d0                	add    %edx,%eax
  1006c0:	8b 00                	mov    (%eax),%eax
  1006c2:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006c8:	29 d1                	sub    %edx,%ecx
  1006ca:	89 ca                	mov    %ecx,%edx
  1006cc:	39 d0                	cmp    %edx,%eax
  1006ce:	73 22                	jae    1006f2 <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006d3:	89 c2                	mov    %eax,%edx
  1006d5:	89 d0                	mov    %edx,%eax
  1006d7:	01 c0                	add    %eax,%eax
  1006d9:	01 d0                	add    %edx,%eax
  1006db:	c1 e0 02             	shl    $0x2,%eax
  1006de:	89 c2                	mov    %eax,%edx
  1006e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e3:	01 d0                	add    %edx,%eax
  1006e5:	8b 10                	mov    (%eax),%edx
  1006e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006ea:	01 c2                	add    %eax,%edx
  1006ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006ef:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  1006f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f5:	89 c2                	mov    %eax,%edx
  1006f7:	89 d0                	mov    %edx,%eax
  1006f9:	01 c0                	add    %eax,%eax
  1006fb:	01 d0                	add    %edx,%eax
  1006fd:	c1 e0 02             	shl    $0x2,%eax
  100700:	89 c2                	mov    %eax,%edx
  100702:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100705:	01 d0                	add    %edx,%eax
  100707:	8b 50 08             	mov    0x8(%eax),%edx
  10070a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10070d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100710:	8b 45 0c             	mov    0xc(%ebp),%eax
  100713:	8b 40 10             	mov    0x10(%eax),%eax
  100716:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100719:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10071c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10071f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100722:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100725:	eb 15                	jmp    10073c <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100727:	8b 45 0c             	mov    0xc(%ebp),%eax
  10072a:	8b 55 08             	mov    0x8(%ebp),%edx
  10072d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100730:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100733:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100736:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100739:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10073c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10073f:	8b 40 08             	mov    0x8(%eax),%eax
  100742:	83 ec 08             	sub    $0x8,%esp
  100745:	6a 3a                	push   $0x3a
  100747:	50                   	push   %eax
  100748:	e8 a8 23 00 00       	call   102af5 <strfind>
  10074d:	83 c4 10             	add    $0x10,%esp
  100750:	89 c2                	mov    %eax,%edx
  100752:	8b 45 0c             	mov    0xc(%ebp),%eax
  100755:	8b 40 08             	mov    0x8(%eax),%eax
  100758:	29 c2                	sub    %eax,%edx
  10075a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10075d:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100760:	83 ec 0c             	sub    $0xc,%esp
  100763:	ff 75 08             	pushl  0x8(%ebp)
  100766:	6a 44                	push   $0x44
  100768:	8d 45 d0             	lea    -0x30(%ebp),%eax
  10076b:	50                   	push   %eax
  10076c:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  10076f:	50                   	push   %eax
  100770:	ff 75 f4             	pushl  -0xc(%ebp)
  100773:	e8 ea fc ff ff       	call   100462 <stab_binsearch>
  100778:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  10077b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10077e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100781:	39 c2                	cmp    %eax,%edx
  100783:	7f 24                	jg     1007a9 <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  100785:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100788:	89 c2                	mov    %eax,%edx
  10078a:	89 d0                	mov    %edx,%eax
  10078c:	01 c0                	add    %eax,%eax
  10078e:	01 d0                	add    %edx,%eax
  100790:	c1 e0 02             	shl    $0x2,%eax
  100793:	89 c2                	mov    %eax,%edx
  100795:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100798:	01 d0                	add    %edx,%eax
  10079a:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10079e:	0f b7 d0             	movzwl %ax,%edx
  1007a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a4:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007a7:	eb 13                	jmp    1007bc <debuginfo_eip+0x203>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1007a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ae:	e9 12 01 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007b6:	83 e8 01             	sub    $0x1,%eax
  1007b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007bc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007c2:	39 c2                	cmp    %eax,%edx
  1007c4:	7c 56                	jl     10081c <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007c9:	89 c2                	mov    %eax,%edx
  1007cb:	89 d0                	mov    %edx,%eax
  1007cd:	01 c0                	add    %eax,%eax
  1007cf:	01 d0                	add    %edx,%eax
  1007d1:	c1 e0 02             	shl    $0x2,%eax
  1007d4:	89 c2                	mov    %eax,%edx
  1007d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007d9:	01 d0                	add    %edx,%eax
  1007db:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007df:	3c 84                	cmp    $0x84,%al
  1007e1:	74 39                	je     10081c <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  1007e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007e6:	89 c2                	mov    %eax,%edx
  1007e8:	89 d0                	mov    %edx,%eax
  1007ea:	01 c0                	add    %eax,%eax
  1007ec:	01 d0                	add    %edx,%eax
  1007ee:	c1 e0 02             	shl    $0x2,%eax
  1007f1:	89 c2                	mov    %eax,%edx
  1007f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007f6:	01 d0                	add    %edx,%eax
  1007f8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007fc:	3c 64                	cmp    $0x64,%al
  1007fe:	75 b3                	jne    1007b3 <debuginfo_eip+0x1fa>
  100800:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100803:	89 c2                	mov    %eax,%edx
  100805:	89 d0                	mov    %edx,%eax
  100807:	01 c0                	add    %eax,%eax
  100809:	01 d0                	add    %edx,%eax
  10080b:	c1 e0 02             	shl    $0x2,%eax
  10080e:	89 c2                	mov    %eax,%edx
  100810:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100813:	01 d0                	add    %edx,%eax
  100815:	8b 40 08             	mov    0x8(%eax),%eax
  100818:	85 c0                	test   %eax,%eax
  10081a:	74 97                	je     1007b3 <debuginfo_eip+0x1fa>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10081c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100822:	39 c2                	cmp    %eax,%edx
  100824:	7c 46                	jl     10086c <debuginfo_eip+0x2b3>
  100826:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	89 d0                	mov    %edx,%eax
  10082d:	01 c0                	add    %eax,%eax
  10082f:	01 d0                	add    %edx,%eax
  100831:	c1 e0 02             	shl    $0x2,%eax
  100834:	89 c2                	mov    %eax,%edx
  100836:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100839:	01 d0                	add    %edx,%eax
  10083b:	8b 00                	mov    (%eax),%eax
  10083d:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100840:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100843:	29 d1                	sub    %edx,%ecx
  100845:	89 ca                	mov    %ecx,%edx
  100847:	39 d0                	cmp    %edx,%eax
  100849:	73 21                	jae    10086c <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10084b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10084e:	89 c2                	mov    %eax,%edx
  100850:	89 d0                	mov    %edx,%eax
  100852:	01 c0                	add    %eax,%eax
  100854:	01 d0                	add    %edx,%eax
  100856:	c1 e0 02             	shl    $0x2,%eax
  100859:	89 c2                	mov    %eax,%edx
  10085b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10085e:	01 d0                	add    %edx,%eax
  100860:	8b 10                	mov    (%eax),%edx
  100862:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100865:	01 c2                	add    %eax,%edx
  100867:	8b 45 0c             	mov    0xc(%ebp),%eax
  10086a:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  10086c:	8b 55 dc             	mov    -0x24(%ebp),%edx
  10086f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100872:	39 c2                	cmp    %eax,%edx
  100874:	7d 4a                	jge    1008c0 <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  100876:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100879:	83 c0 01             	add    $0x1,%eax
  10087c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  10087f:	eb 18                	jmp    100899 <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100881:	8b 45 0c             	mov    0xc(%ebp),%eax
  100884:	8b 40 14             	mov    0x14(%eax),%eax
  100887:	8d 50 01             	lea    0x1(%eax),%edx
  10088a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10088d:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  100890:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100893:	83 c0 01             	add    $0x1,%eax
  100896:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100899:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10089c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10089f:	39 c2                	cmp    %eax,%edx
  1008a1:	7d 1d                	jge    1008c0 <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008a6:	89 c2                	mov    %eax,%edx
  1008a8:	89 d0                	mov    %edx,%eax
  1008aa:	01 c0                	add    %eax,%eax
  1008ac:	01 d0                	add    %edx,%eax
  1008ae:	c1 e0 02             	shl    $0x2,%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008b6:	01 d0                	add    %edx,%eax
  1008b8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008bc:	3c a0                	cmp    $0xa0,%al
  1008be:	74 c1                	je     100881 <debuginfo_eip+0x2c8>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  1008c0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008c5:	c9                   	leave  
  1008c6:	c3                   	ret    

001008c7 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008c7:	55                   	push   %ebp
  1008c8:	89 e5                	mov    %esp,%ebp
  1008ca:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008cd:	83 ec 0c             	sub    $0xc,%esp
  1008d0:	68 12 35 10 00       	push   $0x103512
  1008d5:	e8 63 f9 ff ff       	call   10023d <cprintf>
  1008da:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008dd:	83 ec 08             	sub    $0x8,%esp
  1008e0:	68 00 00 10 00       	push   $0x100000
  1008e5:	68 2b 35 10 00       	push   $0x10352b
  1008ea:	e8 4e f9 ff ff       	call   10023d <cprintf>
  1008ef:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  1008f2:	83 ec 08             	sub    $0x8,%esp
  1008f5:	68 18 34 10 00       	push   $0x103418
  1008fa:	68 43 35 10 00       	push   $0x103543
  1008ff:	e8 39 f9 ff ff       	call   10023d <cprintf>
  100904:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100907:	83 ec 08             	sub    $0x8,%esp
  10090a:	68 16 ea 10 00       	push   $0x10ea16
  10090f:	68 5b 35 10 00       	push   $0x10355b
  100914:	e8 24 f9 ff ff       	call   10023d <cprintf>
  100919:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  10091c:	83 ec 08             	sub    $0x8,%esp
  10091f:	68 20 fd 10 00       	push   $0x10fd20
  100924:	68 73 35 10 00       	push   $0x103573
  100929:	e8 0f f9 ff ff       	call   10023d <cprintf>
  10092e:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100931:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100936:	05 ff 03 00 00       	add    $0x3ff,%eax
  10093b:	ba 00 00 10 00       	mov    $0x100000,%edx
  100940:	29 d0                	sub    %edx,%eax
  100942:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100948:	85 c0                	test   %eax,%eax
  10094a:	0f 48 c2             	cmovs  %edx,%eax
  10094d:	c1 f8 0a             	sar    $0xa,%eax
  100950:	83 ec 08             	sub    $0x8,%esp
  100953:	50                   	push   %eax
  100954:	68 8c 35 10 00       	push   $0x10358c
  100959:	e8 df f8 ff ff       	call   10023d <cprintf>
  10095e:	83 c4 10             	add    $0x10,%esp
}
  100961:	90                   	nop
  100962:	c9                   	leave  
  100963:	c3                   	ret    

00100964 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100964:	55                   	push   %ebp
  100965:	89 e5                	mov    %esp,%ebp
  100967:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  10096d:	83 ec 08             	sub    $0x8,%esp
  100970:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100973:	50                   	push   %eax
  100974:	ff 75 08             	pushl  0x8(%ebp)
  100977:	e8 3d fc ff ff       	call   1005b9 <debuginfo_eip>
  10097c:	83 c4 10             	add    $0x10,%esp
  10097f:	85 c0                	test   %eax,%eax
  100981:	74 15                	je     100998 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100983:	83 ec 08             	sub    $0x8,%esp
  100986:	ff 75 08             	pushl  0x8(%ebp)
  100989:	68 b6 35 10 00       	push   $0x1035b6
  10098e:	e8 aa f8 ff ff       	call   10023d <cprintf>
  100993:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100996:	eb 65                	jmp    1009fd <print_debuginfo+0x99>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100998:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10099f:	eb 1c                	jmp    1009bd <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  1009a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a7:	01 d0                	add    %edx,%eax
  1009a9:	0f b6 00             	movzbl (%eax),%eax
  1009ac:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009b5:	01 ca                	add    %ecx,%edx
  1009b7:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009c0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1009c3:	7f dc                	jg     1009a1 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  1009c5:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ce:	01 d0                	add    %edx,%eax
  1009d0:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  1009d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009d6:	8b 55 08             	mov    0x8(%ebp),%edx
  1009d9:	89 d1                	mov    %edx,%ecx
  1009db:	29 c1                	sub    %eax,%ecx
  1009dd:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1009e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009e3:	83 ec 0c             	sub    $0xc,%esp
  1009e6:	51                   	push   %ecx
  1009e7:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009ed:	51                   	push   %ecx
  1009ee:	52                   	push   %edx
  1009ef:	50                   	push   %eax
  1009f0:	68 d2 35 10 00       	push   $0x1035d2
  1009f5:	e8 43 f8 ff ff       	call   10023d <cprintf>
  1009fa:	83 c4 20             	add    $0x20,%esp
                fnname, eip - info.eip_fn_addr);
    }
}
  1009fd:	90                   	nop
  1009fe:	c9                   	leave  
  1009ff:	c3                   	ret    

00100a00 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a00:	55                   	push   %ebp
  100a01:	89 e5                	mov    %esp,%ebp
  100a03:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a06:	8b 45 04             	mov    0x4(%ebp),%eax
  100a09:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a0f:	c9                   	leave  
  100a10:	c3                   	ret    

00100a11 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a11:	55                   	push   %ebp
  100a12:	89 e5                	mov    %esp,%ebp
  100a14:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a17:	89 e8                	mov    %ebp,%eax
  100a19:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
      uint32_t ebp=read_ebp();
  100a1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip=read_eip();
  100a22:	e8 d9 ff ff ff       	call   100a00 <read_eip>
  100a27:	89 45 f0             	mov    %eax,-0x10(%ebp)

      for(int i=0;ebp!=0&i<STACKFRAME_DEPTH;i++){	
  100a2a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a31:	e9 8d 00 00 00       	jmp    100ac3 <print_stackframe+0xb2>
	cprintf("ebp:0x%08x eip:0x%08x args:",ebp,eip);
  100a36:	83 ec 04             	sub    $0x4,%esp
  100a39:	ff 75 f0             	pushl  -0x10(%ebp)
  100a3c:	ff 75 f4             	pushl  -0xc(%ebp)
  100a3f:	68 e4 35 10 00       	push   $0x1035e4
  100a44:	e8 f4 f7 ff ff       	call   10023d <cprintf>
  100a49:	83 c4 10             	add    $0x10,%esp
        uint32_t *args=ebp+2;
  100a4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4f:	83 c0 02             	add    $0x2,%eax
  100a52:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for(int j=0;j<4;j++){
  100a55:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100a5c:	eb 26                	jmp    100a84 <print_stackframe+0x73>
		cprintf("0x%08x ",args[j]);
  100a5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a61:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100a6b:	01 d0                	add    %edx,%eax
  100a6d:	8b 00                	mov    (%eax),%eax
  100a6f:	83 ec 08             	sub    $0x8,%esp
  100a72:	50                   	push   %eax
  100a73:	68 00 36 10 00       	push   $0x103600
  100a78:	e8 c0 f7 ff ff       	call   10023d <cprintf>
  100a7d:	83 c4 10             	add    $0x10,%esp
      uint32_t eip=read_eip();

      for(int i=0;ebp!=0&i<STACKFRAME_DEPTH;i++){	
	cprintf("ebp:0x%08x eip:0x%08x args:",ebp,eip);
        uint32_t *args=ebp+2;
        for(int j=0;j<4;j++){
  100a80:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a84:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a88:	7e d4                	jle    100a5e <print_stackframe+0x4d>
		cprintf("0x%08x ",args[j]);
	}
        cprintf("\n");
  100a8a:	83 ec 0c             	sub    $0xc,%esp
  100a8d:	68 08 36 10 00       	push   $0x103608
  100a92:	e8 a6 f7 ff ff       	call   10023d <cprintf>
  100a97:	83 c4 10             	add    $0x10,%esp
        print_debuginfo(eip-1);
  100a9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a9d:	83 e8 01             	sub    $0x1,%eax
  100aa0:	83 ec 0c             	sub    $0xc,%esp
  100aa3:	50                   	push   %eax
  100aa4:	e8 bb fe ff ff       	call   100964 <print_debuginfo>
  100aa9:	83 c4 10             	add    $0x10,%esp
        eip=((uint32_t *)ebp)[1];
  100aac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aaf:	83 c0 04             	add    $0x4,%eax
  100ab2:	8b 00                	mov    (%eax),%eax
  100ab4:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp=((uint32_t *)ebp)[0];
  100ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aba:	8b 00                	mov    (%eax),%eax
  100abc:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *                   the calling funciton's ebp = ss:[ebp]
      */
      uint32_t ebp=read_ebp();
      uint32_t eip=read_eip();

      for(int i=0;ebp!=0&i<STACKFRAME_DEPTH;i++){	
  100abf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100ac3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ac7:	0f 95 c2             	setne  %dl
  100aca:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100ace:	0f 9e c0             	setle  %al
  100ad1:	21 d0                	and    %edx,%eax
  100ad3:	84 c0                	test   %al,%al
  100ad5:	0f 85 5b ff ff ff    	jne    100a36 <print_stackframe+0x25>
        cprintf("\n");
        print_debuginfo(eip-1);
        eip=((uint32_t *)ebp)[1];
        ebp=((uint32_t *)ebp)[0];
}
}
  100adb:	90                   	nop
  100adc:	c9                   	leave  
  100add:	c3                   	ret    

00100ade <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100ade:	55                   	push   %ebp
  100adf:	89 e5                	mov    %esp,%ebp
  100ae1:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100ae4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100aeb:	eb 0c                	jmp    100af9 <parse+0x1b>
            *buf ++ = '\0';
  100aed:	8b 45 08             	mov    0x8(%ebp),%eax
  100af0:	8d 50 01             	lea    0x1(%eax),%edx
  100af3:	89 55 08             	mov    %edx,0x8(%ebp)
  100af6:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100af9:	8b 45 08             	mov    0x8(%ebp),%eax
  100afc:	0f b6 00             	movzbl (%eax),%eax
  100aff:	84 c0                	test   %al,%al
  100b01:	74 1e                	je     100b21 <parse+0x43>
  100b03:	8b 45 08             	mov    0x8(%ebp),%eax
  100b06:	0f b6 00             	movzbl (%eax),%eax
  100b09:	0f be c0             	movsbl %al,%eax
  100b0c:	83 ec 08             	sub    $0x8,%esp
  100b0f:	50                   	push   %eax
  100b10:	68 8c 36 10 00       	push   $0x10368c
  100b15:	e8 a8 1f 00 00       	call   102ac2 <strchr>
  100b1a:	83 c4 10             	add    $0x10,%esp
  100b1d:	85 c0                	test   %eax,%eax
  100b1f:	75 cc                	jne    100aed <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b21:	8b 45 08             	mov    0x8(%ebp),%eax
  100b24:	0f b6 00             	movzbl (%eax),%eax
  100b27:	84 c0                	test   %al,%al
  100b29:	74 69                	je     100b94 <parse+0xb6>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b2b:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b2f:	75 12                	jne    100b43 <parse+0x65>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b31:	83 ec 08             	sub    $0x8,%esp
  100b34:	6a 10                	push   $0x10
  100b36:	68 91 36 10 00       	push   $0x103691
  100b3b:	e8 fd f6 ff ff       	call   10023d <cprintf>
  100b40:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100b43:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b46:	8d 50 01             	lea    0x1(%eax),%edx
  100b49:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b4c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b53:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b56:	01 c2                	add    %eax,%edx
  100b58:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5b:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b5d:	eb 04                	jmp    100b63 <parse+0x85>
            buf ++;
  100b5f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b63:	8b 45 08             	mov    0x8(%ebp),%eax
  100b66:	0f b6 00             	movzbl (%eax),%eax
  100b69:	84 c0                	test   %al,%al
  100b6b:	0f 84 7a ff ff ff    	je     100aeb <parse+0xd>
  100b71:	8b 45 08             	mov    0x8(%ebp),%eax
  100b74:	0f b6 00             	movzbl (%eax),%eax
  100b77:	0f be c0             	movsbl %al,%eax
  100b7a:	83 ec 08             	sub    $0x8,%esp
  100b7d:	50                   	push   %eax
  100b7e:	68 8c 36 10 00       	push   $0x10368c
  100b83:	e8 3a 1f 00 00       	call   102ac2 <strchr>
  100b88:	83 c4 10             	add    $0x10,%esp
  100b8b:	85 c0                	test   %eax,%eax
  100b8d:	74 d0                	je     100b5f <parse+0x81>
            buf ++;
        }
    }
  100b8f:	e9 57 ff ff ff       	jmp    100aeb <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100b94:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b95:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b98:	c9                   	leave  
  100b99:	c3                   	ret    

00100b9a <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b9a:	55                   	push   %ebp
  100b9b:	89 e5                	mov    %esp,%ebp
  100b9d:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100ba0:	83 ec 08             	sub    $0x8,%esp
  100ba3:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100ba6:	50                   	push   %eax
  100ba7:	ff 75 08             	pushl  0x8(%ebp)
  100baa:	e8 2f ff ff ff       	call   100ade <parse>
  100baf:	83 c4 10             	add    $0x10,%esp
  100bb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bb5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bb9:	75 0a                	jne    100bc5 <runcmd+0x2b>
        return 0;
  100bbb:	b8 00 00 00 00       	mov    $0x0,%eax
  100bc0:	e9 83 00 00 00       	jmp    100c48 <runcmd+0xae>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bc5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bcc:	eb 59                	jmp    100c27 <runcmd+0x8d>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bce:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bd1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bd4:	89 d0                	mov    %edx,%eax
  100bd6:	01 c0                	add    %eax,%eax
  100bd8:	01 d0                	add    %edx,%eax
  100bda:	c1 e0 02             	shl    $0x2,%eax
  100bdd:	05 00 e0 10 00       	add    $0x10e000,%eax
  100be2:	8b 00                	mov    (%eax),%eax
  100be4:	83 ec 08             	sub    $0x8,%esp
  100be7:	51                   	push   %ecx
  100be8:	50                   	push   %eax
  100be9:	e8 34 1e 00 00       	call   102a22 <strcmp>
  100bee:	83 c4 10             	add    $0x10,%esp
  100bf1:	85 c0                	test   %eax,%eax
  100bf3:	75 2e                	jne    100c23 <runcmd+0x89>
            return commands[i].func(argc - 1, argv + 1, tf);
  100bf5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bf8:	89 d0                	mov    %edx,%eax
  100bfa:	01 c0                	add    %eax,%eax
  100bfc:	01 d0                	add    %edx,%eax
  100bfe:	c1 e0 02             	shl    $0x2,%eax
  100c01:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c06:	8b 10                	mov    (%eax),%edx
  100c08:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c0b:	83 c0 04             	add    $0x4,%eax
  100c0e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c11:	83 e9 01             	sub    $0x1,%ecx
  100c14:	83 ec 04             	sub    $0x4,%esp
  100c17:	ff 75 0c             	pushl  0xc(%ebp)
  100c1a:	50                   	push   %eax
  100c1b:	51                   	push   %ecx
  100c1c:	ff d2                	call   *%edx
  100c1e:	83 c4 10             	add    $0x10,%esp
  100c21:	eb 25                	jmp    100c48 <runcmd+0xae>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c23:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c27:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c2a:	83 f8 02             	cmp    $0x2,%eax
  100c2d:	76 9f                	jbe    100bce <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c2f:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c32:	83 ec 08             	sub    $0x8,%esp
  100c35:	50                   	push   %eax
  100c36:	68 af 36 10 00       	push   $0x1036af
  100c3b:	e8 fd f5 ff ff       	call   10023d <cprintf>
  100c40:	83 c4 10             	add    $0x10,%esp
    return 0;
  100c43:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c48:	c9                   	leave  
  100c49:	c3                   	ret    

00100c4a <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c4a:	55                   	push   %ebp
  100c4b:	89 e5                	mov    %esp,%ebp
  100c4d:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c50:	83 ec 0c             	sub    $0xc,%esp
  100c53:	68 c8 36 10 00       	push   $0x1036c8
  100c58:	e8 e0 f5 ff ff       	call   10023d <cprintf>
  100c5d:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c60:	83 ec 0c             	sub    $0xc,%esp
  100c63:	68 f0 36 10 00       	push   $0x1036f0
  100c68:	e8 d0 f5 ff ff       	call   10023d <cprintf>
  100c6d:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c70:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c74:	74 0e                	je     100c84 <kmonitor+0x3a>
        print_trapframe(tf);
  100c76:	83 ec 0c             	sub    $0xc,%esp
  100c79:	ff 75 08             	pushl  0x8(%ebp)
  100c7c:	e8 31 0d 00 00       	call   1019b2 <print_trapframe>
  100c81:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c84:	83 ec 0c             	sub    $0xc,%esp
  100c87:	68 15 37 10 00       	push   $0x103715
  100c8c:	e8 50 f6 ff ff       	call   1002e1 <readline>
  100c91:	83 c4 10             	add    $0x10,%esp
  100c94:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c97:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c9b:	74 e7                	je     100c84 <kmonitor+0x3a>
            if (runcmd(buf, tf) < 0) {
  100c9d:	83 ec 08             	sub    $0x8,%esp
  100ca0:	ff 75 08             	pushl  0x8(%ebp)
  100ca3:	ff 75 f4             	pushl  -0xc(%ebp)
  100ca6:	e8 ef fe ff ff       	call   100b9a <runcmd>
  100cab:	83 c4 10             	add    $0x10,%esp
  100cae:	85 c0                	test   %eax,%eax
  100cb0:	78 02                	js     100cb4 <kmonitor+0x6a>
                break;
            }
        }
    }
  100cb2:	eb d0                	jmp    100c84 <kmonitor+0x3a>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100cb4:	90                   	nop
            }
        }
    }
}
  100cb5:	90                   	nop
  100cb6:	c9                   	leave  
  100cb7:	c3                   	ret    

00100cb8 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cb8:	55                   	push   %ebp
  100cb9:	89 e5                	mov    %esp,%ebp
  100cbb:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cbe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cc5:	eb 3c                	jmp    100d03 <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cc7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cca:	89 d0                	mov    %edx,%eax
  100ccc:	01 c0                	add    %eax,%eax
  100cce:	01 d0                	add    %edx,%eax
  100cd0:	c1 e0 02             	shl    $0x2,%eax
  100cd3:	05 04 e0 10 00       	add    $0x10e004,%eax
  100cd8:	8b 08                	mov    (%eax),%ecx
  100cda:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cdd:	89 d0                	mov    %edx,%eax
  100cdf:	01 c0                	add    %eax,%eax
  100ce1:	01 d0                	add    %edx,%eax
  100ce3:	c1 e0 02             	shl    $0x2,%eax
  100ce6:	05 00 e0 10 00       	add    $0x10e000,%eax
  100ceb:	8b 00                	mov    (%eax),%eax
  100ced:	83 ec 04             	sub    $0x4,%esp
  100cf0:	51                   	push   %ecx
  100cf1:	50                   	push   %eax
  100cf2:	68 19 37 10 00       	push   $0x103719
  100cf7:	e8 41 f5 ff ff       	call   10023d <cprintf>
  100cfc:	83 c4 10             	add    $0x10,%esp

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100d03:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d06:	83 f8 02             	cmp    $0x2,%eax
  100d09:	76 bc                	jbe    100cc7 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100d0b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d10:	c9                   	leave  
  100d11:	c3                   	ret    

00100d12 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d12:	55                   	push   %ebp
  100d13:	89 e5                	mov    %esp,%ebp
  100d15:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d18:	e8 aa fb ff ff       	call   1008c7 <print_kerninfo>
    return 0;
  100d1d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d22:	c9                   	leave  
  100d23:	c3                   	ret    

00100d24 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d24:	55                   	push   %ebp
  100d25:	89 e5                	mov    %esp,%ebp
  100d27:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d2a:	e8 e2 fc ff ff       	call   100a11 <print_stackframe>
    return 0;
  100d2f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d34:	c9                   	leave  
  100d35:	c3                   	ret    

00100d36 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d36:	55                   	push   %ebp
  100d37:	89 e5                	mov    %esp,%ebp
  100d39:	83 ec 18             	sub    $0x18,%esp
  100d3c:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d42:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d46:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d4a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d4e:	ee                   	out    %al,(%dx)
  100d4f:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100d55:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100d59:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100d5d:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100d61:	ee                   	out    %al,(%dx)
  100d62:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d68:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100d6c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d70:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d74:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d75:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d7c:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d7f:	83 ec 0c             	sub    $0xc,%esp
  100d82:	68 22 37 10 00       	push   $0x103722
  100d87:	e8 b1 f4 ff ff       	call   10023d <cprintf>
  100d8c:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d8f:	83 ec 0c             	sub    $0xc,%esp
  100d92:	6a 00                	push   $0x0
  100d94:	e8 ce 08 00 00       	call   101667 <pic_enable>
  100d99:	83 c4 10             	add    $0x10,%esp
}
  100d9c:	90                   	nop
  100d9d:	c9                   	leave  
  100d9e:	c3                   	ret    

00100d9f <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d9f:	55                   	push   %ebp
  100da0:	89 e5                	mov    %esp,%ebp
  100da2:	83 ec 10             	sub    $0x10,%esp
  100da5:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dab:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100daf:	89 c2                	mov    %eax,%edx
  100db1:	ec                   	in     (%dx),%al
  100db2:	88 45 f4             	mov    %al,-0xc(%ebp)
  100db5:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100dbb:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  100dbf:	89 c2                	mov    %eax,%edx
  100dc1:	ec                   	in     (%dx),%al
  100dc2:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dc5:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dcb:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dcf:	89 c2                	mov    %eax,%edx
  100dd1:	ec                   	in     (%dx),%al
  100dd2:	88 45 f6             	mov    %al,-0xa(%ebp)
  100dd5:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100ddb:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100ddf:	89 c2                	mov    %eax,%edx
  100de1:	ec                   	in     (%dx),%al
  100de2:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100de5:	90                   	nop
  100de6:	c9                   	leave  
  100de7:	c3                   	ret    

00100de8 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100de8:	55                   	push   %ebp
  100de9:	89 e5                	mov    %esp,%ebp
  100deb:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100dee:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100df5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100df8:	0f b7 00             	movzwl (%eax),%eax
  100dfb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100dff:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e02:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e07:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e0a:	0f b7 00             	movzwl (%eax),%eax
  100e0d:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e11:	74 12                	je     100e25 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e13:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e1a:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e21:	b4 03 
  100e23:	eb 13                	jmp    100e38 <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e25:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e28:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e2c:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e2f:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e36:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e38:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e3f:	0f b7 c0             	movzwl %ax,%eax
  100e42:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e46:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e4a:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e4e:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100e52:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e53:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e5a:	83 c0 01             	add    $0x1,%eax
  100e5d:	0f b7 c0             	movzwl %ax,%eax
  100e60:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e64:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e68:	89 c2                	mov    %eax,%edx
  100e6a:	ec                   	in     (%dx),%al
  100e6b:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100e6e:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e72:	0f b6 c0             	movzbl %al,%eax
  100e75:	c1 e0 08             	shl    $0x8,%eax
  100e78:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e7b:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e82:	0f b7 c0             	movzwl %ax,%eax
  100e85:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100e89:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e8d:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100e91:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100e95:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e96:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e9d:	83 c0 01             	add    $0x1,%eax
  100ea0:	0f b7 c0             	movzwl %ax,%eax
  100ea3:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ea7:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100eab:	89 c2                	mov    %eax,%edx
  100ead:	ec                   	in     (%dx),%al
  100eae:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100eb1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100eb5:	0f b6 c0             	movzbl %al,%eax
  100eb8:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ebb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ebe:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ec3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ec6:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ecc:	90                   	nop
  100ecd:	c9                   	leave  
  100ece:	c3                   	ret    

00100ecf <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ecf:	55                   	push   %ebp
  100ed0:	89 e5                	mov    %esp,%ebp
  100ed2:	83 ec 28             	sub    $0x28,%esp
  100ed5:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100edb:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100edf:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100ee3:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ee7:	ee                   	out    %al,(%dx)
  100ee8:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100eee:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100ef2:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100ef6:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100efa:	ee                   	out    %al,(%dx)
  100efb:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100f01:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100f05:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100f09:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f0d:	ee                   	out    %al,(%dx)
  100f0e:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100f14:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f18:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f1c:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100f20:	ee                   	out    %al,(%dx)
  100f21:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f27:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f2b:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f2f:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f33:	ee                   	out    %al,(%dx)
  100f34:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f3a:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f3e:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f42:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  100f46:	ee                   	out    %al,(%dx)
  100f47:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f4d:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f51:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f55:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f59:	ee                   	out    %al,(%dx)
  100f5a:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f60:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
  100f64:	89 c2                	mov    %eax,%edx
  100f66:	ec                   	in     (%dx),%al
  100f67:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100f6a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f6e:	3c ff                	cmp    $0xff,%al
  100f70:	0f 95 c0             	setne  %al
  100f73:	0f b6 c0             	movzbl %al,%eax
  100f76:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f7b:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f81:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100f85:	89 c2                	mov    %eax,%edx
  100f87:	ec                   	in     (%dx),%al
  100f88:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100f8b:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100f91:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f95:	89 c2                	mov    %eax,%edx
  100f97:	ec                   	in     (%dx),%al
  100f98:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f9b:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fa0:	85 c0                	test   %eax,%eax
  100fa2:	74 0d                	je     100fb1 <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100fa4:	83 ec 0c             	sub    $0xc,%esp
  100fa7:	6a 04                	push   $0x4
  100fa9:	e8 b9 06 00 00       	call   101667 <pic_enable>
  100fae:	83 c4 10             	add    $0x10,%esp
    }
}
  100fb1:	90                   	nop
  100fb2:	c9                   	leave  
  100fb3:	c3                   	ret    

00100fb4 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fb4:	55                   	push   %ebp
  100fb5:	89 e5                	mov    %esp,%ebp
  100fb7:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fc1:	eb 09                	jmp    100fcc <lpt_putc_sub+0x18>
        delay();
  100fc3:	e8 d7 fd ff ff       	call   100d9f <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fc8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fcc:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  100fd2:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100fd6:	89 c2                	mov    %eax,%edx
  100fd8:	ec                   	in     (%dx),%al
  100fd9:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  100fdc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100fe0:	84 c0                	test   %al,%al
  100fe2:	78 09                	js     100fed <lpt_putc_sub+0x39>
  100fe4:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100feb:	7e d6                	jle    100fc3 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fed:	8b 45 08             	mov    0x8(%ebp),%eax
  100ff0:	0f b6 c0             	movzbl %al,%eax
  100ff3:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  100ff9:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ffc:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  101000:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  101004:	ee                   	out    %al,(%dx)
  101005:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10100b:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10100f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101013:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101017:	ee                   	out    %al,(%dx)
  101018:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  10101e:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  101022:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  101026:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10102a:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10102b:	90                   	nop
  10102c:	c9                   	leave  
  10102d:	c3                   	ret    

0010102e <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10102e:	55                   	push   %ebp
  10102f:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101031:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101035:	74 0d                	je     101044 <lpt_putc+0x16>
        lpt_putc_sub(c);
  101037:	ff 75 08             	pushl  0x8(%ebp)
  10103a:	e8 75 ff ff ff       	call   100fb4 <lpt_putc_sub>
  10103f:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101042:	eb 1e                	jmp    101062 <lpt_putc+0x34>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  101044:	6a 08                	push   $0x8
  101046:	e8 69 ff ff ff       	call   100fb4 <lpt_putc_sub>
  10104b:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  10104e:	6a 20                	push   $0x20
  101050:	e8 5f ff ff ff       	call   100fb4 <lpt_putc_sub>
  101055:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101058:	6a 08                	push   $0x8
  10105a:	e8 55 ff ff ff       	call   100fb4 <lpt_putc_sub>
  10105f:	83 c4 04             	add    $0x4,%esp
    }
}
  101062:	90                   	nop
  101063:	c9                   	leave  
  101064:	c3                   	ret    

00101065 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101065:	55                   	push   %ebp
  101066:	89 e5                	mov    %esp,%ebp
  101068:	53                   	push   %ebx
  101069:	83 ec 14             	sub    $0x14,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10106c:	8b 45 08             	mov    0x8(%ebp),%eax
  10106f:	b0 00                	mov    $0x0,%al
  101071:	85 c0                	test   %eax,%eax
  101073:	75 07                	jne    10107c <cga_putc+0x17>
        c |= 0x0700;
  101075:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10107c:	8b 45 08             	mov    0x8(%ebp),%eax
  10107f:	0f b6 c0             	movzbl %al,%eax
  101082:	83 f8 0a             	cmp    $0xa,%eax
  101085:	74 4e                	je     1010d5 <cga_putc+0x70>
  101087:	83 f8 0d             	cmp    $0xd,%eax
  10108a:	74 59                	je     1010e5 <cga_putc+0x80>
  10108c:	83 f8 08             	cmp    $0x8,%eax
  10108f:	0f 85 8a 00 00 00    	jne    10111f <cga_putc+0xba>
    case '\b':
        if (crt_pos > 0) {
  101095:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10109c:	66 85 c0             	test   %ax,%ax
  10109f:	0f 84 a0 00 00 00    	je     101145 <cga_putc+0xe0>
            crt_pos --;
  1010a5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010ac:	83 e8 01             	sub    $0x1,%eax
  1010af:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010b5:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010ba:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010c1:	0f b7 d2             	movzwl %dx,%edx
  1010c4:	01 d2                	add    %edx,%edx
  1010c6:	01 d0                	add    %edx,%eax
  1010c8:	8b 55 08             	mov    0x8(%ebp),%edx
  1010cb:	b2 00                	mov    $0x0,%dl
  1010cd:	83 ca 20             	or     $0x20,%edx
  1010d0:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010d3:	eb 70                	jmp    101145 <cga_putc+0xe0>
    case '\n':
        crt_pos += CRT_COLS;
  1010d5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010dc:	83 c0 50             	add    $0x50,%eax
  1010df:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010e5:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  1010ec:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1010f3:	0f b7 c1             	movzwl %cx,%eax
  1010f6:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1010fc:	c1 e8 10             	shr    $0x10,%eax
  1010ff:	89 c2                	mov    %eax,%edx
  101101:	66 c1 ea 06          	shr    $0x6,%dx
  101105:	89 d0                	mov    %edx,%eax
  101107:	c1 e0 02             	shl    $0x2,%eax
  10110a:	01 d0                	add    %edx,%eax
  10110c:	c1 e0 04             	shl    $0x4,%eax
  10110f:	29 c1                	sub    %eax,%ecx
  101111:	89 ca                	mov    %ecx,%edx
  101113:	89 d8                	mov    %ebx,%eax
  101115:	29 d0                	sub    %edx,%eax
  101117:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10111d:	eb 27                	jmp    101146 <cga_putc+0xe1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10111f:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101125:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10112c:	8d 50 01             	lea    0x1(%eax),%edx
  10112f:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101136:	0f b7 c0             	movzwl %ax,%eax
  101139:	01 c0                	add    %eax,%eax
  10113b:	01 c8                	add    %ecx,%eax
  10113d:	8b 55 08             	mov    0x8(%ebp),%edx
  101140:	66 89 10             	mov    %dx,(%eax)
        break;
  101143:	eb 01                	jmp    101146 <cga_putc+0xe1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  101145:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101146:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10114d:	66 3d cf 07          	cmp    $0x7cf,%ax
  101151:	76 59                	jbe    1011ac <cga_putc+0x147>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101153:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101158:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10115e:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101163:	83 ec 04             	sub    $0x4,%esp
  101166:	68 00 0f 00 00       	push   $0xf00
  10116b:	52                   	push   %edx
  10116c:	50                   	push   %eax
  10116d:	e8 4f 1b 00 00       	call   102cc1 <memmove>
  101172:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101175:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10117c:	eb 15                	jmp    101193 <cga_putc+0x12e>
            crt_buf[i] = 0x0700 | ' ';
  10117e:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101183:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101186:	01 d2                	add    %edx,%edx
  101188:	01 d0                	add    %edx,%eax
  10118a:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10118f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101193:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  10119a:	7e e2                	jle    10117e <cga_putc+0x119>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  10119c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011a3:	83 e8 50             	sub    $0x50,%eax
  1011a6:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011ac:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011b3:	0f b7 c0             	movzwl %ax,%eax
  1011b6:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011ba:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  1011be:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  1011c2:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011c6:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011c7:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ce:	66 c1 e8 08          	shr    $0x8,%ax
  1011d2:	0f b6 c0             	movzbl %al,%eax
  1011d5:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011dc:	83 c2 01             	add    $0x1,%edx
  1011df:	0f b7 d2             	movzwl %dx,%edx
  1011e2:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  1011e6:	88 45 e9             	mov    %al,-0x17(%ebp)
  1011e9:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1011ed:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  1011f1:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011f2:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011f9:	0f b7 c0             	movzwl %ax,%eax
  1011fc:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101200:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  101204:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  101208:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10120c:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10120d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101214:	0f b6 c0             	movzbl %al,%eax
  101217:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10121e:	83 c2 01             	add    $0x1,%edx
  101221:	0f b7 d2             	movzwl %dx,%edx
  101224:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  101228:	88 45 eb             	mov    %al,-0x15(%ebp)
  10122b:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  10122f:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101233:	ee                   	out    %al,(%dx)
}
  101234:	90                   	nop
  101235:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101238:	c9                   	leave  
  101239:	c3                   	ret    

0010123a <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10123a:	55                   	push   %ebp
  10123b:	89 e5                	mov    %esp,%ebp
  10123d:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101240:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101247:	eb 09                	jmp    101252 <serial_putc_sub+0x18>
        delay();
  101249:	e8 51 fb ff ff       	call   100d9f <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10124e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101252:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101258:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  10125c:	89 c2                	mov    %eax,%edx
  10125e:	ec                   	in     (%dx),%al
  10125f:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101262:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  101266:	0f b6 c0             	movzbl %al,%eax
  101269:	83 e0 20             	and    $0x20,%eax
  10126c:	85 c0                	test   %eax,%eax
  10126e:	75 09                	jne    101279 <serial_putc_sub+0x3f>
  101270:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101277:	7e d0                	jle    101249 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101279:	8b 45 08             	mov    0x8(%ebp),%eax
  10127c:	0f b6 c0             	movzbl %al,%eax
  10127f:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  101285:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101288:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  10128c:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101290:	ee                   	out    %al,(%dx)
}
  101291:	90                   	nop
  101292:	c9                   	leave  
  101293:	c3                   	ret    

00101294 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101294:	55                   	push   %ebp
  101295:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101297:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10129b:	74 0d                	je     1012aa <serial_putc+0x16>
        serial_putc_sub(c);
  10129d:	ff 75 08             	pushl  0x8(%ebp)
  1012a0:	e8 95 ff ff ff       	call   10123a <serial_putc_sub>
  1012a5:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012a8:	eb 1e                	jmp    1012c8 <serial_putc+0x34>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  1012aa:	6a 08                	push   $0x8
  1012ac:	e8 89 ff ff ff       	call   10123a <serial_putc_sub>
  1012b1:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  1012b4:	6a 20                	push   $0x20
  1012b6:	e8 7f ff ff ff       	call   10123a <serial_putc_sub>
  1012bb:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1012be:	6a 08                	push   $0x8
  1012c0:	e8 75 ff ff ff       	call   10123a <serial_putc_sub>
  1012c5:	83 c4 04             	add    $0x4,%esp
    }
}
  1012c8:	90                   	nop
  1012c9:	c9                   	leave  
  1012ca:	c3                   	ret    

001012cb <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012cb:	55                   	push   %ebp
  1012cc:	89 e5                	mov    %esp,%ebp
  1012ce:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012d1:	eb 33                	jmp    101306 <cons_intr+0x3b>
        if (c != 0) {
  1012d3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012d7:	74 2d                	je     101306 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012d9:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012de:	8d 50 01             	lea    0x1(%eax),%edx
  1012e1:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  1012e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012ea:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1012f0:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012f5:	3d 00 02 00 00       	cmp    $0x200,%eax
  1012fa:	75 0a                	jne    101306 <cons_intr+0x3b>
                cons.wpos = 0;
  1012fc:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101303:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101306:	8b 45 08             	mov    0x8(%ebp),%eax
  101309:	ff d0                	call   *%eax
  10130b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10130e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101312:	75 bf                	jne    1012d3 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101314:	90                   	nop
  101315:	c9                   	leave  
  101316:	c3                   	ret    

00101317 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101317:	55                   	push   %ebp
  101318:	89 e5                	mov    %esp,%ebp
  10131a:	83 ec 10             	sub    $0x10,%esp
  10131d:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101323:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101327:	89 c2                	mov    %eax,%edx
  101329:	ec                   	in     (%dx),%al
  10132a:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  10132d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101331:	0f b6 c0             	movzbl %al,%eax
  101334:	83 e0 01             	and    $0x1,%eax
  101337:	85 c0                	test   %eax,%eax
  101339:	75 07                	jne    101342 <serial_proc_data+0x2b>
        return -1;
  10133b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101340:	eb 2a                	jmp    10136c <serial_proc_data+0x55>
  101342:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101348:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10134c:	89 c2                	mov    %eax,%edx
  10134e:	ec                   	in     (%dx),%al
  10134f:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  101352:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101356:	0f b6 c0             	movzbl %al,%eax
  101359:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10135c:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101360:	75 07                	jne    101369 <serial_proc_data+0x52>
        c = '\b';
  101362:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101369:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10136c:	c9                   	leave  
  10136d:	c3                   	ret    

0010136e <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10136e:	55                   	push   %ebp
  10136f:	89 e5                	mov    %esp,%ebp
  101371:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  101374:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101379:	85 c0                	test   %eax,%eax
  10137b:	74 10                	je     10138d <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  10137d:	83 ec 0c             	sub    $0xc,%esp
  101380:	68 17 13 10 00       	push   $0x101317
  101385:	e8 41 ff ff ff       	call   1012cb <cons_intr>
  10138a:	83 c4 10             	add    $0x10,%esp
    }
}
  10138d:	90                   	nop
  10138e:	c9                   	leave  
  10138f:	c3                   	ret    

00101390 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101390:	55                   	push   %ebp
  101391:	89 e5                	mov    %esp,%ebp
  101393:	83 ec 18             	sub    $0x18,%esp
  101396:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10139c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013a0:	89 c2                	mov    %eax,%edx
  1013a2:	ec                   	in     (%dx),%al
  1013a3:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013a6:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013aa:	0f b6 c0             	movzbl %al,%eax
  1013ad:	83 e0 01             	and    $0x1,%eax
  1013b0:	85 c0                	test   %eax,%eax
  1013b2:	75 0a                	jne    1013be <kbd_proc_data+0x2e>
        return -1;
  1013b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013b9:	e9 5d 01 00 00       	jmp    10151b <kbd_proc_data+0x18b>
  1013be:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c4:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013c8:	89 c2                	mov    %eax,%edx
  1013ca:	ec                   	in     (%dx),%al
  1013cb:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  1013ce:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013d2:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013d5:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013d9:	75 17                	jne    1013f2 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013db:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013e0:	83 c8 40             	or     $0x40,%eax
  1013e3:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013e8:	b8 00 00 00 00       	mov    $0x0,%eax
  1013ed:	e9 29 01 00 00       	jmp    10151b <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  1013f2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013f6:	84 c0                	test   %al,%al
  1013f8:	79 47                	jns    101441 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1013fa:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013ff:	83 e0 40             	and    $0x40,%eax
  101402:	85 c0                	test   %eax,%eax
  101404:	75 09                	jne    10140f <kbd_proc_data+0x7f>
  101406:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10140a:	83 e0 7f             	and    $0x7f,%eax
  10140d:	eb 04                	jmp    101413 <kbd_proc_data+0x83>
  10140f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101413:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101416:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10141a:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101421:	83 c8 40             	or     $0x40,%eax
  101424:	0f b6 c0             	movzbl %al,%eax
  101427:	f7 d0                	not    %eax
  101429:	89 c2                	mov    %eax,%edx
  10142b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101430:	21 d0                	and    %edx,%eax
  101432:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101437:	b8 00 00 00 00       	mov    $0x0,%eax
  10143c:	e9 da 00 00 00       	jmp    10151b <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  101441:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101446:	83 e0 40             	and    $0x40,%eax
  101449:	85 c0                	test   %eax,%eax
  10144b:	74 11                	je     10145e <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10144d:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101451:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101456:	83 e0 bf             	and    $0xffffffbf,%eax
  101459:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  10145e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101462:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101469:	0f b6 d0             	movzbl %al,%edx
  10146c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101471:	09 d0                	or     %edx,%eax
  101473:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101478:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10147c:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  101483:	0f b6 d0             	movzbl %al,%edx
  101486:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10148b:	31 d0                	xor    %edx,%eax
  10148d:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  101492:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101497:	83 e0 03             	and    $0x3,%eax
  10149a:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014a1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a5:	01 d0                	add    %edx,%eax
  1014a7:	0f b6 00             	movzbl (%eax),%eax
  1014aa:	0f b6 c0             	movzbl %al,%eax
  1014ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014b0:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b5:	83 e0 08             	and    $0x8,%eax
  1014b8:	85 c0                	test   %eax,%eax
  1014ba:	74 22                	je     1014de <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014bc:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014c0:	7e 0c                	jle    1014ce <kbd_proc_data+0x13e>
  1014c2:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014c6:	7f 06                	jg     1014ce <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014c8:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014cc:	eb 10                	jmp    1014de <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014ce:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014d2:	7e 0a                	jle    1014de <kbd_proc_data+0x14e>
  1014d4:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014d8:	7f 04                	jg     1014de <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014da:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014de:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014e3:	f7 d0                	not    %eax
  1014e5:	83 e0 06             	and    $0x6,%eax
  1014e8:	85 c0                	test   %eax,%eax
  1014ea:	75 2c                	jne    101518 <kbd_proc_data+0x188>
  1014ec:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014f3:	75 23                	jne    101518 <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  1014f5:	83 ec 0c             	sub    $0xc,%esp
  1014f8:	68 3d 37 10 00       	push   $0x10373d
  1014fd:	e8 3b ed ff ff       	call   10023d <cprintf>
  101502:	83 c4 10             	add    $0x10,%esp
  101505:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  10150b:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10150f:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101513:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101517:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101518:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10151b:	c9                   	leave  
  10151c:	c3                   	ret    

0010151d <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10151d:	55                   	push   %ebp
  10151e:	89 e5                	mov    %esp,%ebp
  101520:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  101523:	83 ec 0c             	sub    $0xc,%esp
  101526:	68 90 13 10 00       	push   $0x101390
  10152b:	e8 9b fd ff ff       	call   1012cb <cons_intr>
  101530:	83 c4 10             	add    $0x10,%esp
}
  101533:	90                   	nop
  101534:	c9                   	leave  
  101535:	c3                   	ret    

00101536 <kbd_init>:

static void
kbd_init(void) {
  101536:	55                   	push   %ebp
  101537:	89 e5                	mov    %esp,%ebp
  101539:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  10153c:	e8 dc ff ff ff       	call   10151d <kbd_intr>
    pic_enable(IRQ_KBD);
  101541:	83 ec 0c             	sub    $0xc,%esp
  101544:	6a 01                	push   $0x1
  101546:	e8 1c 01 00 00       	call   101667 <pic_enable>
  10154b:	83 c4 10             	add    $0x10,%esp
}
  10154e:	90                   	nop
  10154f:	c9                   	leave  
  101550:	c3                   	ret    

00101551 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101551:	55                   	push   %ebp
  101552:	89 e5                	mov    %esp,%ebp
  101554:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  101557:	e8 8c f8 ff ff       	call   100de8 <cga_init>
    serial_init();
  10155c:	e8 6e f9 ff ff       	call   100ecf <serial_init>
    kbd_init();
  101561:	e8 d0 ff ff ff       	call   101536 <kbd_init>
    if (!serial_exists) {
  101566:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10156b:	85 c0                	test   %eax,%eax
  10156d:	75 10                	jne    10157f <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  10156f:	83 ec 0c             	sub    $0xc,%esp
  101572:	68 49 37 10 00       	push   $0x103749
  101577:	e8 c1 ec ff ff       	call   10023d <cprintf>
  10157c:	83 c4 10             	add    $0x10,%esp
    }
}
  10157f:	90                   	nop
  101580:	c9                   	leave  
  101581:	c3                   	ret    

00101582 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101582:	55                   	push   %ebp
  101583:	89 e5                	mov    %esp,%ebp
  101585:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  101588:	ff 75 08             	pushl  0x8(%ebp)
  10158b:	e8 9e fa ff ff       	call   10102e <lpt_putc>
  101590:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  101593:	83 ec 0c             	sub    $0xc,%esp
  101596:	ff 75 08             	pushl  0x8(%ebp)
  101599:	e8 c7 fa ff ff       	call   101065 <cga_putc>
  10159e:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  1015a1:	83 ec 0c             	sub    $0xc,%esp
  1015a4:	ff 75 08             	pushl  0x8(%ebp)
  1015a7:	e8 e8 fc ff ff       	call   101294 <serial_putc>
  1015ac:	83 c4 10             	add    $0x10,%esp
}
  1015af:	90                   	nop
  1015b0:	c9                   	leave  
  1015b1:	c3                   	ret    

001015b2 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015b2:	55                   	push   %ebp
  1015b3:	89 e5                	mov    %esp,%ebp
  1015b5:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015b8:	e8 b1 fd ff ff       	call   10136e <serial_intr>
    kbd_intr();
  1015bd:	e8 5b ff ff ff       	call   10151d <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015c2:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015c8:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015cd:	39 c2                	cmp    %eax,%edx
  1015cf:	74 36                	je     101607 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015d1:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015d6:	8d 50 01             	lea    0x1(%eax),%edx
  1015d9:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015df:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015e6:	0f b6 c0             	movzbl %al,%eax
  1015e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015ec:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015f1:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015f6:	75 0a                	jne    101602 <cons_getc+0x50>
            cons.rpos = 0;
  1015f8:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  1015ff:	00 00 00 
        }
        return c;
  101602:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101605:	eb 05                	jmp    10160c <cons_getc+0x5a>
    }
    return 0;
  101607:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10160c:	c9                   	leave  
  10160d:	c3                   	ret    

0010160e <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10160e:	55                   	push   %ebp
  10160f:	89 e5                	mov    %esp,%ebp
  101611:	83 ec 14             	sub    $0x14,%esp
  101614:	8b 45 08             	mov    0x8(%ebp),%eax
  101617:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10161b:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10161f:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101625:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  10162a:	85 c0                	test   %eax,%eax
  10162c:	74 36                	je     101664 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10162e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101632:	0f b6 c0             	movzbl %al,%eax
  101635:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  10163b:	88 45 fa             	mov    %al,-0x6(%ebp)
  10163e:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  101642:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101646:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101647:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10164b:	66 c1 e8 08          	shr    $0x8,%ax
  10164f:	0f b6 c0             	movzbl %al,%eax
  101652:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101658:	88 45 fb             	mov    %al,-0x5(%ebp)
  10165b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  10165f:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  101663:	ee                   	out    %al,(%dx)
    }
}
  101664:	90                   	nop
  101665:	c9                   	leave  
  101666:	c3                   	ret    

00101667 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101667:	55                   	push   %ebp
  101668:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  10166a:	8b 45 08             	mov    0x8(%ebp),%eax
  10166d:	ba 01 00 00 00       	mov    $0x1,%edx
  101672:	89 c1                	mov    %eax,%ecx
  101674:	d3 e2                	shl    %cl,%edx
  101676:	89 d0                	mov    %edx,%eax
  101678:	f7 d0                	not    %eax
  10167a:	89 c2                	mov    %eax,%edx
  10167c:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101683:	21 d0                	and    %edx,%eax
  101685:	0f b7 c0             	movzwl %ax,%eax
  101688:	50                   	push   %eax
  101689:	e8 80 ff ff ff       	call   10160e <pic_setmask>
  10168e:	83 c4 04             	add    $0x4,%esp
}
  101691:	90                   	nop
  101692:	c9                   	leave  
  101693:	c3                   	ret    

00101694 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101694:	55                   	push   %ebp
  101695:	89 e5                	mov    %esp,%ebp
  101697:	83 ec 30             	sub    $0x30,%esp
    did_init = 1;
  10169a:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016a1:	00 00 00 
  1016a4:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016aa:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  1016ae:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  1016b2:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016b6:	ee                   	out    %al,(%dx)
  1016b7:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  1016bd:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  1016c1:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  1016c5:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1016c9:	ee                   	out    %al,(%dx)
  1016ca:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  1016d0:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  1016d4:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  1016d8:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016dc:	ee                   	out    %al,(%dx)
  1016dd:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  1016e3:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  1016e7:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1016eb:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  1016ef:	ee                   	out    %al,(%dx)
  1016f0:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  1016f6:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  1016fa:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  1016fe:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101702:	ee                   	out    %al,(%dx)
  101703:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  101709:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  10170d:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  101711:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  101715:	ee                   	out    %al,(%dx)
  101716:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  10171c:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  101720:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  101724:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101728:	ee                   	out    %al,(%dx)
  101729:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  10172f:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  101733:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101737:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  10173b:	ee                   	out    %al,(%dx)
  10173c:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101742:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  101746:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  10174a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10174e:	ee                   	out    %al,(%dx)
  10174f:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  101755:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  101759:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  10175d:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101761:	ee                   	out    %al,(%dx)
  101762:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  101768:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  10176c:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  101770:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101774:	ee                   	out    %al,(%dx)
  101775:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  10177b:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  10177f:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101783:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101787:	ee                   	out    %al,(%dx)
  101788:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  10178e:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  101792:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  101796:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10179a:	ee                   	out    %al,(%dx)
  10179b:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  1017a1:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  1017a5:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1017a9:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  1017ad:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017ae:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017b5:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017b9:	74 13                	je     1017ce <pic_init+0x13a>
        pic_setmask(irq_mask);
  1017bb:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017c2:	0f b7 c0             	movzwl %ax,%eax
  1017c5:	50                   	push   %eax
  1017c6:	e8 43 fe ff ff       	call   10160e <pic_setmask>
  1017cb:	83 c4 04             	add    $0x4,%esp
    }
}
  1017ce:	90                   	nop
  1017cf:	c9                   	leave  
  1017d0:	c3                   	ret    

001017d1 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017d1:	55                   	push   %ebp
  1017d2:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017d4:	fb                   	sti    
    sti();
}
  1017d5:	90                   	nop
  1017d6:	5d                   	pop    %ebp
  1017d7:	c3                   	ret    

001017d8 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017d8:	55                   	push   %ebp
  1017d9:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017db:	fa                   	cli    
    cli();
}
  1017dc:	90                   	nop
  1017dd:	5d                   	pop    %ebp
  1017de:	c3                   	ret    

001017df <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017df:	55                   	push   %ebp
  1017e0:	89 e5                	mov    %esp,%ebp
  1017e2:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017e5:	83 ec 08             	sub    $0x8,%esp
  1017e8:	6a 64                	push   $0x64
  1017ea:	68 80 37 10 00       	push   $0x103780
  1017ef:	e8 49 ea ff ff       	call   10023d <cprintf>
  1017f4:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017f7:	90                   	nop
  1017f8:	c9                   	leave  
  1017f9:	c3                   	ret    

001017fa <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017fa:	55                   	push   %ebp
  1017fb:	89 e5                	mov    %esp,%ebp
  1017fd:	83 ec 10             	sub    $0x10,%esp
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
        for(int i=0;i<256;i++){
  101800:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101807:	e9 c3 00 00 00       	jmp    1018cf <idt_init+0xd5>
        SETGATE(idt[i],0,GD_KTEXT,__vectors[i],0);
  10180c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10180f:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101816:	89 c2                	mov    %eax,%edx
  101818:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10181b:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101822:	00 
  101823:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101826:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  10182d:	00 08 00 
  101830:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101833:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10183a:	00 
  10183b:	83 e2 e0             	and    $0xffffffe0,%edx
  10183e:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101845:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101848:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10184f:	00 
  101850:	83 e2 1f             	and    $0x1f,%edx
  101853:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10185a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10185d:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101864:	00 
  101865:	83 e2 f0             	and    $0xfffffff0,%edx
  101868:	83 ca 0e             	or     $0xe,%edx
  10186b:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101872:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101875:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10187c:	00 
  10187d:	83 e2 ef             	and    $0xffffffef,%edx
  101880:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101887:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188a:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101891:	00 
  101892:	83 e2 9f             	and    $0xffffff9f,%edx
  101895:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10189c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10189f:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018a6:	00 
  1018a7:	83 ca 80             	or     $0xffffff80,%edx
  1018aa:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b4:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018bb:	c1 e8 10             	shr    $0x10,%eax
  1018be:	89 c2                	mov    %eax,%edx
  1018c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c3:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018ca:	00 
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
        for(int i=0;i<256;i++){
  1018cb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018cf:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1018d6:	0f 8e 30 ff ff ff    	jle    10180c <idt_init+0x12>
        SETGATE(idt[i],0,GD_KTEXT,__vectors[i],0);
}
	SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK],3);
  1018dc:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1018e1:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  1018e7:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  1018ee:	08 00 
  1018f0:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  1018f7:	83 e0 e0             	and    $0xffffffe0,%eax
  1018fa:	a2 6c f4 10 00       	mov    %al,0x10f46c
  1018ff:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101906:	83 e0 1f             	and    $0x1f,%eax
  101909:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10190e:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101915:	83 e0 f0             	and    $0xfffffff0,%eax
  101918:	83 c8 0e             	or     $0xe,%eax
  10191b:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101920:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101927:	83 e0 ef             	and    $0xffffffef,%eax
  10192a:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10192f:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101936:	83 c8 60             	or     $0x60,%eax
  101939:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10193e:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101945:	83 c8 80             	or     $0xffffff80,%eax
  101948:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10194d:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101952:	c1 e8 10             	shr    $0x10,%eax
  101955:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  10195b:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  101962:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101965:	0f 01 18             	lidtl  (%eax)
        lidt(&idt_pd);

}
  101968:	90                   	nop
  101969:	c9                   	leave  
  10196a:	c3                   	ret    

0010196b <trapname>:

static const char *
trapname(int trapno) {
  10196b:	55                   	push   %ebp
  10196c:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  10196e:	8b 45 08             	mov    0x8(%ebp),%eax
  101971:	83 f8 13             	cmp    $0x13,%eax
  101974:	77 0c                	ja     101982 <trapname+0x17>
        return excnames[trapno];
  101976:	8b 45 08             	mov    0x8(%ebp),%eax
  101979:	8b 04 85 e0 3a 10 00 	mov    0x103ae0(,%eax,4),%eax
  101980:	eb 18                	jmp    10199a <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101982:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101986:	7e 0d                	jle    101995 <trapname+0x2a>
  101988:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  10198c:	7f 07                	jg     101995 <trapname+0x2a>
        return "Hardware Interrupt";
  10198e:	b8 8a 37 10 00       	mov    $0x10378a,%eax
  101993:	eb 05                	jmp    10199a <trapname+0x2f>
    }
    return "(unknown trap)";
  101995:	b8 9d 37 10 00       	mov    $0x10379d,%eax
}
  10199a:	5d                   	pop    %ebp
  10199b:	c3                   	ret    

0010199c <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  10199c:	55                   	push   %ebp
  10199d:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10199f:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a2:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019a6:	66 83 f8 08          	cmp    $0x8,%ax
  1019aa:	0f 94 c0             	sete   %al
  1019ad:	0f b6 c0             	movzbl %al,%eax
}
  1019b0:	5d                   	pop    %ebp
  1019b1:	c3                   	ret    

001019b2 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019b2:	55                   	push   %ebp
  1019b3:	89 e5                	mov    %esp,%ebp
  1019b5:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  1019b8:	83 ec 08             	sub    $0x8,%esp
  1019bb:	ff 75 08             	pushl  0x8(%ebp)
  1019be:	68 de 37 10 00       	push   $0x1037de
  1019c3:	e8 75 e8 ff ff       	call   10023d <cprintf>
  1019c8:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  1019cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ce:	83 ec 0c             	sub    $0xc,%esp
  1019d1:	50                   	push   %eax
  1019d2:	e8 b8 01 00 00       	call   101b8f <print_regs>
  1019d7:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019da:	8b 45 08             	mov    0x8(%ebp),%eax
  1019dd:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019e1:	0f b7 c0             	movzwl %ax,%eax
  1019e4:	83 ec 08             	sub    $0x8,%esp
  1019e7:	50                   	push   %eax
  1019e8:	68 ef 37 10 00       	push   $0x1037ef
  1019ed:	e8 4b e8 ff ff       	call   10023d <cprintf>
  1019f2:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1019f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f8:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1019fc:	0f b7 c0             	movzwl %ax,%eax
  1019ff:	83 ec 08             	sub    $0x8,%esp
  101a02:	50                   	push   %eax
  101a03:	68 02 38 10 00       	push   $0x103802
  101a08:	e8 30 e8 ff ff       	call   10023d <cprintf>
  101a0d:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a10:	8b 45 08             	mov    0x8(%ebp),%eax
  101a13:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a17:	0f b7 c0             	movzwl %ax,%eax
  101a1a:	83 ec 08             	sub    $0x8,%esp
  101a1d:	50                   	push   %eax
  101a1e:	68 15 38 10 00       	push   $0x103815
  101a23:	e8 15 e8 ff ff       	call   10023d <cprintf>
  101a28:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a2b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2e:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a32:	0f b7 c0             	movzwl %ax,%eax
  101a35:	83 ec 08             	sub    $0x8,%esp
  101a38:	50                   	push   %eax
  101a39:	68 28 38 10 00       	push   $0x103828
  101a3e:	e8 fa e7 ff ff       	call   10023d <cprintf>
  101a43:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a46:	8b 45 08             	mov    0x8(%ebp),%eax
  101a49:	8b 40 30             	mov    0x30(%eax),%eax
  101a4c:	83 ec 0c             	sub    $0xc,%esp
  101a4f:	50                   	push   %eax
  101a50:	e8 16 ff ff ff       	call   10196b <trapname>
  101a55:	83 c4 10             	add    $0x10,%esp
  101a58:	89 c2                	mov    %eax,%edx
  101a5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a5d:	8b 40 30             	mov    0x30(%eax),%eax
  101a60:	83 ec 04             	sub    $0x4,%esp
  101a63:	52                   	push   %edx
  101a64:	50                   	push   %eax
  101a65:	68 3b 38 10 00       	push   $0x10383b
  101a6a:	e8 ce e7 ff ff       	call   10023d <cprintf>
  101a6f:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a72:	8b 45 08             	mov    0x8(%ebp),%eax
  101a75:	8b 40 34             	mov    0x34(%eax),%eax
  101a78:	83 ec 08             	sub    $0x8,%esp
  101a7b:	50                   	push   %eax
  101a7c:	68 4d 38 10 00       	push   $0x10384d
  101a81:	e8 b7 e7 ff ff       	call   10023d <cprintf>
  101a86:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a89:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8c:	8b 40 38             	mov    0x38(%eax),%eax
  101a8f:	83 ec 08             	sub    $0x8,%esp
  101a92:	50                   	push   %eax
  101a93:	68 5c 38 10 00       	push   $0x10385c
  101a98:	e8 a0 e7 ff ff       	call   10023d <cprintf>
  101a9d:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa3:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101aa7:	0f b7 c0             	movzwl %ax,%eax
  101aaa:	83 ec 08             	sub    $0x8,%esp
  101aad:	50                   	push   %eax
  101aae:	68 6b 38 10 00       	push   $0x10386b
  101ab3:	e8 85 e7 ff ff       	call   10023d <cprintf>
  101ab8:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101abb:	8b 45 08             	mov    0x8(%ebp),%eax
  101abe:	8b 40 40             	mov    0x40(%eax),%eax
  101ac1:	83 ec 08             	sub    $0x8,%esp
  101ac4:	50                   	push   %eax
  101ac5:	68 7e 38 10 00       	push   $0x10387e
  101aca:	e8 6e e7 ff ff       	call   10023d <cprintf>
  101acf:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ad2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ad9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101ae0:	eb 3f                	jmp    101b21 <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101ae2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae5:	8b 50 40             	mov    0x40(%eax),%edx
  101ae8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101aeb:	21 d0                	and    %edx,%eax
  101aed:	85 c0                	test   %eax,%eax
  101aef:	74 29                	je     101b1a <print_trapframe+0x168>
  101af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101af4:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101afb:	85 c0                	test   %eax,%eax
  101afd:	74 1b                	je     101b1a <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  101aff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b02:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b09:	83 ec 08             	sub    $0x8,%esp
  101b0c:	50                   	push   %eax
  101b0d:	68 8d 38 10 00       	push   $0x10388d
  101b12:	e8 26 e7 ff ff       	call   10023d <cprintf>
  101b17:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b1a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b1e:	d1 65 f0             	shll   -0x10(%ebp)
  101b21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b24:	83 f8 17             	cmp    $0x17,%eax
  101b27:	76 b9                	jbe    101ae2 <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b29:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2c:	8b 40 40             	mov    0x40(%eax),%eax
  101b2f:	25 00 30 00 00       	and    $0x3000,%eax
  101b34:	c1 e8 0c             	shr    $0xc,%eax
  101b37:	83 ec 08             	sub    $0x8,%esp
  101b3a:	50                   	push   %eax
  101b3b:	68 91 38 10 00       	push   $0x103891
  101b40:	e8 f8 e6 ff ff       	call   10023d <cprintf>
  101b45:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101b48:	83 ec 0c             	sub    $0xc,%esp
  101b4b:	ff 75 08             	pushl  0x8(%ebp)
  101b4e:	e8 49 fe ff ff       	call   10199c <trap_in_kernel>
  101b53:	83 c4 10             	add    $0x10,%esp
  101b56:	85 c0                	test   %eax,%eax
  101b58:	75 32                	jne    101b8c <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b5d:	8b 40 44             	mov    0x44(%eax),%eax
  101b60:	83 ec 08             	sub    $0x8,%esp
  101b63:	50                   	push   %eax
  101b64:	68 9a 38 10 00       	push   $0x10389a
  101b69:	e8 cf e6 ff ff       	call   10023d <cprintf>
  101b6e:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b71:	8b 45 08             	mov    0x8(%ebp),%eax
  101b74:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b78:	0f b7 c0             	movzwl %ax,%eax
  101b7b:	83 ec 08             	sub    $0x8,%esp
  101b7e:	50                   	push   %eax
  101b7f:	68 a9 38 10 00       	push   $0x1038a9
  101b84:	e8 b4 e6 ff ff       	call   10023d <cprintf>
  101b89:	83 c4 10             	add    $0x10,%esp
    }
}
  101b8c:	90                   	nop
  101b8d:	c9                   	leave  
  101b8e:	c3                   	ret    

00101b8f <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b8f:	55                   	push   %ebp
  101b90:	89 e5                	mov    %esp,%ebp
  101b92:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b95:	8b 45 08             	mov    0x8(%ebp),%eax
  101b98:	8b 00                	mov    (%eax),%eax
  101b9a:	83 ec 08             	sub    $0x8,%esp
  101b9d:	50                   	push   %eax
  101b9e:	68 bc 38 10 00       	push   $0x1038bc
  101ba3:	e8 95 e6 ff ff       	call   10023d <cprintf>
  101ba8:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bab:	8b 45 08             	mov    0x8(%ebp),%eax
  101bae:	8b 40 04             	mov    0x4(%eax),%eax
  101bb1:	83 ec 08             	sub    $0x8,%esp
  101bb4:	50                   	push   %eax
  101bb5:	68 cb 38 10 00       	push   $0x1038cb
  101bba:	e8 7e e6 ff ff       	call   10023d <cprintf>
  101bbf:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bc2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc5:	8b 40 08             	mov    0x8(%eax),%eax
  101bc8:	83 ec 08             	sub    $0x8,%esp
  101bcb:	50                   	push   %eax
  101bcc:	68 da 38 10 00       	push   $0x1038da
  101bd1:	e8 67 e6 ff ff       	call   10023d <cprintf>
  101bd6:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdc:	8b 40 0c             	mov    0xc(%eax),%eax
  101bdf:	83 ec 08             	sub    $0x8,%esp
  101be2:	50                   	push   %eax
  101be3:	68 e9 38 10 00       	push   $0x1038e9
  101be8:	e8 50 e6 ff ff       	call   10023d <cprintf>
  101bed:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bf0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf3:	8b 40 10             	mov    0x10(%eax),%eax
  101bf6:	83 ec 08             	sub    $0x8,%esp
  101bf9:	50                   	push   %eax
  101bfa:	68 f8 38 10 00       	push   $0x1038f8
  101bff:	e8 39 e6 ff ff       	call   10023d <cprintf>
  101c04:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c07:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0a:	8b 40 14             	mov    0x14(%eax),%eax
  101c0d:	83 ec 08             	sub    $0x8,%esp
  101c10:	50                   	push   %eax
  101c11:	68 07 39 10 00       	push   $0x103907
  101c16:	e8 22 e6 ff ff       	call   10023d <cprintf>
  101c1b:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c21:	8b 40 18             	mov    0x18(%eax),%eax
  101c24:	83 ec 08             	sub    $0x8,%esp
  101c27:	50                   	push   %eax
  101c28:	68 16 39 10 00       	push   $0x103916
  101c2d:	e8 0b e6 ff ff       	call   10023d <cprintf>
  101c32:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c35:	8b 45 08             	mov    0x8(%ebp),%eax
  101c38:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c3b:	83 ec 08             	sub    $0x8,%esp
  101c3e:	50                   	push   %eax
  101c3f:	68 25 39 10 00       	push   $0x103925
  101c44:	e8 f4 e5 ff ff       	call   10023d <cprintf>
  101c49:	83 c4 10             	add    $0x10,%esp
}
  101c4c:	90                   	nop
  101c4d:	c9                   	leave  
  101c4e:	c3                   	ret    

00101c4f <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c4f:	55                   	push   %ebp
  101c50:	89 e5                	mov    %esp,%ebp
  101c52:	83 ec 18             	sub    $0x18,%esp
    char c;

    switch (tf->tf_trapno) {
  101c55:	8b 45 08             	mov    0x8(%ebp),%eax
  101c58:	8b 40 30             	mov    0x30(%eax),%eax
  101c5b:	83 f8 2f             	cmp    $0x2f,%eax
  101c5e:	77 1d                	ja     101c7d <trap_dispatch+0x2e>
  101c60:	83 f8 2e             	cmp    $0x2e,%eax
  101c63:	0f 83 f4 00 00 00    	jae    101d5d <trap_dispatch+0x10e>
  101c69:	83 f8 21             	cmp    $0x21,%eax
  101c6c:	74 7e                	je     101cec <trap_dispatch+0x9d>
  101c6e:	83 f8 24             	cmp    $0x24,%eax
  101c71:	74 55                	je     101cc8 <trap_dispatch+0x79>
  101c73:	83 f8 20             	cmp    $0x20,%eax
  101c76:	74 16                	je     101c8e <trap_dispatch+0x3f>
  101c78:	e9 aa 00 00 00       	jmp    101d27 <trap_dispatch+0xd8>
  101c7d:	83 e8 78             	sub    $0x78,%eax
  101c80:	83 f8 01             	cmp    $0x1,%eax
  101c83:	0f 87 9e 00 00 00    	ja     101d27 <trap_dispatch+0xd8>
  101c89:	e9 82 00 00 00       	jmp    101d10 <trap_dispatch+0xc1>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks++;
  101c8e:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101c93:	83 c0 01             	add    $0x1,%eax
  101c96:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if(ticks%TICK_NUM==0){
  101c9b:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101ca1:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101ca6:	89 c8                	mov    %ecx,%eax
  101ca8:	f7 e2                	mul    %edx
  101caa:	89 d0                	mov    %edx,%eax
  101cac:	c1 e8 05             	shr    $0x5,%eax
  101caf:	6b c0 64             	imul   $0x64,%eax,%eax
  101cb2:	29 c1                	sub    %eax,%ecx
  101cb4:	89 c8                	mov    %ecx,%eax
  101cb6:	85 c0                	test   %eax,%eax
  101cb8:	0f 85 a2 00 00 00    	jne    101d60 <trap_dispatch+0x111>
	print_ticks();
  101cbe:	e8 1c fb ff ff       	call   1017df <print_ticks>
	}
        break;
  101cc3:	e9 98 00 00 00       	jmp    101d60 <trap_dispatch+0x111>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cc8:	e8 e5 f8 ff ff       	call   1015b2 <cons_getc>
  101ccd:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cd0:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101cd4:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101cd8:	83 ec 04             	sub    $0x4,%esp
  101cdb:	52                   	push   %edx
  101cdc:	50                   	push   %eax
  101cdd:	68 34 39 10 00       	push   $0x103934
  101ce2:	e8 56 e5 ff ff       	call   10023d <cprintf>
  101ce7:	83 c4 10             	add    $0x10,%esp
        break;
  101cea:	eb 75                	jmp    101d61 <trap_dispatch+0x112>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101cec:	e8 c1 f8 ff ff       	call   1015b2 <cons_getc>
  101cf1:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101cf4:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101cf8:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101cfc:	83 ec 04             	sub    $0x4,%esp
  101cff:	52                   	push   %edx
  101d00:	50                   	push   %eax
  101d01:	68 46 39 10 00       	push   $0x103946
  101d06:	e8 32 e5 ff ff       	call   10023d <cprintf>
  101d0b:	83 c4 10             	add    $0x10,%esp
        break;
  101d0e:	eb 51                	jmp    101d61 <trap_dispatch+0x112>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101d10:	83 ec 04             	sub    $0x4,%esp
  101d13:	68 55 39 10 00       	push   $0x103955
  101d18:	68 ad 00 00 00       	push   $0xad
  101d1d:	68 65 39 10 00       	push   $0x103965
  101d22:	e8 7c e6 ff ff       	call   1003a3 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101d27:	8b 45 08             	mov    0x8(%ebp),%eax
  101d2a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d2e:	0f b7 c0             	movzwl %ax,%eax
  101d31:	83 e0 03             	and    $0x3,%eax
  101d34:	85 c0                	test   %eax,%eax
  101d36:	75 29                	jne    101d61 <trap_dispatch+0x112>
            print_trapframe(tf);
  101d38:	83 ec 0c             	sub    $0xc,%esp
  101d3b:	ff 75 08             	pushl  0x8(%ebp)
  101d3e:	e8 6f fc ff ff       	call   1019b2 <print_trapframe>
  101d43:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101d46:	83 ec 04             	sub    $0x4,%esp
  101d49:	68 76 39 10 00       	push   $0x103976
  101d4e:	68 b7 00 00 00       	push   $0xb7
  101d53:	68 65 39 10 00       	push   $0x103965
  101d58:	e8 46 e6 ff ff       	call   1003a3 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101d5d:	90                   	nop
  101d5e:	eb 01                	jmp    101d61 <trap_dispatch+0x112>
         */
        ticks++;
        if(ticks%TICK_NUM==0){
	print_ticks();
	}
        break;
  101d60:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101d61:	90                   	nop
  101d62:	c9                   	leave  
  101d63:	c3                   	ret    

00101d64 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101d64:	55                   	push   %ebp
  101d65:	89 e5                	mov    %esp,%ebp
  101d67:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101d6a:	83 ec 0c             	sub    $0xc,%esp
  101d6d:	ff 75 08             	pushl  0x8(%ebp)
  101d70:	e8 da fe ff ff       	call   101c4f <trap_dispatch>
  101d75:	83 c4 10             	add    $0x10,%esp
}
  101d78:	90                   	nop
  101d79:	c9                   	leave  
  101d7a:	c3                   	ret    

00101d7b <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101d7b:	6a 00                	push   $0x0
  pushl $0
  101d7d:	6a 00                	push   $0x0
  jmp __alltraps
  101d7f:	e9 67 0a 00 00       	jmp    1027eb <__alltraps>

00101d84 <vector1>:
.globl vector1
vector1:
  pushl $0
  101d84:	6a 00                	push   $0x0
  pushl $1
  101d86:	6a 01                	push   $0x1
  jmp __alltraps
  101d88:	e9 5e 0a 00 00       	jmp    1027eb <__alltraps>

00101d8d <vector2>:
.globl vector2
vector2:
  pushl $0
  101d8d:	6a 00                	push   $0x0
  pushl $2
  101d8f:	6a 02                	push   $0x2
  jmp __alltraps
  101d91:	e9 55 0a 00 00       	jmp    1027eb <__alltraps>

00101d96 <vector3>:
.globl vector3
vector3:
  pushl $0
  101d96:	6a 00                	push   $0x0
  pushl $3
  101d98:	6a 03                	push   $0x3
  jmp __alltraps
  101d9a:	e9 4c 0a 00 00       	jmp    1027eb <__alltraps>

00101d9f <vector4>:
.globl vector4
vector4:
  pushl $0
  101d9f:	6a 00                	push   $0x0
  pushl $4
  101da1:	6a 04                	push   $0x4
  jmp __alltraps
  101da3:	e9 43 0a 00 00       	jmp    1027eb <__alltraps>

00101da8 <vector5>:
.globl vector5
vector5:
  pushl $0
  101da8:	6a 00                	push   $0x0
  pushl $5
  101daa:	6a 05                	push   $0x5
  jmp __alltraps
  101dac:	e9 3a 0a 00 00       	jmp    1027eb <__alltraps>

00101db1 <vector6>:
.globl vector6
vector6:
  pushl $0
  101db1:	6a 00                	push   $0x0
  pushl $6
  101db3:	6a 06                	push   $0x6
  jmp __alltraps
  101db5:	e9 31 0a 00 00       	jmp    1027eb <__alltraps>

00101dba <vector7>:
.globl vector7
vector7:
  pushl $0
  101dba:	6a 00                	push   $0x0
  pushl $7
  101dbc:	6a 07                	push   $0x7
  jmp __alltraps
  101dbe:	e9 28 0a 00 00       	jmp    1027eb <__alltraps>

00101dc3 <vector8>:
.globl vector8
vector8:
  pushl $8
  101dc3:	6a 08                	push   $0x8
  jmp __alltraps
  101dc5:	e9 21 0a 00 00       	jmp    1027eb <__alltraps>

00101dca <vector9>:
.globl vector9
vector9:
  pushl $9
  101dca:	6a 09                	push   $0x9
  jmp __alltraps
  101dcc:	e9 1a 0a 00 00       	jmp    1027eb <__alltraps>

00101dd1 <vector10>:
.globl vector10
vector10:
  pushl $10
  101dd1:	6a 0a                	push   $0xa
  jmp __alltraps
  101dd3:	e9 13 0a 00 00       	jmp    1027eb <__alltraps>

00101dd8 <vector11>:
.globl vector11
vector11:
  pushl $11
  101dd8:	6a 0b                	push   $0xb
  jmp __alltraps
  101dda:	e9 0c 0a 00 00       	jmp    1027eb <__alltraps>

00101ddf <vector12>:
.globl vector12
vector12:
  pushl $12
  101ddf:	6a 0c                	push   $0xc
  jmp __alltraps
  101de1:	e9 05 0a 00 00       	jmp    1027eb <__alltraps>

00101de6 <vector13>:
.globl vector13
vector13:
  pushl $13
  101de6:	6a 0d                	push   $0xd
  jmp __alltraps
  101de8:	e9 fe 09 00 00       	jmp    1027eb <__alltraps>

00101ded <vector14>:
.globl vector14
vector14:
  pushl $14
  101ded:	6a 0e                	push   $0xe
  jmp __alltraps
  101def:	e9 f7 09 00 00       	jmp    1027eb <__alltraps>

00101df4 <vector15>:
.globl vector15
vector15:
  pushl $0
  101df4:	6a 00                	push   $0x0
  pushl $15
  101df6:	6a 0f                	push   $0xf
  jmp __alltraps
  101df8:	e9 ee 09 00 00       	jmp    1027eb <__alltraps>

00101dfd <vector16>:
.globl vector16
vector16:
  pushl $0
  101dfd:	6a 00                	push   $0x0
  pushl $16
  101dff:	6a 10                	push   $0x10
  jmp __alltraps
  101e01:	e9 e5 09 00 00       	jmp    1027eb <__alltraps>

00101e06 <vector17>:
.globl vector17
vector17:
  pushl $17
  101e06:	6a 11                	push   $0x11
  jmp __alltraps
  101e08:	e9 de 09 00 00       	jmp    1027eb <__alltraps>

00101e0d <vector18>:
.globl vector18
vector18:
  pushl $0
  101e0d:	6a 00                	push   $0x0
  pushl $18
  101e0f:	6a 12                	push   $0x12
  jmp __alltraps
  101e11:	e9 d5 09 00 00       	jmp    1027eb <__alltraps>

00101e16 <vector19>:
.globl vector19
vector19:
  pushl $0
  101e16:	6a 00                	push   $0x0
  pushl $19
  101e18:	6a 13                	push   $0x13
  jmp __alltraps
  101e1a:	e9 cc 09 00 00       	jmp    1027eb <__alltraps>

00101e1f <vector20>:
.globl vector20
vector20:
  pushl $0
  101e1f:	6a 00                	push   $0x0
  pushl $20
  101e21:	6a 14                	push   $0x14
  jmp __alltraps
  101e23:	e9 c3 09 00 00       	jmp    1027eb <__alltraps>

00101e28 <vector21>:
.globl vector21
vector21:
  pushl $0
  101e28:	6a 00                	push   $0x0
  pushl $21
  101e2a:	6a 15                	push   $0x15
  jmp __alltraps
  101e2c:	e9 ba 09 00 00       	jmp    1027eb <__alltraps>

00101e31 <vector22>:
.globl vector22
vector22:
  pushl $0
  101e31:	6a 00                	push   $0x0
  pushl $22
  101e33:	6a 16                	push   $0x16
  jmp __alltraps
  101e35:	e9 b1 09 00 00       	jmp    1027eb <__alltraps>

00101e3a <vector23>:
.globl vector23
vector23:
  pushl $0
  101e3a:	6a 00                	push   $0x0
  pushl $23
  101e3c:	6a 17                	push   $0x17
  jmp __alltraps
  101e3e:	e9 a8 09 00 00       	jmp    1027eb <__alltraps>

00101e43 <vector24>:
.globl vector24
vector24:
  pushl $0
  101e43:	6a 00                	push   $0x0
  pushl $24
  101e45:	6a 18                	push   $0x18
  jmp __alltraps
  101e47:	e9 9f 09 00 00       	jmp    1027eb <__alltraps>

00101e4c <vector25>:
.globl vector25
vector25:
  pushl $0
  101e4c:	6a 00                	push   $0x0
  pushl $25
  101e4e:	6a 19                	push   $0x19
  jmp __alltraps
  101e50:	e9 96 09 00 00       	jmp    1027eb <__alltraps>

00101e55 <vector26>:
.globl vector26
vector26:
  pushl $0
  101e55:	6a 00                	push   $0x0
  pushl $26
  101e57:	6a 1a                	push   $0x1a
  jmp __alltraps
  101e59:	e9 8d 09 00 00       	jmp    1027eb <__alltraps>

00101e5e <vector27>:
.globl vector27
vector27:
  pushl $0
  101e5e:	6a 00                	push   $0x0
  pushl $27
  101e60:	6a 1b                	push   $0x1b
  jmp __alltraps
  101e62:	e9 84 09 00 00       	jmp    1027eb <__alltraps>

00101e67 <vector28>:
.globl vector28
vector28:
  pushl $0
  101e67:	6a 00                	push   $0x0
  pushl $28
  101e69:	6a 1c                	push   $0x1c
  jmp __alltraps
  101e6b:	e9 7b 09 00 00       	jmp    1027eb <__alltraps>

00101e70 <vector29>:
.globl vector29
vector29:
  pushl $0
  101e70:	6a 00                	push   $0x0
  pushl $29
  101e72:	6a 1d                	push   $0x1d
  jmp __alltraps
  101e74:	e9 72 09 00 00       	jmp    1027eb <__alltraps>

00101e79 <vector30>:
.globl vector30
vector30:
  pushl $0
  101e79:	6a 00                	push   $0x0
  pushl $30
  101e7b:	6a 1e                	push   $0x1e
  jmp __alltraps
  101e7d:	e9 69 09 00 00       	jmp    1027eb <__alltraps>

00101e82 <vector31>:
.globl vector31
vector31:
  pushl $0
  101e82:	6a 00                	push   $0x0
  pushl $31
  101e84:	6a 1f                	push   $0x1f
  jmp __alltraps
  101e86:	e9 60 09 00 00       	jmp    1027eb <__alltraps>

00101e8b <vector32>:
.globl vector32
vector32:
  pushl $0
  101e8b:	6a 00                	push   $0x0
  pushl $32
  101e8d:	6a 20                	push   $0x20
  jmp __alltraps
  101e8f:	e9 57 09 00 00       	jmp    1027eb <__alltraps>

00101e94 <vector33>:
.globl vector33
vector33:
  pushl $0
  101e94:	6a 00                	push   $0x0
  pushl $33
  101e96:	6a 21                	push   $0x21
  jmp __alltraps
  101e98:	e9 4e 09 00 00       	jmp    1027eb <__alltraps>

00101e9d <vector34>:
.globl vector34
vector34:
  pushl $0
  101e9d:	6a 00                	push   $0x0
  pushl $34
  101e9f:	6a 22                	push   $0x22
  jmp __alltraps
  101ea1:	e9 45 09 00 00       	jmp    1027eb <__alltraps>

00101ea6 <vector35>:
.globl vector35
vector35:
  pushl $0
  101ea6:	6a 00                	push   $0x0
  pushl $35
  101ea8:	6a 23                	push   $0x23
  jmp __alltraps
  101eaa:	e9 3c 09 00 00       	jmp    1027eb <__alltraps>

00101eaf <vector36>:
.globl vector36
vector36:
  pushl $0
  101eaf:	6a 00                	push   $0x0
  pushl $36
  101eb1:	6a 24                	push   $0x24
  jmp __alltraps
  101eb3:	e9 33 09 00 00       	jmp    1027eb <__alltraps>

00101eb8 <vector37>:
.globl vector37
vector37:
  pushl $0
  101eb8:	6a 00                	push   $0x0
  pushl $37
  101eba:	6a 25                	push   $0x25
  jmp __alltraps
  101ebc:	e9 2a 09 00 00       	jmp    1027eb <__alltraps>

00101ec1 <vector38>:
.globl vector38
vector38:
  pushl $0
  101ec1:	6a 00                	push   $0x0
  pushl $38
  101ec3:	6a 26                	push   $0x26
  jmp __alltraps
  101ec5:	e9 21 09 00 00       	jmp    1027eb <__alltraps>

00101eca <vector39>:
.globl vector39
vector39:
  pushl $0
  101eca:	6a 00                	push   $0x0
  pushl $39
  101ecc:	6a 27                	push   $0x27
  jmp __alltraps
  101ece:	e9 18 09 00 00       	jmp    1027eb <__alltraps>

00101ed3 <vector40>:
.globl vector40
vector40:
  pushl $0
  101ed3:	6a 00                	push   $0x0
  pushl $40
  101ed5:	6a 28                	push   $0x28
  jmp __alltraps
  101ed7:	e9 0f 09 00 00       	jmp    1027eb <__alltraps>

00101edc <vector41>:
.globl vector41
vector41:
  pushl $0
  101edc:	6a 00                	push   $0x0
  pushl $41
  101ede:	6a 29                	push   $0x29
  jmp __alltraps
  101ee0:	e9 06 09 00 00       	jmp    1027eb <__alltraps>

00101ee5 <vector42>:
.globl vector42
vector42:
  pushl $0
  101ee5:	6a 00                	push   $0x0
  pushl $42
  101ee7:	6a 2a                	push   $0x2a
  jmp __alltraps
  101ee9:	e9 fd 08 00 00       	jmp    1027eb <__alltraps>

00101eee <vector43>:
.globl vector43
vector43:
  pushl $0
  101eee:	6a 00                	push   $0x0
  pushl $43
  101ef0:	6a 2b                	push   $0x2b
  jmp __alltraps
  101ef2:	e9 f4 08 00 00       	jmp    1027eb <__alltraps>

00101ef7 <vector44>:
.globl vector44
vector44:
  pushl $0
  101ef7:	6a 00                	push   $0x0
  pushl $44
  101ef9:	6a 2c                	push   $0x2c
  jmp __alltraps
  101efb:	e9 eb 08 00 00       	jmp    1027eb <__alltraps>

00101f00 <vector45>:
.globl vector45
vector45:
  pushl $0
  101f00:	6a 00                	push   $0x0
  pushl $45
  101f02:	6a 2d                	push   $0x2d
  jmp __alltraps
  101f04:	e9 e2 08 00 00       	jmp    1027eb <__alltraps>

00101f09 <vector46>:
.globl vector46
vector46:
  pushl $0
  101f09:	6a 00                	push   $0x0
  pushl $46
  101f0b:	6a 2e                	push   $0x2e
  jmp __alltraps
  101f0d:	e9 d9 08 00 00       	jmp    1027eb <__alltraps>

00101f12 <vector47>:
.globl vector47
vector47:
  pushl $0
  101f12:	6a 00                	push   $0x0
  pushl $47
  101f14:	6a 2f                	push   $0x2f
  jmp __alltraps
  101f16:	e9 d0 08 00 00       	jmp    1027eb <__alltraps>

00101f1b <vector48>:
.globl vector48
vector48:
  pushl $0
  101f1b:	6a 00                	push   $0x0
  pushl $48
  101f1d:	6a 30                	push   $0x30
  jmp __alltraps
  101f1f:	e9 c7 08 00 00       	jmp    1027eb <__alltraps>

00101f24 <vector49>:
.globl vector49
vector49:
  pushl $0
  101f24:	6a 00                	push   $0x0
  pushl $49
  101f26:	6a 31                	push   $0x31
  jmp __alltraps
  101f28:	e9 be 08 00 00       	jmp    1027eb <__alltraps>

00101f2d <vector50>:
.globl vector50
vector50:
  pushl $0
  101f2d:	6a 00                	push   $0x0
  pushl $50
  101f2f:	6a 32                	push   $0x32
  jmp __alltraps
  101f31:	e9 b5 08 00 00       	jmp    1027eb <__alltraps>

00101f36 <vector51>:
.globl vector51
vector51:
  pushl $0
  101f36:	6a 00                	push   $0x0
  pushl $51
  101f38:	6a 33                	push   $0x33
  jmp __alltraps
  101f3a:	e9 ac 08 00 00       	jmp    1027eb <__alltraps>

00101f3f <vector52>:
.globl vector52
vector52:
  pushl $0
  101f3f:	6a 00                	push   $0x0
  pushl $52
  101f41:	6a 34                	push   $0x34
  jmp __alltraps
  101f43:	e9 a3 08 00 00       	jmp    1027eb <__alltraps>

00101f48 <vector53>:
.globl vector53
vector53:
  pushl $0
  101f48:	6a 00                	push   $0x0
  pushl $53
  101f4a:	6a 35                	push   $0x35
  jmp __alltraps
  101f4c:	e9 9a 08 00 00       	jmp    1027eb <__alltraps>

00101f51 <vector54>:
.globl vector54
vector54:
  pushl $0
  101f51:	6a 00                	push   $0x0
  pushl $54
  101f53:	6a 36                	push   $0x36
  jmp __alltraps
  101f55:	e9 91 08 00 00       	jmp    1027eb <__alltraps>

00101f5a <vector55>:
.globl vector55
vector55:
  pushl $0
  101f5a:	6a 00                	push   $0x0
  pushl $55
  101f5c:	6a 37                	push   $0x37
  jmp __alltraps
  101f5e:	e9 88 08 00 00       	jmp    1027eb <__alltraps>

00101f63 <vector56>:
.globl vector56
vector56:
  pushl $0
  101f63:	6a 00                	push   $0x0
  pushl $56
  101f65:	6a 38                	push   $0x38
  jmp __alltraps
  101f67:	e9 7f 08 00 00       	jmp    1027eb <__alltraps>

00101f6c <vector57>:
.globl vector57
vector57:
  pushl $0
  101f6c:	6a 00                	push   $0x0
  pushl $57
  101f6e:	6a 39                	push   $0x39
  jmp __alltraps
  101f70:	e9 76 08 00 00       	jmp    1027eb <__alltraps>

00101f75 <vector58>:
.globl vector58
vector58:
  pushl $0
  101f75:	6a 00                	push   $0x0
  pushl $58
  101f77:	6a 3a                	push   $0x3a
  jmp __alltraps
  101f79:	e9 6d 08 00 00       	jmp    1027eb <__alltraps>

00101f7e <vector59>:
.globl vector59
vector59:
  pushl $0
  101f7e:	6a 00                	push   $0x0
  pushl $59
  101f80:	6a 3b                	push   $0x3b
  jmp __alltraps
  101f82:	e9 64 08 00 00       	jmp    1027eb <__alltraps>

00101f87 <vector60>:
.globl vector60
vector60:
  pushl $0
  101f87:	6a 00                	push   $0x0
  pushl $60
  101f89:	6a 3c                	push   $0x3c
  jmp __alltraps
  101f8b:	e9 5b 08 00 00       	jmp    1027eb <__alltraps>

00101f90 <vector61>:
.globl vector61
vector61:
  pushl $0
  101f90:	6a 00                	push   $0x0
  pushl $61
  101f92:	6a 3d                	push   $0x3d
  jmp __alltraps
  101f94:	e9 52 08 00 00       	jmp    1027eb <__alltraps>

00101f99 <vector62>:
.globl vector62
vector62:
  pushl $0
  101f99:	6a 00                	push   $0x0
  pushl $62
  101f9b:	6a 3e                	push   $0x3e
  jmp __alltraps
  101f9d:	e9 49 08 00 00       	jmp    1027eb <__alltraps>

00101fa2 <vector63>:
.globl vector63
vector63:
  pushl $0
  101fa2:	6a 00                	push   $0x0
  pushl $63
  101fa4:	6a 3f                	push   $0x3f
  jmp __alltraps
  101fa6:	e9 40 08 00 00       	jmp    1027eb <__alltraps>

00101fab <vector64>:
.globl vector64
vector64:
  pushl $0
  101fab:	6a 00                	push   $0x0
  pushl $64
  101fad:	6a 40                	push   $0x40
  jmp __alltraps
  101faf:	e9 37 08 00 00       	jmp    1027eb <__alltraps>

00101fb4 <vector65>:
.globl vector65
vector65:
  pushl $0
  101fb4:	6a 00                	push   $0x0
  pushl $65
  101fb6:	6a 41                	push   $0x41
  jmp __alltraps
  101fb8:	e9 2e 08 00 00       	jmp    1027eb <__alltraps>

00101fbd <vector66>:
.globl vector66
vector66:
  pushl $0
  101fbd:	6a 00                	push   $0x0
  pushl $66
  101fbf:	6a 42                	push   $0x42
  jmp __alltraps
  101fc1:	e9 25 08 00 00       	jmp    1027eb <__alltraps>

00101fc6 <vector67>:
.globl vector67
vector67:
  pushl $0
  101fc6:	6a 00                	push   $0x0
  pushl $67
  101fc8:	6a 43                	push   $0x43
  jmp __alltraps
  101fca:	e9 1c 08 00 00       	jmp    1027eb <__alltraps>

00101fcf <vector68>:
.globl vector68
vector68:
  pushl $0
  101fcf:	6a 00                	push   $0x0
  pushl $68
  101fd1:	6a 44                	push   $0x44
  jmp __alltraps
  101fd3:	e9 13 08 00 00       	jmp    1027eb <__alltraps>

00101fd8 <vector69>:
.globl vector69
vector69:
  pushl $0
  101fd8:	6a 00                	push   $0x0
  pushl $69
  101fda:	6a 45                	push   $0x45
  jmp __alltraps
  101fdc:	e9 0a 08 00 00       	jmp    1027eb <__alltraps>

00101fe1 <vector70>:
.globl vector70
vector70:
  pushl $0
  101fe1:	6a 00                	push   $0x0
  pushl $70
  101fe3:	6a 46                	push   $0x46
  jmp __alltraps
  101fe5:	e9 01 08 00 00       	jmp    1027eb <__alltraps>

00101fea <vector71>:
.globl vector71
vector71:
  pushl $0
  101fea:	6a 00                	push   $0x0
  pushl $71
  101fec:	6a 47                	push   $0x47
  jmp __alltraps
  101fee:	e9 f8 07 00 00       	jmp    1027eb <__alltraps>

00101ff3 <vector72>:
.globl vector72
vector72:
  pushl $0
  101ff3:	6a 00                	push   $0x0
  pushl $72
  101ff5:	6a 48                	push   $0x48
  jmp __alltraps
  101ff7:	e9 ef 07 00 00       	jmp    1027eb <__alltraps>

00101ffc <vector73>:
.globl vector73
vector73:
  pushl $0
  101ffc:	6a 00                	push   $0x0
  pushl $73
  101ffe:	6a 49                	push   $0x49
  jmp __alltraps
  102000:	e9 e6 07 00 00       	jmp    1027eb <__alltraps>

00102005 <vector74>:
.globl vector74
vector74:
  pushl $0
  102005:	6a 00                	push   $0x0
  pushl $74
  102007:	6a 4a                	push   $0x4a
  jmp __alltraps
  102009:	e9 dd 07 00 00       	jmp    1027eb <__alltraps>

0010200e <vector75>:
.globl vector75
vector75:
  pushl $0
  10200e:	6a 00                	push   $0x0
  pushl $75
  102010:	6a 4b                	push   $0x4b
  jmp __alltraps
  102012:	e9 d4 07 00 00       	jmp    1027eb <__alltraps>

00102017 <vector76>:
.globl vector76
vector76:
  pushl $0
  102017:	6a 00                	push   $0x0
  pushl $76
  102019:	6a 4c                	push   $0x4c
  jmp __alltraps
  10201b:	e9 cb 07 00 00       	jmp    1027eb <__alltraps>

00102020 <vector77>:
.globl vector77
vector77:
  pushl $0
  102020:	6a 00                	push   $0x0
  pushl $77
  102022:	6a 4d                	push   $0x4d
  jmp __alltraps
  102024:	e9 c2 07 00 00       	jmp    1027eb <__alltraps>

00102029 <vector78>:
.globl vector78
vector78:
  pushl $0
  102029:	6a 00                	push   $0x0
  pushl $78
  10202b:	6a 4e                	push   $0x4e
  jmp __alltraps
  10202d:	e9 b9 07 00 00       	jmp    1027eb <__alltraps>

00102032 <vector79>:
.globl vector79
vector79:
  pushl $0
  102032:	6a 00                	push   $0x0
  pushl $79
  102034:	6a 4f                	push   $0x4f
  jmp __alltraps
  102036:	e9 b0 07 00 00       	jmp    1027eb <__alltraps>

0010203b <vector80>:
.globl vector80
vector80:
  pushl $0
  10203b:	6a 00                	push   $0x0
  pushl $80
  10203d:	6a 50                	push   $0x50
  jmp __alltraps
  10203f:	e9 a7 07 00 00       	jmp    1027eb <__alltraps>

00102044 <vector81>:
.globl vector81
vector81:
  pushl $0
  102044:	6a 00                	push   $0x0
  pushl $81
  102046:	6a 51                	push   $0x51
  jmp __alltraps
  102048:	e9 9e 07 00 00       	jmp    1027eb <__alltraps>

0010204d <vector82>:
.globl vector82
vector82:
  pushl $0
  10204d:	6a 00                	push   $0x0
  pushl $82
  10204f:	6a 52                	push   $0x52
  jmp __alltraps
  102051:	e9 95 07 00 00       	jmp    1027eb <__alltraps>

00102056 <vector83>:
.globl vector83
vector83:
  pushl $0
  102056:	6a 00                	push   $0x0
  pushl $83
  102058:	6a 53                	push   $0x53
  jmp __alltraps
  10205a:	e9 8c 07 00 00       	jmp    1027eb <__alltraps>

0010205f <vector84>:
.globl vector84
vector84:
  pushl $0
  10205f:	6a 00                	push   $0x0
  pushl $84
  102061:	6a 54                	push   $0x54
  jmp __alltraps
  102063:	e9 83 07 00 00       	jmp    1027eb <__alltraps>

00102068 <vector85>:
.globl vector85
vector85:
  pushl $0
  102068:	6a 00                	push   $0x0
  pushl $85
  10206a:	6a 55                	push   $0x55
  jmp __alltraps
  10206c:	e9 7a 07 00 00       	jmp    1027eb <__alltraps>

00102071 <vector86>:
.globl vector86
vector86:
  pushl $0
  102071:	6a 00                	push   $0x0
  pushl $86
  102073:	6a 56                	push   $0x56
  jmp __alltraps
  102075:	e9 71 07 00 00       	jmp    1027eb <__alltraps>

0010207a <vector87>:
.globl vector87
vector87:
  pushl $0
  10207a:	6a 00                	push   $0x0
  pushl $87
  10207c:	6a 57                	push   $0x57
  jmp __alltraps
  10207e:	e9 68 07 00 00       	jmp    1027eb <__alltraps>

00102083 <vector88>:
.globl vector88
vector88:
  pushl $0
  102083:	6a 00                	push   $0x0
  pushl $88
  102085:	6a 58                	push   $0x58
  jmp __alltraps
  102087:	e9 5f 07 00 00       	jmp    1027eb <__alltraps>

0010208c <vector89>:
.globl vector89
vector89:
  pushl $0
  10208c:	6a 00                	push   $0x0
  pushl $89
  10208e:	6a 59                	push   $0x59
  jmp __alltraps
  102090:	e9 56 07 00 00       	jmp    1027eb <__alltraps>

00102095 <vector90>:
.globl vector90
vector90:
  pushl $0
  102095:	6a 00                	push   $0x0
  pushl $90
  102097:	6a 5a                	push   $0x5a
  jmp __alltraps
  102099:	e9 4d 07 00 00       	jmp    1027eb <__alltraps>

0010209e <vector91>:
.globl vector91
vector91:
  pushl $0
  10209e:	6a 00                	push   $0x0
  pushl $91
  1020a0:	6a 5b                	push   $0x5b
  jmp __alltraps
  1020a2:	e9 44 07 00 00       	jmp    1027eb <__alltraps>

001020a7 <vector92>:
.globl vector92
vector92:
  pushl $0
  1020a7:	6a 00                	push   $0x0
  pushl $92
  1020a9:	6a 5c                	push   $0x5c
  jmp __alltraps
  1020ab:	e9 3b 07 00 00       	jmp    1027eb <__alltraps>

001020b0 <vector93>:
.globl vector93
vector93:
  pushl $0
  1020b0:	6a 00                	push   $0x0
  pushl $93
  1020b2:	6a 5d                	push   $0x5d
  jmp __alltraps
  1020b4:	e9 32 07 00 00       	jmp    1027eb <__alltraps>

001020b9 <vector94>:
.globl vector94
vector94:
  pushl $0
  1020b9:	6a 00                	push   $0x0
  pushl $94
  1020bb:	6a 5e                	push   $0x5e
  jmp __alltraps
  1020bd:	e9 29 07 00 00       	jmp    1027eb <__alltraps>

001020c2 <vector95>:
.globl vector95
vector95:
  pushl $0
  1020c2:	6a 00                	push   $0x0
  pushl $95
  1020c4:	6a 5f                	push   $0x5f
  jmp __alltraps
  1020c6:	e9 20 07 00 00       	jmp    1027eb <__alltraps>

001020cb <vector96>:
.globl vector96
vector96:
  pushl $0
  1020cb:	6a 00                	push   $0x0
  pushl $96
  1020cd:	6a 60                	push   $0x60
  jmp __alltraps
  1020cf:	e9 17 07 00 00       	jmp    1027eb <__alltraps>

001020d4 <vector97>:
.globl vector97
vector97:
  pushl $0
  1020d4:	6a 00                	push   $0x0
  pushl $97
  1020d6:	6a 61                	push   $0x61
  jmp __alltraps
  1020d8:	e9 0e 07 00 00       	jmp    1027eb <__alltraps>

001020dd <vector98>:
.globl vector98
vector98:
  pushl $0
  1020dd:	6a 00                	push   $0x0
  pushl $98
  1020df:	6a 62                	push   $0x62
  jmp __alltraps
  1020e1:	e9 05 07 00 00       	jmp    1027eb <__alltraps>

001020e6 <vector99>:
.globl vector99
vector99:
  pushl $0
  1020e6:	6a 00                	push   $0x0
  pushl $99
  1020e8:	6a 63                	push   $0x63
  jmp __alltraps
  1020ea:	e9 fc 06 00 00       	jmp    1027eb <__alltraps>

001020ef <vector100>:
.globl vector100
vector100:
  pushl $0
  1020ef:	6a 00                	push   $0x0
  pushl $100
  1020f1:	6a 64                	push   $0x64
  jmp __alltraps
  1020f3:	e9 f3 06 00 00       	jmp    1027eb <__alltraps>

001020f8 <vector101>:
.globl vector101
vector101:
  pushl $0
  1020f8:	6a 00                	push   $0x0
  pushl $101
  1020fa:	6a 65                	push   $0x65
  jmp __alltraps
  1020fc:	e9 ea 06 00 00       	jmp    1027eb <__alltraps>

00102101 <vector102>:
.globl vector102
vector102:
  pushl $0
  102101:	6a 00                	push   $0x0
  pushl $102
  102103:	6a 66                	push   $0x66
  jmp __alltraps
  102105:	e9 e1 06 00 00       	jmp    1027eb <__alltraps>

0010210a <vector103>:
.globl vector103
vector103:
  pushl $0
  10210a:	6a 00                	push   $0x0
  pushl $103
  10210c:	6a 67                	push   $0x67
  jmp __alltraps
  10210e:	e9 d8 06 00 00       	jmp    1027eb <__alltraps>

00102113 <vector104>:
.globl vector104
vector104:
  pushl $0
  102113:	6a 00                	push   $0x0
  pushl $104
  102115:	6a 68                	push   $0x68
  jmp __alltraps
  102117:	e9 cf 06 00 00       	jmp    1027eb <__alltraps>

0010211c <vector105>:
.globl vector105
vector105:
  pushl $0
  10211c:	6a 00                	push   $0x0
  pushl $105
  10211e:	6a 69                	push   $0x69
  jmp __alltraps
  102120:	e9 c6 06 00 00       	jmp    1027eb <__alltraps>

00102125 <vector106>:
.globl vector106
vector106:
  pushl $0
  102125:	6a 00                	push   $0x0
  pushl $106
  102127:	6a 6a                	push   $0x6a
  jmp __alltraps
  102129:	e9 bd 06 00 00       	jmp    1027eb <__alltraps>

0010212e <vector107>:
.globl vector107
vector107:
  pushl $0
  10212e:	6a 00                	push   $0x0
  pushl $107
  102130:	6a 6b                	push   $0x6b
  jmp __alltraps
  102132:	e9 b4 06 00 00       	jmp    1027eb <__alltraps>

00102137 <vector108>:
.globl vector108
vector108:
  pushl $0
  102137:	6a 00                	push   $0x0
  pushl $108
  102139:	6a 6c                	push   $0x6c
  jmp __alltraps
  10213b:	e9 ab 06 00 00       	jmp    1027eb <__alltraps>

00102140 <vector109>:
.globl vector109
vector109:
  pushl $0
  102140:	6a 00                	push   $0x0
  pushl $109
  102142:	6a 6d                	push   $0x6d
  jmp __alltraps
  102144:	e9 a2 06 00 00       	jmp    1027eb <__alltraps>

00102149 <vector110>:
.globl vector110
vector110:
  pushl $0
  102149:	6a 00                	push   $0x0
  pushl $110
  10214b:	6a 6e                	push   $0x6e
  jmp __alltraps
  10214d:	e9 99 06 00 00       	jmp    1027eb <__alltraps>

00102152 <vector111>:
.globl vector111
vector111:
  pushl $0
  102152:	6a 00                	push   $0x0
  pushl $111
  102154:	6a 6f                	push   $0x6f
  jmp __alltraps
  102156:	e9 90 06 00 00       	jmp    1027eb <__alltraps>

0010215b <vector112>:
.globl vector112
vector112:
  pushl $0
  10215b:	6a 00                	push   $0x0
  pushl $112
  10215d:	6a 70                	push   $0x70
  jmp __alltraps
  10215f:	e9 87 06 00 00       	jmp    1027eb <__alltraps>

00102164 <vector113>:
.globl vector113
vector113:
  pushl $0
  102164:	6a 00                	push   $0x0
  pushl $113
  102166:	6a 71                	push   $0x71
  jmp __alltraps
  102168:	e9 7e 06 00 00       	jmp    1027eb <__alltraps>

0010216d <vector114>:
.globl vector114
vector114:
  pushl $0
  10216d:	6a 00                	push   $0x0
  pushl $114
  10216f:	6a 72                	push   $0x72
  jmp __alltraps
  102171:	e9 75 06 00 00       	jmp    1027eb <__alltraps>

00102176 <vector115>:
.globl vector115
vector115:
  pushl $0
  102176:	6a 00                	push   $0x0
  pushl $115
  102178:	6a 73                	push   $0x73
  jmp __alltraps
  10217a:	e9 6c 06 00 00       	jmp    1027eb <__alltraps>

0010217f <vector116>:
.globl vector116
vector116:
  pushl $0
  10217f:	6a 00                	push   $0x0
  pushl $116
  102181:	6a 74                	push   $0x74
  jmp __alltraps
  102183:	e9 63 06 00 00       	jmp    1027eb <__alltraps>

00102188 <vector117>:
.globl vector117
vector117:
  pushl $0
  102188:	6a 00                	push   $0x0
  pushl $117
  10218a:	6a 75                	push   $0x75
  jmp __alltraps
  10218c:	e9 5a 06 00 00       	jmp    1027eb <__alltraps>

00102191 <vector118>:
.globl vector118
vector118:
  pushl $0
  102191:	6a 00                	push   $0x0
  pushl $118
  102193:	6a 76                	push   $0x76
  jmp __alltraps
  102195:	e9 51 06 00 00       	jmp    1027eb <__alltraps>

0010219a <vector119>:
.globl vector119
vector119:
  pushl $0
  10219a:	6a 00                	push   $0x0
  pushl $119
  10219c:	6a 77                	push   $0x77
  jmp __alltraps
  10219e:	e9 48 06 00 00       	jmp    1027eb <__alltraps>

001021a3 <vector120>:
.globl vector120
vector120:
  pushl $0
  1021a3:	6a 00                	push   $0x0
  pushl $120
  1021a5:	6a 78                	push   $0x78
  jmp __alltraps
  1021a7:	e9 3f 06 00 00       	jmp    1027eb <__alltraps>

001021ac <vector121>:
.globl vector121
vector121:
  pushl $0
  1021ac:	6a 00                	push   $0x0
  pushl $121
  1021ae:	6a 79                	push   $0x79
  jmp __alltraps
  1021b0:	e9 36 06 00 00       	jmp    1027eb <__alltraps>

001021b5 <vector122>:
.globl vector122
vector122:
  pushl $0
  1021b5:	6a 00                	push   $0x0
  pushl $122
  1021b7:	6a 7a                	push   $0x7a
  jmp __alltraps
  1021b9:	e9 2d 06 00 00       	jmp    1027eb <__alltraps>

001021be <vector123>:
.globl vector123
vector123:
  pushl $0
  1021be:	6a 00                	push   $0x0
  pushl $123
  1021c0:	6a 7b                	push   $0x7b
  jmp __alltraps
  1021c2:	e9 24 06 00 00       	jmp    1027eb <__alltraps>

001021c7 <vector124>:
.globl vector124
vector124:
  pushl $0
  1021c7:	6a 00                	push   $0x0
  pushl $124
  1021c9:	6a 7c                	push   $0x7c
  jmp __alltraps
  1021cb:	e9 1b 06 00 00       	jmp    1027eb <__alltraps>

001021d0 <vector125>:
.globl vector125
vector125:
  pushl $0
  1021d0:	6a 00                	push   $0x0
  pushl $125
  1021d2:	6a 7d                	push   $0x7d
  jmp __alltraps
  1021d4:	e9 12 06 00 00       	jmp    1027eb <__alltraps>

001021d9 <vector126>:
.globl vector126
vector126:
  pushl $0
  1021d9:	6a 00                	push   $0x0
  pushl $126
  1021db:	6a 7e                	push   $0x7e
  jmp __alltraps
  1021dd:	e9 09 06 00 00       	jmp    1027eb <__alltraps>

001021e2 <vector127>:
.globl vector127
vector127:
  pushl $0
  1021e2:	6a 00                	push   $0x0
  pushl $127
  1021e4:	6a 7f                	push   $0x7f
  jmp __alltraps
  1021e6:	e9 00 06 00 00       	jmp    1027eb <__alltraps>

001021eb <vector128>:
.globl vector128
vector128:
  pushl $0
  1021eb:	6a 00                	push   $0x0
  pushl $128
  1021ed:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1021f2:	e9 f4 05 00 00       	jmp    1027eb <__alltraps>

001021f7 <vector129>:
.globl vector129
vector129:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $129
  1021f9:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1021fe:	e9 e8 05 00 00       	jmp    1027eb <__alltraps>

00102203 <vector130>:
.globl vector130
vector130:
  pushl $0
  102203:	6a 00                	push   $0x0
  pushl $130
  102205:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10220a:	e9 dc 05 00 00       	jmp    1027eb <__alltraps>

0010220f <vector131>:
.globl vector131
vector131:
  pushl $0
  10220f:	6a 00                	push   $0x0
  pushl $131
  102211:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102216:	e9 d0 05 00 00       	jmp    1027eb <__alltraps>

0010221b <vector132>:
.globl vector132
vector132:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $132
  10221d:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102222:	e9 c4 05 00 00       	jmp    1027eb <__alltraps>

00102227 <vector133>:
.globl vector133
vector133:
  pushl $0
  102227:	6a 00                	push   $0x0
  pushl $133
  102229:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10222e:	e9 b8 05 00 00       	jmp    1027eb <__alltraps>

00102233 <vector134>:
.globl vector134
vector134:
  pushl $0
  102233:	6a 00                	push   $0x0
  pushl $134
  102235:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10223a:	e9 ac 05 00 00       	jmp    1027eb <__alltraps>

0010223f <vector135>:
.globl vector135
vector135:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $135
  102241:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102246:	e9 a0 05 00 00       	jmp    1027eb <__alltraps>

0010224b <vector136>:
.globl vector136
vector136:
  pushl $0
  10224b:	6a 00                	push   $0x0
  pushl $136
  10224d:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102252:	e9 94 05 00 00       	jmp    1027eb <__alltraps>

00102257 <vector137>:
.globl vector137
vector137:
  pushl $0
  102257:	6a 00                	push   $0x0
  pushl $137
  102259:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10225e:	e9 88 05 00 00       	jmp    1027eb <__alltraps>

00102263 <vector138>:
.globl vector138
vector138:
  pushl $0
  102263:	6a 00                	push   $0x0
  pushl $138
  102265:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10226a:	e9 7c 05 00 00       	jmp    1027eb <__alltraps>

0010226f <vector139>:
.globl vector139
vector139:
  pushl $0
  10226f:	6a 00                	push   $0x0
  pushl $139
  102271:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102276:	e9 70 05 00 00       	jmp    1027eb <__alltraps>

0010227b <vector140>:
.globl vector140
vector140:
  pushl $0
  10227b:	6a 00                	push   $0x0
  pushl $140
  10227d:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102282:	e9 64 05 00 00       	jmp    1027eb <__alltraps>

00102287 <vector141>:
.globl vector141
vector141:
  pushl $0
  102287:	6a 00                	push   $0x0
  pushl $141
  102289:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10228e:	e9 58 05 00 00       	jmp    1027eb <__alltraps>

00102293 <vector142>:
.globl vector142
vector142:
  pushl $0
  102293:	6a 00                	push   $0x0
  pushl $142
  102295:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10229a:	e9 4c 05 00 00       	jmp    1027eb <__alltraps>

0010229f <vector143>:
.globl vector143
vector143:
  pushl $0
  10229f:	6a 00                	push   $0x0
  pushl $143
  1022a1:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1022a6:	e9 40 05 00 00       	jmp    1027eb <__alltraps>

001022ab <vector144>:
.globl vector144
vector144:
  pushl $0
  1022ab:	6a 00                	push   $0x0
  pushl $144
  1022ad:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1022b2:	e9 34 05 00 00       	jmp    1027eb <__alltraps>

001022b7 <vector145>:
.globl vector145
vector145:
  pushl $0
  1022b7:	6a 00                	push   $0x0
  pushl $145
  1022b9:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1022be:	e9 28 05 00 00       	jmp    1027eb <__alltraps>

001022c3 <vector146>:
.globl vector146
vector146:
  pushl $0
  1022c3:	6a 00                	push   $0x0
  pushl $146
  1022c5:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1022ca:	e9 1c 05 00 00       	jmp    1027eb <__alltraps>

001022cf <vector147>:
.globl vector147
vector147:
  pushl $0
  1022cf:	6a 00                	push   $0x0
  pushl $147
  1022d1:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1022d6:	e9 10 05 00 00       	jmp    1027eb <__alltraps>

001022db <vector148>:
.globl vector148
vector148:
  pushl $0
  1022db:	6a 00                	push   $0x0
  pushl $148
  1022dd:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1022e2:	e9 04 05 00 00       	jmp    1027eb <__alltraps>

001022e7 <vector149>:
.globl vector149
vector149:
  pushl $0
  1022e7:	6a 00                	push   $0x0
  pushl $149
  1022e9:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1022ee:	e9 f8 04 00 00       	jmp    1027eb <__alltraps>

001022f3 <vector150>:
.globl vector150
vector150:
  pushl $0
  1022f3:	6a 00                	push   $0x0
  pushl $150
  1022f5:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1022fa:	e9 ec 04 00 00       	jmp    1027eb <__alltraps>

001022ff <vector151>:
.globl vector151
vector151:
  pushl $0
  1022ff:	6a 00                	push   $0x0
  pushl $151
  102301:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102306:	e9 e0 04 00 00       	jmp    1027eb <__alltraps>

0010230b <vector152>:
.globl vector152
vector152:
  pushl $0
  10230b:	6a 00                	push   $0x0
  pushl $152
  10230d:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102312:	e9 d4 04 00 00       	jmp    1027eb <__alltraps>

00102317 <vector153>:
.globl vector153
vector153:
  pushl $0
  102317:	6a 00                	push   $0x0
  pushl $153
  102319:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10231e:	e9 c8 04 00 00       	jmp    1027eb <__alltraps>

00102323 <vector154>:
.globl vector154
vector154:
  pushl $0
  102323:	6a 00                	push   $0x0
  pushl $154
  102325:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10232a:	e9 bc 04 00 00       	jmp    1027eb <__alltraps>

0010232f <vector155>:
.globl vector155
vector155:
  pushl $0
  10232f:	6a 00                	push   $0x0
  pushl $155
  102331:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102336:	e9 b0 04 00 00       	jmp    1027eb <__alltraps>

0010233b <vector156>:
.globl vector156
vector156:
  pushl $0
  10233b:	6a 00                	push   $0x0
  pushl $156
  10233d:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102342:	e9 a4 04 00 00       	jmp    1027eb <__alltraps>

00102347 <vector157>:
.globl vector157
vector157:
  pushl $0
  102347:	6a 00                	push   $0x0
  pushl $157
  102349:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10234e:	e9 98 04 00 00       	jmp    1027eb <__alltraps>

00102353 <vector158>:
.globl vector158
vector158:
  pushl $0
  102353:	6a 00                	push   $0x0
  pushl $158
  102355:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10235a:	e9 8c 04 00 00       	jmp    1027eb <__alltraps>

0010235f <vector159>:
.globl vector159
vector159:
  pushl $0
  10235f:	6a 00                	push   $0x0
  pushl $159
  102361:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102366:	e9 80 04 00 00       	jmp    1027eb <__alltraps>

0010236b <vector160>:
.globl vector160
vector160:
  pushl $0
  10236b:	6a 00                	push   $0x0
  pushl $160
  10236d:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102372:	e9 74 04 00 00       	jmp    1027eb <__alltraps>

00102377 <vector161>:
.globl vector161
vector161:
  pushl $0
  102377:	6a 00                	push   $0x0
  pushl $161
  102379:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10237e:	e9 68 04 00 00       	jmp    1027eb <__alltraps>

00102383 <vector162>:
.globl vector162
vector162:
  pushl $0
  102383:	6a 00                	push   $0x0
  pushl $162
  102385:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10238a:	e9 5c 04 00 00       	jmp    1027eb <__alltraps>

0010238f <vector163>:
.globl vector163
vector163:
  pushl $0
  10238f:	6a 00                	push   $0x0
  pushl $163
  102391:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102396:	e9 50 04 00 00       	jmp    1027eb <__alltraps>

0010239b <vector164>:
.globl vector164
vector164:
  pushl $0
  10239b:	6a 00                	push   $0x0
  pushl $164
  10239d:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1023a2:	e9 44 04 00 00       	jmp    1027eb <__alltraps>

001023a7 <vector165>:
.globl vector165
vector165:
  pushl $0
  1023a7:	6a 00                	push   $0x0
  pushl $165
  1023a9:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1023ae:	e9 38 04 00 00       	jmp    1027eb <__alltraps>

001023b3 <vector166>:
.globl vector166
vector166:
  pushl $0
  1023b3:	6a 00                	push   $0x0
  pushl $166
  1023b5:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1023ba:	e9 2c 04 00 00       	jmp    1027eb <__alltraps>

001023bf <vector167>:
.globl vector167
vector167:
  pushl $0
  1023bf:	6a 00                	push   $0x0
  pushl $167
  1023c1:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1023c6:	e9 20 04 00 00       	jmp    1027eb <__alltraps>

001023cb <vector168>:
.globl vector168
vector168:
  pushl $0
  1023cb:	6a 00                	push   $0x0
  pushl $168
  1023cd:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1023d2:	e9 14 04 00 00       	jmp    1027eb <__alltraps>

001023d7 <vector169>:
.globl vector169
vector169:
  pushl $0
  1023d7:	6a 00                	push   $0x0
  pushl $169
  1023d9:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1023de:	e9 08 04 00 00       	jmp    1027eb <__alltraps>

001023e3 <vector170>:
.globl vector170
vector170:
  pushl $0
  1023e3:	6a 00                	push   $0x0
  pushl $170
  1023e5:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1023ea:	e9 fc 03 00 00       	jmp    1027eb <__alltraps>

001023ef <vector171>:
.globl vector171
vector171:
  pushl $0
  1023ef:	6a 00                	push   $0x0
  pushl $171
  1023f1:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1023f6:	e9 f0 03 00 00       	jmp    1027eb <__alltraps>

001023fb <vector172>:
.globl vector172
vector172:
  pushl $0
  1023fb:	6a 00                	push   $0x0
  pushl $172
  1023fd:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102402:	e9 e4 03 00 00       	jmp    1027eb <__alltraps>

00102407 <vector173>:
.globl vector173
vector173:
  pushl $0
  102407:	6a 00                	push   $0x0
  pushl $173
  102409:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10240e:	e9 d8 03 00 00       	jmp    1027eb <__alltraps>

00102413 <vector174>:
.globl vector174
vector174:
  pushl $0
  102413:	6a 00                	push   $0x0
  pushl $174
  102415:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10241a:	e9 cc 03 00 00       	jmp    1027eb <__alltraps>

0010241f <vector175>:
.globl vector175
vector175:
  pushl $0
  10241f:	6a 00                	push   $0x0
  pushl $175
  102421:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102426:	e9 c0 03 00 00       	jmp    1027eb <__alltraps>

0010242b <vector176>:
.globl vector176
vector176:
  pushl $0
  10242b:	6a 00                	push   $0x0
  pushl $176
  10242d:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102432:	e9 b4 03 00 00       	jmp    1027eb <__alltraps>

00102437 <vector177>:
.globl vector177
vector177:
  pushl $0
  102437:	6a 00                	push   $0x0
  pushl $177
  102439:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10243e:	e9 a8 03 00 00       	jmp    1027eb <__alltraps>

00102443 <vector178>:
.globl vector178
vector178:
  pushl $0
  102443:	6a 00                	push   $0x0
  pushl $178
  102445:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10244a:	e9 9c 03 00 00       	jmp    1027eb <__alltraps>

0010244f <vector179>:
.globl vector179
vector179:
  pushl $0
  10244f:	6a 00                	push   $0x0
  pushl $179
  102451:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102456:	e9 90 03 00 00       	jmp    1027eb <__alltraps>

0010245b <vector180>:
.globl vector180
vector180:
  pushl $0
  10245b:	6a 00                	push   $0x0
  pushl $180
  10245d:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102462:	e9 84 03 00 00       	jmp    1027eb <__alltraps>

00102467 <vector181>:
.globl vector181
vector181:
  pushl $0
  102467:	6a 00                	push   $0x0
  pushl $181
  102469:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10246e:	e9 78 03 00 00       	jmp    1027eb <__alltraps>

00102473 <vector182>:
.globl vector182
vector182:
  pushl $0
  102473:	6a 00                	push   $0x0
  pushl $182
  102475:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10247a:	e9 6c 03 00 00       	jmp    1027eb <__alltraps>

0010247f <vector183>:
.globl vector183
vector183:
  pushl $0
  10247f:	6a 00                	push   $0x0
  pushl $183
  102481:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102486:	e9 60 03 00 00       	jmp    1027eb <__alltraps>

0010248b <vector184>:
.globl vector184
vector184:
  pushl $0
  10248b:	6a 00                	push   $0x0
  pushl $184
  10248d:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102492:	e9 54 03 00 00       	jmp    1027eb <__alltraps>

00102497 <vector185>:
.globl vector185
vector185:
  pushl $0
  102497:	6a 00                	push   $0x0
  pushl $185
  102499:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10249e:	e9 48 03 00 00       	jmp    1027eb <__alltraps>

001024a3 <vector186>:
.globl vector186
vector186:
  pushl $0
  1024a3:	6a 00                	push   $0x0
  pushl $186
  1024a5:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1024aa:	e9 3c 03 00 00       	jmp    1027eb <__alltraps>

001024af <vector187>:
.globl vector187
vector187:
  pushl $0
  1024af:	6a 00                	push   $0x0
  pushl $187
  1024b1:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1024b6:	e9 30 03 00 00       	jmp    1027eb <__alltraps>

001024bb <vector188>:
.globl vector188
vector188:
  pushl $0
  1024bb:	6a 00                	push   $0x0
  pushl $188
  1024bd:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1024c2:	e9 24 03 00 00       	jmp    1027eb <__alltraps>

001024c7 <vector189>:
.globl vector189
vector189:
  pushl $0
  1024c7:	6a 00                	push   $0x0
  pushl $189
  1024c9:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1024ce:	e9 18 03 00 00       	jmp    1027eb <__alltraps>

001024d3 <vector190>:
.globl vector190
vector190:
  pushl $0
  1024d3:	6a 00                	push   $0x0
  pushl $190
  1024d5:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1024da:	e9 0c 03 00 00       	jmp    1027eb <__alltraps>

001024df <vector191>:
.globl vector191
vector191:
  pushl $0
  1024df:	6a 00                	push   $0x0
  pushl $191
  1024e1:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1024e6:	e9 00 03 00 00       	jmp    1027eb <__alltraps>

001024eb <vector192>:
.globl vector192
vector192:
  pushl $0
  1024eb:	6a 00                	push   $0x0
  pushl $192
  1024ed:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1024f2:	e9 f4 02 00 00       	jmp    1027eb <__alltraps>

001024f7 <vector193>:
.globl vector193
vector193:
  pushl $0
  1024f7:	6a 00                	push   $0x0
  pushl $193
  1024f9:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1024fe:	e9 e8 02 00 00       	jmp    1027eb <__alltraps>

00102503 <vector194>:
.globl vector194
vector194:
  pushl $0
  102503:	6a 00                	push   $0x0
  pushl $194
  102505:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10250a:	e9 dc 02 00 00       	jmp    1027eb <__alltraps>

0010250f <vector195>:
.globl vector195
vector195:
  pushl $0
  10250f:	6a 00                	push   $0x0
  pushl $195
  102511:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102516:	e9 d0 02 00 00       	jmp    1027eb <__alltraps>

0010251b <vector196>:
.globl vector196
vector196:
  pushl $0
  10251b:	6a 00                	push   $0x0
  pushl $196
  10251d:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102522:	e9 c4 02 00 00       	jmp    1027eb <__alltraps>

00102527 <vector197>:
.globl vector197
vector197:
  pushl $0
  102527:	6a 00                	push   $0x0
  pushl $197
  102529:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10252e:	e9 b8 02 00 00       	jmp    1027eb <__alltraps>

00102533 <vector198>:
.globl vector198
vector198:
  pushl $0
  102533:	6a 00                	push   $0x0
  pushl $198
  102535:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10253a:	e9 ac 02 00 00       	jmp    1027eb <__alltraps>

0010253f <vector199>:
.globl vector199
vector199:
  pushl $0
  10253f:	6a 00                	push   $0x0
  pushl $199
  102541:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102546:	e9 a0 02 00 00       	jmp    1027eb <__alltraps>

0010254b <vector200>:
.globl vector200
vector200:
  pushl $0
  10254b:	6a 00                	push   $0x0
  pushl $200
  10254d:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102552:	e9 94 02 00 00       	jmp    1027eb <__alltraps>

00102557 <vector201>:
.globl vector201
vector201:
  pushl $0
  102557:	6a 00                	push   $0x0
  pushl $201
  102559:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10255e:	e9 88 02 00 00       	jmp    1027eb <__alltraps>

00102563 <vector202>:
.globl vector202
vector202:
  pushl $0
  102563:	6a 00                	push   $0x0
  pushl $202
  102565:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10256a:	e9 7c 02 00 00       	jmp    1027eb <__alltraps>

0010256f <vector203>:
.globl vector203
vector203:
  pushl $0
  10256f:	6a 00                	push   $0x0
  pushl $203
  102571:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102576:	e9 70 02 00 00       	jmp    1027eb <__alltraps>

0010257b <vector204>:
.globl vector204
vector204:
  pushl $0
  10257b:	6a 00                	push   $0x0
  pushl $204
  10257d:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102582:	e9 64 02 00 00       	jmp    1027eb <__alltraps>

00102587 <vector205>:
.globl vector205
vector205:
  pushl $0
  102587:	6a 00                	push   $0x0
  pushl $205
  102589:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10258e:	e9 58 02 00 00       	jmp    1027eb <__alltraps>

00102593 <vector206>:
.globl vector206
vector206:
  pushl $0
  102593:	6a 00                	push   $0x0
  pushl $206
  102595:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10259a:	e9 4c 02 00 00       	jmp    1027eb <__alltraps>

0010259f <vector207>:
.globl vector207
vector207:
  pushl $0
  10259f:	6a 00                	push   $0x0
  pushl $207
  1025a1:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1025a6:	e9 40 02 00 00       	jmp    1027eb <__alltraps>

001025ab <vector208>:
.globl vector208
vector208:
  pushl $0
  1025ab:	6a 00                	push   $0x0
  pushl $208
  1025ad:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1025b2:	e9 34 02 00 00       	jmp    1027eb <__alltraps>

001025b7 <vector209>:
.globl vector209
vector209:
  pushl $0
  1025b7:	6a 00                	push   $0x0
  pushl $209
  1025b9:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1025be:	e9 28 02 00 00       	jmp    1027eb <__alltraps>

001025c3 <vector210>:
.globl vector210
vector210:
  pushl $0
  1025c3:	6a 00                	push   $0x0
  pushl $210
  1025c5:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1025ca:	e9 1c 02 00 00       	jmp    1027eb <__alltraps>

001025cf <vector211>:
.globl vector211
vector211:
  pushl $0
  1025cf:	6a 00                	push   $0x0
  pushl $211
  1025d1:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1025d6:	e9 10 02 00 00       	jmp    1027eb <__alltraps>

001025db <vector212>:
.globl vector212
vector212:
  pushl $0
  1025db:	6a 00                	push   $0x0
  pushl $212
  1025dd:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1025e2:	e9 04 02 00 00       	jmp    1027eb <__alltraps>

001025e7 <vector213>:
.globl vector213
vector213:
  pushl $0
  1025e7:	6a 00                	push   $0x0
  pushl $213
  1025e9:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1025ee:	e9 f8 01 00 00       	jmp    1027eb <__alltraps>

001025f3 <vector214>:
.globl vector214
vector214:
  pushl $0
  1025f3:	6a 00                	push   $0x0
  pushl $214
  1025f5:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1025fa:	e9 ec 01 00 00       	jmp    1027eb <__alltraps>

001025ff <vector215>:
.globl vector215
vector215:
  pushl $0
  1025ff:	6a 00                	push   $0x0
  pushl $215
  102601:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102606:	e9 e0 01 00 00       	jmp    1027eb <__alltraps>

0010260b <vector216>:
.globl vector216
vector216:
  pushl $0
  10260b:	6a 00                	push   $0x0
  pushl $216
  10260d:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102612:	e9 d4 01 00 00       	jmp    1027eb <__alltraps>

00102617 <vector217>:
.globl vector217
vector217:
  pushl $0
  102617:	6a 00                	push   $0x0
  pushl $217
  102619:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10261e:	e9 c8 01 00 00       	jmp    1027eb <__alltraps>

00102623 <vector218>:
.globl vector218
vector218:
  pushl $0
  102623:	6a 00                	push   $0x0
  pushl $218
  102625:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10262a:	e9 bc 01 00 00       	jmp    1027eb <__alltraps>

0010262f <vector219>:
.globl vector219
vector219:
  pushl $0
  10262f:	6a 00                	push   $0x0
  pushl $219
  102631:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102636:	e9 b0 01 00 00       	jmp    1027eb <__alltraps>

0010263b <vector220>:
.globl vector220
vector220:
  pushl $0
  10263b:	6a 00                	push   $0x0
  pushl $220
  10263d:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102642:	e9 a4 01 00 00       	jmp    1027eb <__alltraps>

00102647 <vector221>:
.globl vector221
vector221:
  pushl $0
  102647:	6a 00                	push   $0x0
  pushl $221
  102649:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10264e:	e9 98 01 00 00       	jmp    1027eb <__alltraps>

00102653 <vector222>:
.globl vector222
vector222:
  pushl $0
  102653:	6a 00                	push   $0x0
  pushl $222
  102655:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10265a:	e9 8c 01 00 00       	jmp    1027eb <__alltraps>

0010265f <vector223>:
.globl vector223
vector223:
  pushl $0
  10265f:	6a 00                	push   $0x0
  pushl $223
  102661:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102666:	e9 80 01 00 00       	jmp    1027eb <__alltraps>

0010266b <vector224>:
.globl vector224
vector224:
  pushl $0
  10266b:	6a 00                	push   $0x0
  pushl $224
  10266d:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102672:	e9 74 01 00 00       	jmp    1027eb <__alltraps>

00102677 <vector225>:
.globl vector225
vector225:
  pushl $0
  102677:	6a 00                	push   $0x0
  pushl $225
  102679:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10267e:	e9 68 01 00 00       	jmp    1027eb <__alltraps>

00102683 <vector226>:
.globl vector226
vector226:
  pushl $0
  102683:	6a 00                	push   $0x0
  pushl $226
  102685:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10268a:	e9 5c 01 00 00       	jmp    1027eb <__alltraps>

0010268f <vector227>:
.globl vector227
vector227:
  pushl $0
  10268f:	6a 00                	push   $0x0
  pushl $227
  102691:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102696:	e9 50 01 00 00       	jmp    1027eb <__alltraps>

0010269b <vector228>:
.globl vector228
vector228:
  pushl $0
  10269b:	6a 00                	push   $0x0
  pushl $228
  10269d:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1026a2:	e9 44 01 00 00       	jmp    1027eb <__alltraps>

001026a7 <vector229>:
.globl vector229
vector229:
  pushl $0
  1026a7:	6a 00                	push   $0x0
  pushl $229
  1026a9:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1026ae:	e9 38 01 00 00       	jmp    1027eb <__alltraps>

001026b3 <vector230>:
.globl vector230
vector230:
  pushl $0
  1026b3:	6a 00                	push   $0x0
  pushl $230
  1026b5:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1026ba:	e9 2c 01 00 00       	jmp    1027eb <__alltraps>

001026bf <vector231>:
.globl vector231
vector231:
  pushl $0
  1026bf:	6a 00                	push   $0x0
  pushl $231
  1026c1:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1026c6:	e9 20 01 00 00       	jmp    1027eb <__alltraps>

001026cb <vector232>:
.globl vector232
vector232:
  pushl $0
  1026cb:	6a 00                	push   $0x0
  pushl $232
  1026cd:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1026d2:	e9 14 01 00 00       	jmp    1027eb <__alltraps>

001026d7 <vector233>:
.globl vector233
vector233:
  pushl $0
  1026d7:	6a 00                	push   $0x0
  pushl $233
  1026d9:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1026de:	e9 08 01 00 00       	jmp    1027eb <__alltraps>

001026e3 <vector234>:
.globl vector234
vector234:
  pushl $0
  1026e3:	6a 00                	push   $0x0
  pushl $234
  1026e5:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1026ea:	e9 fc 00 00 00       	jmp    1027eb <__alltraps>

001026ef <vector235>:
.globl vector235
vector235:
  pushl $0
  1026ef:	6a 00                	push   $0x0
  pushl $235
  1026f1:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1026f6:	e9 f0 00 00 00       	jmp    1027eb <__alltraps>

001026fb <vector236>:
.globl vector236
vector236:
  pushl $0
  1026fb:	6a 00                	push   $0x0
  pushl $236
  1026fd:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102702:	e9 e4 00 00 00       	jmp    1027eb <__alltraps>

00102707 <vector237>:
.globl vector237
vector237:
  pushl $0
  102707:	6a 00                	push   $0x0
  pushl $237
  102709:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10270e:	e9 d8 00 00 00       	jmp    1027eb <__alltraps>

00102713 <vector238>:
.globl vector238
vector238:
  pushl $0
  102713:	6a 00                	push   $0x0
  pushl $238
  102715:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10271a:	e9 cc 00 00 00       	jmp    1027eb <__alltraps>

0010271f <vector239>:
.globl vector239
vector239:
  pushl $0
  10271f:	6a 00                	push   $0x0
  pushl $239
  102721:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102726:	e9 c0 00 00 00       	jmp    1027eb <__alltraps>

0010272b <vector240>:
.globl vector240
vector240:
  pushl $0
  10272b:	6a 00                	push   $0x0
  pushl $240
  10272d:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102732:	e9 b4 00 00 00       	jmp    1027eb <__alltraps>

00102737 <vector241>:
.globl vector241
vector241:
  pushl $0
  102737:	6a 00                	push   $0x0
  pushl $241
  102739:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10273e:	e9 a8 00 00 00       	jmp    1027eb <__alltraps>

00102743 <vector242>:
.globl vector242
vector242:
  pushl $0
  102743:	6a 00                	push   $0x0
  pushl $242
  102745:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10274a:	e9 9c 00 00 00       	jmp    1027eb <__alltraps>

0010274f <vector243>:
.globl vector243
vector243:
  pushl $0
  10274f:	6a 00                	push   $0x0
  pushl $243
  102751:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102756:	e9 90 00 00 00       	jmp    1027eb <__alltraps>

0010275b <vector244>:
.globl vector244
vector244:
  pushl $0
  10275b:	6a 00                	push   $0x0
  pushl $244
  10275d:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102762:	e9 84 00 00 00       	jmp    1027eb <__alltraps>

00102767 <vector245>:
.globl vector245
vector245:
  pushl $0
  102767:	6a 00                	push   $0x0
  pushl $245
  102769:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10276e:	e9 78 00 00 00       	jmp    1027eb <__alltraps>

00102773 <vector246>:
.globl vector246
vector246:
  pushl $0
  102773:	6a 00                	push   $0x0
  pushl $246
  102775:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10277a:	e9 6c 00 00 00       	jmp    1027eb <__alltraps>

0010277f <vector247>:
.globl vector247
vector247:
  pushl $0
  10277f:	6a 00                	push   $0x0
  pushl $247
  102781:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102786:	e9 60 00 00 00       	jmp    1027eb <__alltraps>

0010278b <vector248>:
.globl vector248
vector248:
  pushl $0
  10278b:	6a 00                	push   $0x0
  pushl $248
  10278d:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102792:	e9 54 00 00 00       	jmp    1027eb <__alltraps>

00102797 <vector249>:
.globl vector249
vector249:
  pushl $0
  102797:	6a 00                	push   $0x0
  pushl $249
  102799:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10279e:	e9 48 00 00 00       	jmp    1027eb <__alltraps>

001027a3 <vector250>:
.globl vector250
vector250:
  pushl $0
  1027a3:	6a 00                	push   $0x0
  pushl $250
  1027a5:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1027aa:	e9 3c 00 00 00       	jmp    1027eb <__alltraps>

001027af <vector251>:
.globl vector251
vector251:
  pushl $0
  1027af:	6a 00                	push   $0x0
  pushl $251
  1027b1:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1027b6:	e9 30 00 00 00       	jmp    1027eb <__alltraps>

001027bb <vector252>:
.globl vector252
vector252:
  pushl $0
  1027bb:	6a 00                	push   $0x0
  pushl $252
  1027bd:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1027c2:	e9 24 00 00 00       	jmp    1027eb <__alltraps>

001027c7 <vector253>:
.globl vector253
vector253:
  pushl $0
  1027c7:	6a 00                	push   $0x0
  pushl $253
  1027c9:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1027ce:	e9 18 00 00 00       	jmp    1027eb <__alltraps>

001027d3 <vector254>:
.globl vector254
vector254:
  pushl $0
  1027d3:	6a 00                	push   $0x0
  pushl $254
  1027d5:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1027da:	e9 0c 00 00 00       	jmp    1027eb <__alltraps>

001027df <vector255>:
.globl vector255
vector255:
  pushl $0
  1027df:	6a 00                	push   $0x0
  pushl $255
  1027e1:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1027e6:	e9 00 00 00 00       	jmp    1027eb <__alltraps>

001027eb <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1027eb:	1e                   	push   %ds
    pushl %es
  1027ec:	06                   	push   %es
    pushl %fs
  1027ed:	0f a0                	push   %fs
    pushl %gs
  1027ef:	0f a8                	push   %gs
    pushal
  1027f1:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  1027f2:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  1027f7:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  1027f9:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  1027fb:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  1027fc:	e8 63 f5 ff ff       	call   101d64 <trap>

    # pop the pushed stack pointer
    popl %esp
  102801:	5c                   	pop    %esp

00102802 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102802:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102803:	0f a9                	pop    %gs
    popl %fs
  102805:	0f a1                	pop    %fs
    popl %es
  102807:	07                   	pop    %es
    popl %ds
  102808:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102809:	83 c4 08             	add    $0x8,%esp
    iret
  10280c:	cf                   	iret   

0010280d <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10280d:	55                   	push   %ebp
  10280e:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102810:	8b 45 08             	mov    0x8(%ebp),%eax
  102813:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102816:	b8 23 00 00 00       	mov    $0x23,%eax
  10281b:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10281d:	b8 23 00 00 00       	mov    $0x23,%eax
  102822:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102824:	b8 10 00 00 00       	mov    $0x10,%eax
  102829:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10282b:	b8 10 00 00 00       	mov    $0x10,%eax
  102830:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102832:	b8 10 00 00 00       	mov    $0x10,%eax
  102837:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102839:	ea 40 28 10 00 08 00 	ljmp   $0x8,$0x102840
}
  102840:	90                   	nop
  102841:	5d                   	pop    %ebp
  102842:	c3                   	ret    

00102843 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102843:	55                   	push   %ebp
  102844:	89 e5                	mov    %esp,%ebp
  102846:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102849:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  10284e:	05 00 04 00 00       	add    $0x400,%eax
  102853:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102858:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  10285f:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102861:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102868:	68 00 
  10286a:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10286f:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102875:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10287a:	c1 e8 10             	shr    $0x10,%eax
  10287d:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102882:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102889:	83 e0 f0             	and    $0xfffffff0,%eax
  10288c:	83 c8 09             	or     $0x9,%eax
  10288f:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102894:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10289b:	83 c8 10             	or     $0x10,%eax
  10289e:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028a3:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028aa:	83 e0 9f             	and    $0xffffff9f,%eax
  1028ad:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028b2:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028b9:	83 c8 80             	or     $0xffffff80,%eax
  1028bc:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028c1:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028c8:	83 e0 f0             	and    $0xfffffff0,%eax
  1028cb:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028d0:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028d7:	83 e0 ef             	and    $0xffffffef,%eax
  1028da:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028df:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028e6:	83 e0 df             	and    $0xffffffdf,%eax
  1028e9:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028ee:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028f5:	83 c8 40             	or     $0x40,%eax
  1028f8:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028fd:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102904:	83 e0 7f             	and    $0x7f,%eax
  102907:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10290c:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102911:	c1 e8 18             	shr    $0x18,%eax
  102914:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102919:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102920:	83 e0 ef             	and    $0xffffffef,%eax
  102923:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102928:	68 10 ea 10 00       	push   $0x10ea10
  10292d:	e8 db fe ff ff       	call   10280d <lgdt>
  102932:	83 c4 04             	add    $0x4,%esp
  102935:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  10293b:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  10293f:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102942:	90                   	nop
  102943:	c9                   	leave  
  102944:	c3                   	ret    

00102945 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102945:	55                   	push   %ebp
  102946:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102948:	e8 f6 fe ff ff       	call   102843 <gdt_init>
}
  10294d:	90                   	nop
  10294e:	5d                   	pop    %ebp
  10294f:	c3                   	ret    

00102950 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102950:	55                   	push   %ebp
  102951:	89 e5                	mov    %esp,%ebp
  102953:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102956:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  10295d:	eb 04                	jmp    102963 <strlen+0x13>
        cnt ++;
  10295f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102963:	8b 45 08             	mov    0x8(%ebp),%eax
  102966:	8d 50 01             	lea    0x1(%eax),%edx
  102969:	89 55 08             	mov    %edx,0x8(%ebp)
  10296c:	0f b6 00             	movzbl (%eax),%eax
  10296f:	84 c0                	test   %al,%al
  102971:	75 ec                	jne    10295f <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102973:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102976:	c9                   	leave  
  102977:	c3                   	ret    

00102978 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102978:	55                   	push   %ebp
  102979:	89 e5                	mov    %esp,%ebp
  10297b:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10297e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102985:	eb 04                	jmp    10298b <strnlen+0x13>
        cnt ++;
  102987:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  10298b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10298e:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102991:	73 10                	jae    1029a3 <strnlen+0x2b>
  102993:	8b 45 08             	mov    0x8(%ebp),%eax
  102996:	8d 50 01             	lea    0x1(%eax),%edx
  102999:	89 55 08             	mov    %edx,0x8(%ebp)
  10299c:	0f b6 00             	movzbl (%eax),%eax
  10299f:	84 c0                	test   %al,%al
  1029a1:	75 e4                	jne    102987 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  1029a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1029a6:	c9                   	leave  
  1029a7:	c3                   	ret    

001029a8 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1029a8:	55                   	push   %ebp
  1029a9:	89 e5                	mov    %esp,%ebp
  1029ab:	57                   	push   %edi
  1029ac:	56                   	push   %esi
  1029ad:	83 ec 20             	sub    $0x20,%esp
  1029b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1029b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  1029bc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1029bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029c2:	89 d1                	mov    %edx,%ecx
  1029c4:	89 c2                	mov    %eax,%edx
  1029c6:	89 ce                	mov    %ecx,%esi
  1029c8:	89 d7                	mov    %edx,%edi
  1029ca:	ac                   	lods   %ds:(%esi),%al
  1029cb:	aa                   	stos   %al,%es:(%edi)
  1029cc:	84 c0                	test   %al,%al
  1029ce:	75 fa                	jne    1029ca <strcpy+0x22>
  1029d0:	89 fa                	mov    %edi,%edx
  1029d2:	89 f1                	mov    %esi,%ecx
  1029d4:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1029d7:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1029da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  1029dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  1029e0:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  1029e1:	83 c4 20             	add    $0x20,%esp
  1029e4:	5e                   	pop    %esi
  1029e5:	5f                   	pop    %edi
  1029e6:	5d                   	pop    %ebp
  1029e7:	c3                   	ret    

001029e8 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1029e8:	55                   	push   %ebp
  1029e9:	89 e5                	mov    %esp,%ebp
  1029eb:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1029ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1029f4:	eb 21                	jmp    102a17 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  1029f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029f9:	0f b6 10             	movzbl (%eax),%edx
  1029fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029ff:	88 10                	mov    %dl,(%eax)
  102a01:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a04:	0f b6 00             	movzbl (%eax),%eax
  102a07:	84 c0                	test   %al,%al
  102a09:	74 04                	je     102a0f <strncpy+0x27>
            src ++;
  102a0b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102a0f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102a13:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102a17:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a1b:	75 d9                	jne    1029f6 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102a1d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102a20:	c9                   	leave  
  102a21:	c3                   	ret    

00102a22 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102a22:	55                   	push   %ebp
  102a23:	89 e5                	mov    %esp,%ebp
  102a25:	57                   	push   %edi
  102a26:	56                   	push   %esi
  102a27:	83 ec 20             	sub    $0x20,%esp
  102a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a30:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a33:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102a36:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a3c:	89 d1                	mov    %edx,%ecx
  102a3e:	89 c2                	mov    %eax,%edx
  102a40:	89 ce                	mov    %ecx,%esi
  102a42:	89 d7                	mov    %edx,%edi
  102a44:	ac                   	lods   %ds:(%esi),%al
  102a45:	ae                   	scas   %es:(%edi),%al
  102a46:	75 08                	jne    102a50 <strcmp+0x2e>
  102a48:	84 c0                	test   %al,%al
  102a4a:	75 f8                	jne    102a44 <strcmp+0x22>
  102a4c:	31 c0                	xor    %eax,%eax
  102a4e:	eb 04                	jmp    102a54 <strcmp+0x32>
  102a50:	19 c0                	sbb    %eax,%eax
  102a52:	0c 01                	or     $0x1,%al
  102a54:	89 fa                	mov    %edi,%edx
  102a56:	89 f1                	mov    %esi,%ecx
  102a58:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102a5b:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102a5e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102a61:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102a64:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102a65:	83 c4 20             	add    $0x20,%esp
  102a68:	5e                   	pop    %esi
  102a69:	5f                   	pop    %edi
  102a6a:	5d                   	pop    %ebp
  102a6b:	c3                   	ret    

00102a6c <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102a6c:	55                   	push   %ebp
  102a6d:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102a6f:	eb 0c                	jmp    102a7d <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102a71:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102a75:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a79:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102a7d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a81:	74 1a                	je     102a9d <strncmp+0x31>
  102a83:	8b 45 08             	mov    0x8(%ebp),%eax
  102a86:	0f b6 00             	movzbl (%eax),%eax
  102a89:	84 c0                	test   %al,%al
  102a8b:	74 10                	je     102a9d <strncmp+0x31>
  102a8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a90:	0f b6 10             	movzbl (%eax),%edx
  102a93:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a96:	0f b6 00             	movzbl (%eax),%eax
  102a99:	38 c2                	cmp    %al,%dl
  102a9b:	74 d4                	je     102a71 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102a9d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102aa1:	74 18                	je     102abb <strncmp+0x4f>
  102aa3:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa6:	0f b6 00             	movzbl (%eax),%eax
  102aa9:	0f b6 d0             	movzbl %al,%edx
  102aac:	8b 45 0c             	mov    0xc(%ebp),%eax
  102aaf:	0f b6 00             	movzbl (%eax),%eax
  102ab2:	0f b6 c0             	movzbl %al,%eax
  102ab5:	29 c2                	sub    %eax,%edx
  102ab7:	89 d0                	mov    %edx,%eax
  102ab9:	eb 05                	jmp    102ac0 <strncmp+0x54>
  102abb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102ac0:	5d                   	pop    %ebp
  102ac1:	c3                   	ret    

00102ac2 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102ac2:	55                   	push   %ebp
  102ac3:	89 e5                	mov    %esp,%ebp
  102ac5:	83 ec 04             	sub    $0x4,%esp
  102ac8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102acb:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102ace:	eb 14                	jmp    102ae4 <strchr+0x22>
        if (*s == c) {
  102ad0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad3:	0f b6 00             	movzbl (%eax),%eax
  102ad6:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102ad9:	75 05                	jne    102ae0 <strchr+0x1e>
            return (char *)s;
  102adb:	8b 45 08             	mov    0x8(%ebp),%eax
  102ade:	eb 13                	jmp    102af3 <strchr+0x31>
        }
        s ++;
  102ae0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102ae4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae7:	0f b6 00             	movzbl (%eax),%eax
  102aea:	84 c0                	test   %al,%al
  102aec:	75 e2                	jne    102ad0 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102aee:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102af3:	c9                   	leave  
  102af4:	c3                   	ret    

00102af5 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102af5:	55                   	push   %ebp
  102af6:	89 e5                	mov    %esp,%ebp
  102af8:	83 ec 04             	sub    $0x4,%esp
  102afb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102afe:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102b01:	eb 0f                	jmp    102b12 <strfind+0x1d>
        if (*s == c) {
  102b03:	8b 45 08             	mov    0x8(%ebp),%eax
  102b06:	0f b6 00             	movzbl (%eax),%eax
  102b09:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102b0c:	74 10                	je     102b1e <strfind+0x29>
            break;
        }
        s ++;
  102b0e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102b12:	8b 45 08             	mov    0x8(%ebp),%eax
  102b15:	0f b6 00             	movzbl (%eax),%eax
  102b18:	84 c0                	test   %al,%al
  102b1a:	75 e7                	jne    102b03 <strfind+0xe>
  102b1c:	eb 01                	jmp    102b1f <strfind+0x2a>
        if (*s == c) {
            break;
  102b1e:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  102b1f:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b22:	c9                   	leave  
  102b23:	c3                   	ret    

00102b24 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102b24:	55                   	push   %ebp
  102b25:	89 e5                	mov    %esp,%ebp
  102b27:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102b2a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102b31:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102b38:	eb 04                	jmp    102b3e <strtol+0x1a>
        s ++;
  102b3a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102b3e:	8b 45 08             	mov    0x8(%ebp),%eax
  102b41:	0f b6 00             	movzbl (%eax),%eax
  102b44:	3c 20                	cmp    $0x20,%al
  102b46:	74 f2                	je     102b3a <strtol+0x16>
  102b48:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4b:	0f b6 00             	movzbl (%eax),%eax
  102b4e:	3c 09                	cmp    $0x9,%al
  102b50:	74 e8                	je     102b3a <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102b52:	8b 45 08             	mov    0x8(%ebp),%eax
  102b55:	0f b6 00             	movzbl (%eax),%eax
  102b58:	3c 2b                	cmp    $0x2b,%al
  102b5a:	75 06                	jne    102b62 <strtol+0x3e>
        s ++;
  102b5c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b60:	eb 15                	jmp    102b77 <strtol+0x53>
    }
    else if (*s == '-') {
  102b62:	8b 45 08             	mov    0x8(%ebp),%eax
  102b65:	0f b6 00             	movzbl (%eax),%eax
  102b68:	3c 2d                	cmp    $0x2d,%al
  102b6a:	75 0b                	jne    102b77 <strtol+0x53>
        s ++, neg = 1;
  102b6c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b70:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102b77:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b7b:	74 06                	je     102b83 <strtol+0x5f>
  102b7d:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102b81:	75 24                	jne    102ba7 <strtol+0x83>
  102b83:	8b 45 08             	mov    0x8(%ebp),%eax
  102b86:	0f b6 00             	movzbl (%eax),%eax
  102b89:	3c 30                	cmp    $0x30,%al
  102b8b:	75 1a                	jne    102ba7 <strtol+0x83>
  102b8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102b90:	83 c0 01             	add    $0x1,%eax
  102b93:	0f b6 00             	movzbl (%eax),%eax
  102b96:	3c 78                	cmp    $0x78,%al
  102b98:	75 0d                	jne    102ba7 <strtol+0x83>
        s += 2, base = 16;
  102b9a:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102b9e:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102ba5:	eb 2a                	jmp    102bd1 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102ba7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bab:	75 17                	jne    102bc4 <strtol+0xa0>
  102bad:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb0:	0f b6 00             	movzbl (%eax),%eax
  102bb3:	3c 30                	cmp    $0x30,%al
  102bb5:	75 0d                	jne    102bc4 <strtol+0xa0>
        s ++, base = 8;
  102bb7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102bbb:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102bc2:	eb 0d                	jmp    102bd1 <strtol+0xad>
    }
    else if (base == 0) {
  102bc4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bc8:	75 07                	jne    102bd1 <strtol+0xad>
        base = 10;
  102bca:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102bd1:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd4:	0f b6 00             	movzbl (%eax),%eax
  102bd7:	3c 2f                	cmp    $0x2f,%al
  102bd9:	7e 1b                	jle    102bf6 <strtol+0xd2>
  102bdb:	8b 45 08             	mov    0x8(%ebp),%eax
  102bde:	0f b6 00             	movzbl (%eax),%eax
  102be1:	3c 39                	cmp    $0x39,%al
  102be3:	7f 11                	jg     102bf6 <strtol+0xd2>
            dig = *s - '0';
  102be5:	8b 45 08             	mov    0x8(%ebp),%eax
  102be8:	0f b6 00             	movzbl (%eax),%eax
  102beb:	0f be c0             	movsbl %al,%eax
  102bee:	83 e8 30             	sub    $0x30,%eax
  102bf1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bf4:	eb 48                	jmp    102c3e <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102bf6:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf9:	0f b6 00             	movzbl (%eax),%eax
  102bfc:	3c 60                	cmp    $0x60,%al
  102bfe:	7e 1b                	jle    102c1b <strtol+0xf7>
  102c00:	8b 45 08             	mov    0x8(%ebp),%eax
  102c03:	0f b6 00             	movzbl (%eax),%eax
  102c06:	3c 7a                	cmp    $0x7a,%al
  102c08:	7f 11                	jg     102c1b <strtol+0xf7>
            dig = *s - 'a' + 10;
  102c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0d:	0f b6 00             	movzbl (%eax),%eax
  102c10:	0f be c0             	movsbl %al,%eax
  102c13:	83 e8 57             	sub    $0x57,%eax
  102c16:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c19:	eb 23                	jmp    102c3e <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102c1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1e:	0f b6 00             	movzbl (%eax),%eax
  102c21:	3c 40                	cmp    $0x40,%al
  102c23:	7e 3c                	jle    102c61 <strtol+0x13d>
  102c25:	8b 45 08             	mov    0x8(%ebp),%eax
  102c28:	0f b6 00             	movzbl (%eax),%eax
  102c2b:	3c 5a                	cmp    $0x5a,%al
  102c2d:	7f 32                	jg     102c61 <strtol+0x13d>
            dig = *s - 'A' + 10;
  102c2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c32:	0f b6 00             	movzbl (%eax),%eax
  102c35:	0f be c0             	movsbl %al,%eax
  102c38:	83 e8 37             	sub    $0x37,%eax
  102c3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102c3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c41:	3b 45 10             	cmp    0x10(%ebp),%eax
  102c44:	7d 1a                	jge    102c60 <strtol+0x13c>
            break;
        }
        s ++, val = (val * base) + dig;
  102c46:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c4a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c4d:	0f af 45 10          	imul   0x10(%ebp),%eax
  102c51:	89 c2                	mov    %eax,%edx
  102c53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c56:	01 d0                	add    %edx,%eax
  102c58:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102c5b:	e9 71 ff ff ff       	jmp    102bd1 <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102c60:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102c61:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102c65:	74 08                	je     102c6f <strtol+0x14b>
        *endptr = (char *) s;
  102c67:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c6a:	8b 55 08             	mov    0x8(%ebp),%edx
  102c6d:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102c6f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102c73:	74 07                	je     102c7c <strtol+0x158>
  102c75:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c78:	f7 d8                	neg    %eax
  102c7a:	eb 03                	jmp    102c7f <strtol+0x15b>
  102c7c:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102c7f:	c9                   	leave  
  102c80:	c3                   	ret    

00102c81 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102c81:	55                   	push   %ebp
  102c82:	89 e5                	mov    %esp,%ebp
  102c84:	57                   	push   %edi
  102c85:	83 ec 24             	sub    $0x24,%esp
  102c88:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c8b:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102c8e:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102c92:	8b 55 08             	mov    0x8(%ebp),%edx
  102c95:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102c98:	88 45 f7             	mov    %al,-0x9(%ebp)
  102c9b:	8b 45 10             	mov    0x10(%ebp),%eax
  102c9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102ca1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102ca4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102ca8:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102cab:	89 d7                	mov    %edx,%edi
  102cad:	f3 aa                	rep stos %al,%es:(%edi)
  102caf:	89 fa                	mov    %edi,%edx
  102cb1:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102cb4:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102cb7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102cba:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102cbb:	83 c4 24             	add    $0x24,%esp
  102cbe:	5f                   	pop    %edi
  102cbf:	5d                   	pop    %ebp
  102cc0:	c3                   	ret    

00102cc1 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102cc1:	55                   	push   %ebp
  102cc2:	89 e5                	mov    %esp,%ebp
  102cc4:	57                   	push   %edi
  102cc5:	56                   	push   %esi
  102cc6:	53                   	push   %ebx
  102cc7:	83 ec 30             	sub    $0x30,%esp
  102cca:	8b 45 08             	mov    0x8(%ebp),%eax
  102ccd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cd3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102cd6:	8b 45 10             	mov    0x10(%ebp),%eax
  102cd9:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102cdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cdf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102ce2:	73 42                	jae    102d26 <memmove+0x65>
  102ce4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ce7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102cea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ced:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102cf0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102cf3:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102cf6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102cf9:	c1 e8 02             	shr    $0x2,%eax
  102cfc:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102cfe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102d01:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d04:	89 d7                	mov    %edx,%edi
  102d06:	89 c6                	mov    %eax,%esi
  102d08:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102d0a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102d0d:	83 e1 03             	and    $0x3,%ecx
  102d10:	74 02                	je     102d14 <memmove+0x53>
  102d12:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102d14:	89 f0                	mov    %esi,%eax
  102d16:	89 fa                	mov    %edi,%edx
  102d18:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102d1b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102d1e:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102d21:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102d24:	eb 36                	jmp    102d5c <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102d26:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d29:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d2f:	01 c2                	add    %eax,%edx
  102d31:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d34:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102d37:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d3a:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102d3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d40:	89 c1                	mov    %eax,%ecx
  102d42:	89 d8                	mov    %ebx,%eax
  102d44:	89 d6                	mov    %edx,%esi
  102d46:	89 c7                	mov    %eax,%edi
  102d48:	fd                   	std    
  102d49:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102d4b:	fc                   	cld    
  102d4c:	89 f8                	mov    %edi,%eax
  102d4e:	89 f2                	mov    %esi,%edx
  102d50:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102d53:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102d56:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102d5c:	83 c4 30             	add    $0x30,%esp
  102d5f:	5b                   	pop    %ebx
  102d60:	5e                   	pop    %esi
  102d61:	5f                   	pop    %edi
  102d62:	5d                   	pop    %ebp
  102d63:	c3                   	ret    

00102d64 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102d64:	55                   	push   %ebp
  102d65:	89 e5                	mov    %esp,%ebp
  102d67:	57                   	push   %edi
  102d68:	56                   	push   %esi
  102d69:	83 ec 20             	sub    $0x20,%esp
  102d6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d72:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d75:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d78:	8b 45 10             	mov    0x10(%ebp),%eax
  102d7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102d7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d81:	c1 e8 02             	shr    $0x2,%eax
  102d84:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102d86:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d89:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d8c:	89 d7                	mov    %edx,%edi
  102d8e:	89 c6                	mov    %eax,%esi
  102d90:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102d92:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102d95:	83 e1 03             	and    $0x3,%ecx
  102d98:	74 02                	je     102d9c <memcpy+0x38>
  102d9a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102d9c:	89 f0                	mov    %esi,%eax
  102d9e:	89 fa                	mov    %edi,%edx
  102da0:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102da3:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102da6:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102da9:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102dac:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102dad:	83 c4 20             	add    $0x20,%esp
  102db0:	5e                   	pop    %esi
  102db1:	5f                   	pop    %edi
  102db2:	5d                   	pop    %ebp
  102db3:	c3                   	ret    

00102db4 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102db4:	55                   	push   %ebp
  102db5:	89 e5                	mov    %esp,%ebp
  102db7:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102dba:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbd:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102dc0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc3:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102dc6:	eb 30                	jmp    102df8 <memcmp+0x44>
        if (*s1 != *s2) {
  102dc8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102dcb:	0f b6 10             	movzbl (%eax),%edx
  102dce:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102dd1:	0f b6 00             	movzbl (%eax),%eax
  102dd4:	38 c2                	cmp    %al,%dl
  102dd6:	74 18                	je     102df0 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102dd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ddb:	0f b6 00             	movzbl (%eax),%eax
  102dde:	0f b6 d0             	movzbl %al,%edx
  102de1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102de4:	0f b6 00             	movzbl (%eax),%eax
  102de7:	0f b6 c0             	movzbl %al,%eax
  102dea:	29 c2                	sub    %eax,%edx
  102dec:	89 d0                	mov    %edx,%eax
  102dee:	eb 1a                	jmp    102e0a <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102df0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102df4:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102df8:	8b 45 10             	mov    0x10(%ebp),%eax
  102dfb:	8d 50 ff             	lea    -0x1(%eax),%edx
  102dfe:	89 55 10             	mov    %edx,0x10(%ebp)
  102e01:	85 c0                	test   %eax,%eax
  102e03:	75 c3                	jne    102dc8 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102e05:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102e0a:	c9                   	leave  
  102e0b:	c3                   	ret    

00102e0c <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102e0c:	55                   	push   %ebp
  102e0d:	89 e5                	mov    %esp,%ebp
  102e0f:	83 ec 38             	sub    $0x38,%esp
  102e12:	8b 45 10             	mov    0x10(%ebp),%eax
  102e15:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102e18:	8b 45 14             	mov    0x14(%ebp),%eax
  102e1b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102e1e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102e21:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102e24:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e27:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102e2a:	8b 45 18             	mov    0x18(%ebp),%eax
  102e2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e30:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e33:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102e36:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e39:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102e3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e42:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102e46:	74 1c                	je     102e64 <printnum+0x58>
  102e48:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e4b:	ba 00 00 00 00       	mov    $0x0,%edx
  102e50:	f7 75 e4             	divl   -0x1c(%ebp)
  102e53:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102e56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e59:	ba 00 00 00 00       	mov    $0x0,%edx
  102e5e:	f7 75 e4             	divl   -0x1c(%ebp)
  102e61:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e64:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e67:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e6a:	f7 75 e4             	divl   -0x1c(%ebp)
  102e6d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e70:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102e73:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e76:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e79:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e7c:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102e7f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e82:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102e85:	8b 45 18             	mov    0x18(%ebp),%eax
  102e88:	ba 00 00 00 00       	mov    $0x0,%edx
  102e8d:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102e90:	77 41                	ja     102ed3 <printnum+0xc7>
  102e92:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102e95:	72 05                	jb     102e9c <printnum+0x90>
  102e97:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102e9a:	77 37                	ja     102ed3 <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102e9c:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102e9f:	83 e8 01             	sub    $0x1,%eax
  102ea2:	83 ec 04             	sub    $0x4,%esp
  102ea5:	ff 75 20             	pushl  0x20(%ebp)
  102ea8:	50                   	push   %eax
  102ea9:	ff 75 18             	pushl  0x18(%ebp)
  102eac:	ff 75 ec             	pushl  -0x14(%ebp)
  102eaf:	ff 75 e8             	pushl  -0x18(%ebp)
  102eb2:	ff 75 0c             	pushl  0xc(%ebp)
  102eb5:	ff 75 08             	pushl  0x8(%ebp)
  102eb8:	e8 4f ff ff ff       	call   102e0c <printnum>
  102ebd:	83 c4 20             	add    $0x20,%esp
  102ec0:	eb 1b                	jmp    102edd <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102ec2:	83 ec 08             	sub    $0x8,%esp
  102ec5:	ff 75 0c             	pushl  0xc(%ebp)
  102ec8:	ff 75 20             	pushl  0x20(%ebp)
  102ecb:	8b 45 08             	mov    0x8(%ebp),%eax
  102ece:	ff d0                	call   *%eax
  102ed0:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102ed3:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102ed7:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102edb:	7f e5                	jg     102ec2 <printnum+0xb6>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102edd:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102ee0:	05 b0 3b 10 00       	add    $0x103bb0,%eax
  102ee5:	0f b6 00             	movzbl (%eax),%eax
  102ee8:	0f be c0             	movsbl %al,%eax
  102eeb:	83 ec 08             	sub    $0x8,%esp
  102eee:	ff 75 0c             	pushl  0xc(%ebp)
  102ef1:	50                   	push   %eax
  102ef2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef5:	ff d0                	call   *%eax
  102ef7:	83 c4 10             	add    $0x10,%esp
}
  102efa:	90                   	nop
  102efb:	c9                   	leave  
  102efc:	c3                   	ret    

00102efd <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102efd:	55                   	push   %ebp
  102efe:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102f00:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102f04:	7e 14                	jle    102f1a <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102f06:	8b 45 08             	mov    0x8(%ebp),%eax
  102f09:	8b 00                	mov    (%eax),%eax
  102f0b:	8d 48 08             	lea    0x8(%eax),%ecx
  102f0e:	8b 55 08             	mov    0x8(%ebp),%edx
  102f11:	89 0a                	mov    %ecx,(%edx)
  102f13:	8b 50 04             	mov    0x4(%eax),%edx
  102f16:	8b 00                	mov    (%eax),%eax
  102f18:	eb 30                	jmp    102f4a <getuint+0x4d>
    }
    else if (lflag) {
  102f1a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f1e:	74 16                	je     102f36 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102f20:	8b 45 08             	mov    0x8(%ebp),%eax
  102f23:	8b 00                	mov    (%eax),%eax
  102f25:	8d 48 04             	lea    0x4(%eax),%ecx
  102f28:	8b 55 08             	mov    0x8(%ebp),%edx
  102f2b:	89 0a                	mov    %ecx,(%edx)
  102f2d:	8b 00                	mov    (%eax),%eax
  102f2f:	ba 00 00 00 00       	mov    $0x0,%edx
  102f34:	eb 14                	jmp    102f4a <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102f36:	8b 45 08             	mov    0x8(%ebp),%eax
  102f39:	8b 00                	mov    (%eax),%eax
  102f3b:	8d 48 04             	lea    0x4(%eax),%ecx
  102f3e:	8b 55 08             	mov    0x8(%ebp),%edx
  102f41:	89 0a                	mov    %ecx,(%edx)
  102f43:	8b 00                	mov    (%eax),%eax
  102f45:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102f4a:	5d                   	pop    %ebp
  102f4b:	c3                   	ret    

00102f4c <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102f4c:	55                   	push   %ebp
  102f4d:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102f4f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102f53:	7e 14                	jle    102f69 <getint+0x1d>
        return va_arg(*ap, long long);
  102f55:	8b 45 08             	mov    0x8(%ebp),%eax
  102f58:	8b 00                	mov    (%eax),%eax
  102f5a:	8d 48 08             	lea    0x8(%eax),%ecx
  102f5d:	8b 55 08             	mov    0x8(%ebp),%edx
  102f60:	89 0a                	mov    %ecx,(%edx)
  102f62:	8b 50 04             	mov    0x4(%eax),%edx
  102f65:	8b 00                	mov    (%eax),%eax
  102f67:	eb 28                	jmp    102f91 <getint+0x45>
    }
    else if (lflag) {
  102f69:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f6d:	74 12                	je     102f81 <getint+0x35>
        return va_arg(*ap, long);
  102f6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f72:	8b 00                	mov    (%eax),%eax
  102f74:	8d 48 04             	lea    0x4(%eax),%ecx
  102f77:	8b 55 08             	mov    0x8(%ebp),%edx
  102f7a:	89 0a                	mov    %ecx,(%edx)
  102f7c:	8b 00                	mov    (%eax),%eax
  102f7e:	99                   	cltd   
  102f7f:	eb 10                	jmp    102f91 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102f81:	8b 45 08             	mov    0x8(%ebp),%eax
  102f84:	8b 00                	mov    (%eax),%eax
  102f86:	8d 48 04             	lea    0x4(%eax),%ecx
  102f89:	8b 55 08             	mov    0x8(%ebp),%edx
  102f8c:	89 0a                	mov    %ecx,(%edx)
  102f8e:	8b 00                	mov    (%eax),%eax
  102f90:	99                   	cltd   
    }
}
  102f91:	5d                   	pop    %ebp
  102f92:	c3                   	ret    

00102f93 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102f93:	55                   	push   %ebp
  102f94:	89 e5                	mov    %esp,%ebp
  102f96:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102f99:	8d 45 14             	lea    0x14(%ebp),%eax
  102f9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102f9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102fa2:	50                   	push   %eax
  102fa3:	ff 75 10             	pushl  0x10(%ebp)
  102fa6:	ff 75 0c             	pushl  0xc(%ebp)
  102fa9:	ff 75 08             	pushl  0x8(%ebp)
  102fac:	e8 06 00 00 00       	call   102fb7 <vprintfmt>
  102fb1:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102fb4:	90                   	nop
  102fb5:	c9                   	leave  
  102fb6:	c3                   	ret    

00102fb7 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102fb7:	55                   	push   %ebp
  102fb8:	89 e5                	mov    %esp,%ebp
  102fba:	56                   	push   %esi
  102fbb:	53                   	push   %ebx
  102fbc:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102fbf:	eb 17                	jmp    102fd8 <vprintfmt+0x21>
            if (ch == '\0') {
  102fc1:	85 db                	test   %ebx,%ebx
  102fc3:	0f 84 8e 03 00 00    	je     103357 <vprintfmt+0x3a0>
                return;
            }
            putch(ch, putdat);
  102fc9:	83 ec 08             	sub    $0x8,%esp
  102fcc:	ff 75 0c             	pushl  0xc(%ebp)
  102fcf:	53                   	push   %ebx
  102fd0:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd3:	ff d0                	call   *%eax
  102fd5:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102fd8:	8b 45 10             	mov    0x10(%ebp),%eax
  102fdb:	8d 50 01             	lea    0x1(%eax),%edx
  102fde:	89 55 10             	mov    %edx,0x10(%ebp)
  102fe1:	0f b6 00             	movzbl (%eax),%eax
  102fe4:	0f b6 d8             	movzbl %al,%ebx
  102fe7:	83 fb 25             	cmp    $0x25,%ebx
  102fea:	75 d5                	jne    102fc1 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102fec:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102ff0:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102ff7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ffa:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102ffd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103004:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103007:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10300a:	8b 45 10             	mov    0x10(%ebp),%eax
  10300d:	8d 50 01             	lea    0x1(%eax),%edx
  103010:	89 55 10             	mov    %edx,0x10(%ebp)
  103013:	0f b6 00             	movzbl (%eax),%eax
  103016:	0f b6 d8             	movzbl %al,%ebx
  103019:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10301c:	83 f8 55             	cmp    $0x55,%eax
  10301f:	0f 87 05 03 00 00    	ja     10332a <vprintfmt+0x373>
  103025:	8b 04 85 d4 3b 10 00 	mov    0x103bd4(,%eax,4),%eax
  10302c:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  10302e:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  103032:	eb d6                	jmp    10300a <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  103034:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  103038:	eb d0                	jmp    10300a <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  10303a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  103041:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103044:	89 d0                	mov    %edx,%eax
  103046:	c1 e0 02             	shl    $0x2,%eax
  103049:	01 d0                	add    %edx,%eax
  10304b:	01 c0                	add    %eax,%eax
  10304d:	01 d8                	add    %ebx,%eax
  10304f:	83 e8 30             	sub    $0x30,%eax
  103052:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  103055:	8b 45 10             	mov    0x10(%ebp),%eax
  103058:	0f b6 00             	movzbl (%eax),%eax
  10305b:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  10305e:	83 fb 2f             	cmp    $0x2f,%ebx
  103061:	7e 39                	jle    10309c <vprintfmt+0xe5>
  103063:	83 fb 39             	cmp    $0x39,%ebx
  103066:	7f 34                	jg     10309c <vprintfmt+0xe5>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103068:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  10306c:	eb d3                	jmp    103041 <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  10306e:	8b 45 14             	mov    0x14(%ebp),%eax
  103071:	8d 50 04             	lea    0x4(%eax),%edx
  103074:	89 55 14             	mov    %edx,0x14(%ebp)
  103077:	8b 00                	mov    (%eax),%eax
  103079:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  10307c:	eb 1f                	jmp    10309d <vprintfmt+0xe6>

        case '.':
            if (width < 0)
  10307e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103082:	79 86                	jns    10300a <vprintfmt+0x53>
                width = 0;
  103084:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  10308b:	e9 7a ff ff ff       	jmp    10300a <vprintfmt+0x53>

        case '#':
            altflag = 1;
  103090:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103097:	e9 6e ff ff ff       	jmp    10300a <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  10309c:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  10309d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1030a1:	0f 89 63 ff ff ff    	jns    10300a <vprintfmt+0x53>
                width = precision, precision = -1;
  1030a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1030aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1030ad:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1030b4:	e9 51 ff ff ff       	jmp    10300a <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1030b9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  1030bd:	e9 48 ff ff ff       	jmp    10300a <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1030c2:	8b 45 14             	mov    0x14(%ebp),%eax
  1030c5:	8d 50 04             	lea    0x4(%eax),%edx
  1030c8:	89 55 14             	mov    %edx,0x14(%ebp)
  1030cb:	8b 00                	mov    (%eax),%eax
  1030cd:	83 ec 08             	sub    $0x8,%esp
  1030d0:	ff 75 0c             	pushl  0xc(%ebp)
  1030d3:	50                   	push   %eax
  1030d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d7:	ff d0                	call   *%eax
  1030d9:	83 c4 10             	add    $0x10,%esp
            break;
  1030dc:	e9 71 02 00 00       	jmp    103352 <vprintfmt+0x39b>

        // error message
        case 'e':
            err = va_arg(ap, int);
  1030e1:	8b 45 14             	mov    0x14(%ebp),%eax
  1030e4:	8d 50 04             	lea    0x4(%eax),%edx
  1030e7:	89 55 14             	mov    %edx,0x14(%ebp)
  1030ea:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  1030ec:	85 db                	test   %ebx,%ebx
  1030ee:	79 02                	jns    1030f2 <vprintfmt+0x13b>
                err = -err;
  1030f0:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  1030f2:	83 fb 06             	cmp    $0x6,%ebx
  1030f5:	7f 0b                	jg     103102 <vprintfmt+0x14b>
  1030f7:	8b 34 9d 94 3b 10 00 	mov    0x103b94(,%ebx,4),%esi
  1030fe:	85 f6                	test   %esi,%esi
  103100:	75 19                	jne    10311b <vprintfmt+0x164>
                printfmt(putch, putdat, "error %d", err);
  103102:	53                   	push   %ebx
  103103:	68 c1 3b 10 00       	push   $0x103bc1
  103108:	ff 75 0c             	pushl  0xc(%ebp)
  10310b:	ff 75 08             	pushl  0x8(%ebp)
  10310e:	e8 80 fe ff ff       	call   102f93 <printfmt>
  103113:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103116:	e9 37 02 00 00       	jmp    103352 <vprintfmt+0x39b>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  10311b:	56                   	push   %esi
  10311c:	68 ca 3b 10 00       	push   $0x103bca
  103121:	ff 75 0c             	pushl  0xc(%ebp)
  103124:	ff 75 08             	pushl  0x8(%ebp)
  103127:	e8 67 fe ff ff       	call   102f93 <printfmt>
  10312c:	83 c4 10             	add    $0x10,%esp
            }
            break;
  10312f:	e9 1e 02 00 00       	jmp    103352 <vprintfmt+0x39b>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103134:	8b 45 14             	mov    0x14(%ebp),%eax
  103137:	8d 50 04             	lea    0x4(%eax),%edx
  10313a:	89 55 14             	mov    %edx,0x14(%ebp)
  10313d:	8b 30                	mov    (%eax),%esi
  10313f:	85 f6                	test   %esi,%esi
  103141:	75 05                	jne    103148 <vprintfmt+0x191>
                p = "(null)";
  103143:	be cd 3b 10 00       	mov    $0x103bcd,%esi
            }
            if (width > 0 && padc != '-') {
  103148:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10314c:	7e 76                	jle    1031c4 <vprintfmt+0x20d>
  10314e:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103152:	74 70                	je     1031c4 <vprintfmt+0x20d>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103154:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103157:	83 ec 08             	sub    $0x8,%esp
  10315a:	50                   	push   %eax
  10315b:	56                   	push   %esi
  10315c:	e8 17 f8 ff ff       	call   102978 <strnlen>
  103161:	83 c4 10             	add    $0x10,%esp
  103164:	89 c2                	mov    %eax,%edx
  103166:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103169:	29 d0                	sub    %edx,%eax
  10316b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10316e:	eb 17                	jmp    103187 <vprintfmt+0x1d0>
                    putch(padc, putdat);
  103170:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103174:	83 ec 08             	sub    $0x8,%esp
  103177:	ff 75 0c             	pushl  0xc(%ebp)
  10317a:	50                   	push   %eax
  10317b:	8b 45 08             	mov    0x8(%ebp),%eax
  10317e:	ff d0                	call   *%eax
  103180:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  103183:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103187:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10318b:	7f e3                	jg     103170 <vprintfmt+0x1b9>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10318d:	eb 35                	jmp    1031c4 <vprintfmt+0x20d>
                if (altflag && (ch < ' ' || ch > '~')) {
  10318f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103193:	74 1c                	je     1031b1 <vprintfmt+0x1fa>
  103195:	83 fb 1f             	cmp    $0x1f,%ebx
  103198:	7e 05                	jle    10319f <vprintfmt+0x1e8>
  10319a:	83 fb 7e             	cmp    $0x7e,%ebx
  10319d:	7e 12                	jle    1031b1 <vprintfmt+0x1fa>
                    putch('?', putdat);
  10319f:	83 ec 08             	sub    $0x8,%esp
  1031a2:	ff 75 0c             	pushl  0xc(%ebp)
  1031a5:	6a 3f                	push   $0x3f
  1031a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031aa:	ff d0                	call   *%eax
  1031ac:	83 c4 10             	add    $0x10,%esp
  1031af:	eb 0f                	jmp    1031c0 <vprintfmt+0x209>
                }
                else {
                    putch(ch, putdat);
  1031b1:	83 ec 08             	sub    $0x8,%esp
  1031b4:	ff 75 0c             	pushl  0xc(%ebp)
  1031b7:	53                   	push   %ebx
  1031b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1031bb:	ff d0                	call   *%eax
  1031bd:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1031c0:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1031c4:	89 f0                	mov    %esi,%eax
  1031c6:	8d 70 01             	lea    0x1(%eax),%esi
  1031c9:	0f b6 00             	movzbl (%eax),%eax
  1031cc:	0f be d8             	movsbl %al,%ebx
  1031cf:	85 db                	test   %ebx,%ebx
  1031d1:	74 26                	je     1031f9 <vprintfmt+0x242>
  1031d3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1031d7:	78 b6                	js     10318f <vprintfmt+0x1d8>
  1031d9:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  1031dd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1031e1:	79 ac                	jns    10318f <vprintfmt+0x1d8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  1031e3:	eb 14                	jmp    1031f9 <vprintfmt+0x242>
                putch(' ', putdat);
  1031e5:	83 ec 08             	sub    $0x8,%esp
  1031e8:	ff 75 0c             	pushl  0xc(%ebp)
  1031eb:	6a 20                	push   $0x20
  1031ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f0:	ff d0                	call   *%eax
  1031f2:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  1031f5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1031f9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031fd:	7f e6                	jg     1031e5 <vprintfmt+0x22e>
                putch(' ', putdat);
            }
            break;
  1031ff:	e9 4e 01 00 00       	jmp    103352 <vprintfmt+0x39b>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103204:	83 ec 08             	sub    $0x8,%esp
  103207:	ff 75 e0             	pushl  -0x20(%ebp)
  10320a:	8d 45 14             	lea    0x14(%ebp),%eax
  10320d:	50                   	push   %eax
  10320e:	e8 39 fd ff ff       	call   102f4c <getint>
  103213:	83 c4 10             	add    $0x10,%esp
  103216:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103219:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10321c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10321f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103222:	85 d2                	test   %edx,%edx
  103224:	79 23                	jns    103249 <vprintfmt+0x292>
                putch('-', putdat);
  103226:	83 ec 08             	sub    $0x8,%esp
  103229:	ff 75 0c             	pushl  0xc(%ebp)
  10322c:	6a 2d                	push   $0x2d
  10322e:	8b 45 08             	mov    0x8(%ebp),%eax
  103231:	ff d0                	call   *%eax
  103233:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103236:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103239:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10323c:	f7 d8                	neg    %eax
  10323e:	83 d2 00             	adc    $0x0,%edx
  103241:	f7 da                	neg    %edx
  103243:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103246:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103249:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103250:	e9 9f 00 00 00       	jmp    1032f4 <vprintfmt+0x33d>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103255:	83 ec 08             	sub    $0x8,%esp
  103258:	ff 75 e0             	pushl  -0x20(%ebp)
  10325b:	8d 45 14             	lea    0x14(%ebp),%eax
  10325e:	50                   	push   %eax
  10325f:	e8 99 fc ff ff       	call   102efd <getuint>
  103264:	83 c4 10             	add    $0x10,%esp
  103267:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10326a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  10326d:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103274:	eb 7e                	jmp    1032f4 <vprintfmt+0x33d>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103276:	83 ec 08             	sub    $0x8,%esp
  103279:	ff 75 e0             	pushl  -0x20(%ebp)
  10327c:	8d 45 14             	lea    0x14(%ebp),%eax
  10327f:	50                   	push   %eax
  103280:	e8 78 fc ff ff       	call   102efd <getuint>
  103285:	83 c4 10             	add    $0x10,%esp
  103288:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10328b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  10328e:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103295:	eb 5d                	jmp    1032f4 <vprintfmt+0x33d>

        // pointer
        case 'p':
            putch('0', putdat);
  103297:	83 ec 08             	sub    $0x8,%esp
  10329a:	ff 75 0c             	pushl  0xc(%ebp)
  10329d:	6a 30                	push   $0x30
  10329f:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a2:	ff d0                	call   *%eax
  1032a4:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1032a7:	83 ec 08             	sub    $0x8,%esp
  1032aa:	ff 75 0c             	pushl  0xc(%ebp)
  1032ad:	6a 78                	push   $0x78
  1032af:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b2:	ff d0                	call   *%eax
  1032b4:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1032b7:	8b 45 14             	mov    0x14(%ebp),%eax
  1032ba:	8d 50 04             	lea    0x4(%eax),%edx
  1032bd:	89 55 14             	mov    %edx,0x14(%ebp)
  1032c0:	8b 00                	mov    (%eax),%eax
  1032c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  1032cc:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1032d3:	eb 1f                	jmp    1032f4 <vprintfmt+0x33d>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1032d5:	83 ec 08             	sub    $0x8,%esp
  1032d8:	ff 75 e0             	pushl  -0x20(%ebp)
  1032db:	8d 45 14             	lea    0x14(%ebp),%eax
  1032de:	50                   	push   %eax
  1032df:	e8 19 fc ff ff       	call   102efd <getuint>
  1032e4:	83 c4 10             	add    $0x10,%esp
  1032e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032ea:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1032ed:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1032f4:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1032f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032fb:	83 ec 04             	sub    $0x4,%esp
  1032fe:	52                   	push   %edx
  1032ff:	ff 75 e8             	pushl  -0x18(%ebp)
  103302:	50                   	push   %eax
  103303:	ff 75 f4             	pushl  -0xc(%ebp)
  103306:	ff 75 f0             	pushl  -0x10(%ebp)
  103309:	ff 75 0c             	pushl  0xc(%ebp)
  10330c:	ff 75 08             	pushl  0x8(%ebp)
  10330f:	e8 f8 fa ff ff       	call   102e0c <printnum>
  103314:	83 c4 20             	add    $0x20,%esp
            break;
  103317:	eb 39                	jmp    103352 <vprintfmt+0x39b>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103319:	83 ec 08             	sub    $0x8,%esp
  10331c:	ff 75 0c             	pushl  0xc(%ebp)
  10331f:	53                   	push   %ebx
  103320:	8b 45 08             	mov    0x8(%ebp),%eax
  103323:	ff d0                	call   *%eax
  103325:	83 c4 10             	add    $0x10,%esp
            break;
  103328:	eb 28                	jmp    103352 <vprintfmt+0x39b>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10332a:	83 ec 08             	sub    $0x8,%esp
  10332d:	ff 75 0c             	pushl  0xc(%ebp)
  103330:	6a 25                	push   $0x25
  103332:	8b 45 08             	mov    0x8(%ebp),%eax
  103335:	ff d0                	call   *%eax
  103337:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  10333a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10333e:	eb 04                	jmp    103344 <vprintfmt+0x38d>
  103340:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103344:	8b 45 10             	mov    0x10(%ebp),%eax
  103347:	83 e8 01             	sub    $0x1,%eax
  10334a:	0f b6 00             	movzbl (%eax),%eax
  10334d:	3c 25                	cmp    $0x25,%al
  10334f:	75 ef                	jne    103340 <vprintfmt+0x389>
                /* do nothing */;
            break;
  103351:	90                   	nop
        }
    }
  103352:	e9 68 fc ff ff       	jmp    102fbf <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  103357:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  103358:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10335b:	5b                   	pop    %ebx
  10335c:	5e                   	pop    %esi
  10335d:	5d                   	pop    %ebp
  10335e:	c3                   	ret    

0010335f <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10335f:	55                   	push   %ebp
  103360:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103362:	8b 45 0c             	mov    0xc(%ebp),%eax
  103365:	8b 40 08             	mov    0x8(%eax),%eax
  103368:	8d 50 01             	lea    0x1(%eax),%edx
  10336b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10336e:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103371:	8b 45 0c             	mov    0xc(%ebp),%eax
  103374:	8b 10                	mov    (%eax),%edx
  103376:	8b 45 0c             	mov    0xc(%ebp),%eax
  103379:	8b 40 04             	mov    0x4(%eax),%eax
  10337c:	39 c2                	cmp    %eax,%edx
  10337e:	73 12                	jae    103392 <sprintputch+0x33>
        *b->buf ++ = ch;
  103380:	8b 45 0c             	mov    0xc(%ebp),%eax
  103383:	8b 00                	mov    (%eax),%eax
  103385:	8d 48 01             	lea    0x1(%eax),%ecx
  103388:	8b 55 0c             	mov    0xc(%ebp),%edx
  10338b:	89 0a                	mov    %ecx,(%edx)
  10338d:	8b 55 08             	mov    0x8(%ebp),%edx
  103390:	88 10                	mov    %dl,(%eax)
    }
}
  103392:	90                   	nop
  103393:	5d                   	pop    %ebp
  103394:	c3                   	ret    

00103395 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103395:	55                   	push   %ebp
  103396:	89 e5                	mov    %esp,%ebp
  103398:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10339b:	8d 45 14             	lea    0x14(%ebp),%eax
  10339e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1033a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033a4:	50                   	push   %eax
  1033a5:	ff 75 10             	pushl  0x10(%ebp)
  1033a8:	ff 75 0c             	pushl  0xc(%ebp)
  1033ab:	ff 75 08             	pushl  0x8(%ebp)
  1033ae:	e8 0b 00 00 00       	call   1033be <vsnprintf>
  1033b3:	83 c4 10             	add    $0x10,%esp
  1033b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1033b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1033bc:	c9                   	leave  
  1033bd:	c3                   	ret    

001033be <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1033be:	55                   	push   %ebp
  1033bf:	89 e5                	mov    %esp,%ebp
  1033c1:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1033c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1033ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033cd:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033d3:	01 d0                	add    %edx,%eax
  1033d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1033df:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1033e3:	74 0a                	je     1033ef <vsnprintf+0x31>
  1033e5:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1033e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033eb:	39 c2                	cmp    %eax,%edx
  1033ed:	76 07                	jbe    1033f6 <vsnprintf+0x38>
        return -E_INVAL;
  1033ef:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1033f4:	eb 20                	jmp    103416 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1033f6:	ff 75 14             	pushl  0x14(%ebp)
  1033f9:	ff 75 10             	pushl  0x10(%ebp)
  1033fc:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1033ff:	50                   	push   %eax
  103400:	68 5f 33 10 00       	push   $0x10335f
  103405:	e8 ad fb ff ff       	call   102fb7 <vprintfmt>
  10340a:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10340d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103410:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103413:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103416:	c9                   	leave  
  103417:	c3                   	ret    
