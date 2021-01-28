(*by align but not by size*)
proc test();
var c0, c1: boolean;
type re0 = record f1: boolean end;
var b : array 10 of boolean;
var a0, a1: re0;
var d1, d2: integer;
var e0: char;
begin
    a0.f1 := true;
	a1.f1 := true;
    b[3] := true;
    c0 := true;
    c1 := false;
    d1 := 1;
    d2 := 3;
    e0 := 'c';   
end;
begin
    test();
end.

(*our code (by align)
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc test();
	.text
_test:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #24
@     a0.f1 := true;
	mov r0, #1
	add r1, fp, #-4
	strb r0, [r1]
@ 	a1.f1 := true;
	mov r0, #1
	add r1, fp, #-8
	strb r0, [r1]
@     b[3] := true;
	mov r0, #1
	add r1, fp, #-19
	mov r2, #3
	mov r3, #1
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1]
@     c0 := true;
	mov r6, #1
@     c1 := false;
	mov r0, #0
	strb r0, [fp, #-9]
@     d1 := 1;
	mov r4, #1
@     d2 := 3;
	mov r5, #3
@     e0 := 'c';   
	mov r0, #99
	strb r0, [fp, #-20]
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


(*by size
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc test();
	.text
_test:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #24
@     a0.f1 := true;
	mov r0, #1
	add r1, fp, #-16
	strb r0, [r1]
@ 	a1.f1 := true;
	mov r0, #1
	add r1, fp, #-20
	strb r0, [r1]
@     b[3] := true;
	mov r0, #1
	add r1, fp, #-10
	mov r2, #3
	mov r3, #1
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1]
@     c0 := true;
	mov r6, #1
@     c1 := false;
	mov r0, #0
	strb r0, [fp, #-21]
@     d1 := 1;
	mov r4, #1
@     d2 := 3;
	mov r5, #3
@     e0 := 'c';   
	mov r0, #99
	strb r0, [fp, #-22]
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