(*record within a record*)
type re0 = record f1: boolean; f2: integer; f3:boolean end;
type re1 = record f1: boolean; f2: re0; f3: boolean end;
proc test();
var a1: re1;
var a0: re0;
begin
    a0.f1 := true;
    a0.f2 := 1;
    a0.f3 := true;
    a1.f1 := true;
    a1.f2 := a0;
    a1.f3 := true;
    
    
end;
begin
    test();
end.

(*after changed
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
	add r1, fp, #-20
	strb r0, [r1, #4]
@     a0.f2 := 1;
	mov r0, #1
	add r1, fp, #-20
	str r0, [r1]
@     a0.f3 := true;
	mov r0, #1
	add r1, fp, #-20
	strb r0, [r1, #5]
@     a1.f1 := true;
	mov r0, #1
	add r1, fp, #-12
	strb r0, [r1, #8]
@     a1.f2 := a0;
	mov r2, #8
	add r1, fp, #-20
	add r0, fp, #-12
	add r0, r0, #0
	bl memcpy
@     a1.f3 := true;
	mov r0, #1
	add r1, fp, #-12
	strb r0, [r1, #9]
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

(*before changed
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc test();
	.text
_test:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #32
@     a0.f1 := true;
	mov r0, #1
	add r1, fp, #-32
	strb r0, [r1]
@     a0.f2 := 1;
	mov r0, #1
	add r1, fp, #-32
	str r0, [r1, #4]
@     a0.f3 := true;
	mov r0, #1
	add r1, fp, #-32
	strb r0, [r1, #8]
@     a1.f1 := true;
	mov r0, #1
	add r1, fp, #-20
	strb r0, [r1]
@     a1.f2 := a0;
	mov r2, #12
	add r1, fp, #-32
	add r0, fp, #-20
	add r0, r0, #4
	bl memcpy
@     a1.f3 := true;
	mov r0, #1
	add r1, fp, #-20
	strb r0, [r1, #16]
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