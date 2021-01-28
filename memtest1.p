(*work for local variables*)
proc test();
var c0, c1: boolean;
type re0 = record f1: boolean; f2: char end;
var b : array 10 of boolean;
var a0: re0;
var d1, d2: integer;
var e0: char;
begin
    a0.f1 := true;
    a0.f2 := 'c';
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

(*
changed code
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc test();
	.text
_test:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #16
@     a0.f1 := true;
	mov r0, #1
	add r1, fp, #-4
	strb r0, [r1]
@     a0.f2 := 'c';
	mov r0, #99
	add r1, fp, #-4
	strb r0, [r1, #1]
@     b[3] := true;
	mov r0, #1
	add r1, fp, #-15
	mov r2, #3
	mov r3, #1
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1]
@     c0 := true;
	mov r6, #1
@     c1 := false;
	mov r0, #0
	strb r0, [fp, #-5]
@     d1 := 1;
	mov r4, #1
@     d2 := 3;
	mov r5, #3
@     e0 := 'c';   
	mov r0, #99
	strb r0, [fp, #-16]
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
unchanged code

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
@     a0.f2 := 'c';
	mov r0, #99
	add r1, fp, #-16
	strb r0, [r1, #1]
@     b[3] := true;
	mov r0, #1
	add r1, fp, #-10
	mov r2, #3
	mov r3, #1
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1]
@     c0 := true;
	mov r4, #1
@     c1 := false;
	mov r5, #0
@     d1 := 1;
	mov r6, #1
@     d2 := 3;
	mov r0, #3
	str r0, [fp, #-20]
@     e0 := 'c';   
	mov r0, #99
	strb r0, [fp, #-21]
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