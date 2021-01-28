(*work for local variables*)
proc test();
type re0 = record f1: boolean; f2: char; f3: boolean; f4:boolean end;
var a0: re0;
var c0: boolean;
var d1: integer;
var e0: char;
begin
    a0.f1 := true;
    a0.f2 := 'c';
    d1 := 1;
    c0 := true;
    e0 := 'c';   
end;
begin
    test();
end.

(*our code
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc test();
	.text
_test:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #8
@     a0.f1 := true;
	mov r0, #1
	add r1, fp, #-4
	strb r0, [r1]
@     a0.f2 := 'c';
	mov r0, #99
	add r1, fp, #-4
	strb r0, [r1, #1]
@     d1 := 1;
	mov r4, #1
@     c0 := true;
	mov r5, #1
@     e0 := 'c';   
	mov r6, #99
@ end;
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@     test();
	mov r10, #0
	bl _test
@ end.
.L2:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

@ End
*)

(*original code
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc test();
	.text
_test:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #8
@     a0.f1 := true;
	mov r0, #1
	add r1, fp, #-4
	strb r0, [r1]
@     a0.f2 := 'c';
	mov r0, #99
	add r1, fp, #-4
	strb r0, [r1, #1]
@     d1 := 1;
	mov r5, #1
@     c0 := true;
	mov r4, #1
@     e0 := 'c';   
	mov r6, #99
@ end;
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@     test();
	mov r10, #0
	bl _test
@ end.
.L2:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

@ End

*)