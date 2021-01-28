(*test the alternative*)
type re0 = record f1: boolean; f2: integer end;

proc test();
var b0, b1, b2: boolean;
var c1, c2, c3 : integer;
var a1, a2: re0;
var a3: array 3 of boolean;
var b: boolean;

begin
    a1.f1 := true;
    a1.f2 := 3;
    b0 := true;
    b1 := true;
    b2 := true;
    b := true;
    a2.f2 :=1;
    a3[3] := true;
    c1 := 1;
    c2 := 2;
    c3 := 3;
    
end;
begin
    test();
end.

(*alternative code
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
@     a1.f1 := true;
	mov r0, #1
	add r1, fp, #-13
	strb r0, [r1, #4]
@     a1.f2 := 3;
	mov r0, #3
	add r1, fp, #-13
	str r0, [r1]
@     b0 := true;
	mov r0, #1
	strb r0, [fp, #-17]
@     b1 := true;
	mov r0, #1
	strb r0, [fp, #-16]
@     b2 := true;
	mov r0, #1
	strb r0, [fp, #-15]
@     b := true;
	mov r0, #1
	strb r0, [fp, #-14]
@     a2.f2 :=1;
	mov r0, #1
	add r1, fp, #-5
	str r0, [r1]
@     a3[3] := true;
	mov r0, #1
	add r1, fp, #-8
	mov r2, #3
	mov r3, #1
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1]
@     c1 := 1;
	mov r6, #1
@     c2 := 2;
	mov r5, #2
@     c3 := 3;
	mov r4, #3
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

(*
with sorted
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
@     a1.f1 := true;
	mov r0, #1
	add r1, fp, #-8
	strb r0, [r1, #4]
@     a1.f2 := 3;
	mov r0, #3
	add r1, fp, #-8
	str r0, [r1]
@     b0 := true;
	mov r0, #1
	strb r0, [fp, #-17]
@     b1 := true;
	mov r0, #1
	strb r0, [fp, #-18]
@     b2 := true;
	mov r0, #1
	strb r0, [fp, #-19]
@     b := true;
	mov r0, #1
	strb r0, [fp, #-23]
@     a2.f2 :=1;
	mov r0, #1
	add r1, fp, #-16
	str r0, [r1]
@     a3[3] := true;
	mov r0, #1
	add r1, fp, #-22
	mov r2, #3
	mov r3, #1
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1]
@     c1 := 1;
	mov r4, #1
@     c2 := 2;
	mov r5, #2
@     c3 := 3;
	mov r6, #3
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