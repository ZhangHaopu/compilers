(*not follow memory alignment*)
proc test();
type re0 = record f1: boolean; f2: char end;
var b : array 10 of re0;
begin
    b[0].f1 := true;
    b[1].f1 := true;
    b[2].f1 := false;
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
	sub sp, sp, #24
@     b[0].f1 := true;
	mov r0, #1
	add r1, fp, #-20
	mov r2, #0
	mov r3, #2
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1, #1]
@     b[1].f1 := true;
	mov r0, #1
	add r1, fp, #-20
	mov r2, #1
	mov r3, #2
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1, #1]
@     b[2].f1 := false;
	mov r0, #0
	add r1, fp, #-20
	mov r2, #2
	mov r3, #2
	mul r2, r2, r3
	add r1, r1, r2
	strb r0, [r1, #1]
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