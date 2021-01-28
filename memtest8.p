(*test the alternative with two recs*)
type re0 = record f1: boolean; f2: integer end;

proc test();
var c1, c2, c3 : integer;
var a1, a2: re0;

begin
    a1.f1 := true;
    a1.f2 := 3;
    a2.f1 := true;
    a2.f2 :=1;
    c1 := 1;
    c2 := 2;
    c3 := 3;
    
end;
begin
    test();
end.

(*
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
@     a1.f1 := true;
	mov r0, #1
	strb r0, [fp, #-9]
@     a1.f2 := 3;
	mov r0, #3
	str r0, [fp, #-13]
@     a2.f1 := true;
	mov r0, #1
	strb r0, [fp, #-1]
@     a2.f2 :=1;
	mov r0, #1
	str r0, [fp, #-5]
@     c1 := 1;
	mov r6, #1
@     c2 := 2;
	mov r5, #2
@     c3 := 3;
	mov r4, #3
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@     test();
	bl _test
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

@ End


*)
