(*test this helps reduce the memory footprint of a record*)
proc test();
type re0 = record f1: boolean; f2: integer; f3: boolean; f4: integer end;
var a0: re0;
begin
    a0.f1 := true;
    a0.f2 := 1;
    a0.f3 := false;
    a0.f4 := 3;
    
end;
begin
    test();
end.

(*
after the change
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
	add r1, fp, #-12
	strb r0, [r1, #8]
@     a0.f2 := 1;
	mov r0, #1
	add r1, fp, #-12
	str r0, [r1]
@     a0.f3 := false;
	mov r0, #0
	add r1, fp, #-12
	strb r0, [r1, #9]
@     a0.f4 := 3;
	mov r0, #3
	add r1, fp, #-12
	str r0, [r1, #4]
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
before the change
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
	add r1, fp, #-16
	strb r0, [r1]
@     a0.f2 := 1;
	mov r0, #1
	add r1, fp, #-16
	str r0, [r1, #4]
@     a0.f3 := false;
	mov r0, #0
	add r1, fp, #-16
	strb r0, [r1, #8]
@     a0.f4 := 3;
	mov r0, #3
	add r1, fp, #-16
	str r0, [r1, #12]
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