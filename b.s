@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc tryRegisters();
	.text
_tryRegisters:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #8
@     a0 := 1;
	mov r4, #1
@     b0 := 2;
	mov r5, #2
@     a1 := true;
	mov r0, #1
	strb r0, [fp, #-5]
@     c0 := 3;
	mov r6, #3
@     b1 := false;
	mov r0, #0
	strb r0, [fp, #-6]
@     d0 := 1;
	mov r0, #1
	str r0, [fp, #-4]
@     c1 := false;
	mov r0, #0
	strb r0, [fp, #-7]
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   tryRegisters();
	bl _tryRegisters
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

@ End
