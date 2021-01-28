(*test to show why we keep the ones with greater r_align at first*)
proc tryRegisters();
var a0, b0, c0, d0: integer;
var a1, b1, c1: boolean;
begin
    a0 := 1;
    b0 := 2;
    a1 := true;
    c0 := 3;
    b1 := false;
    d0 := 1;
    c1 := false;
end;

begin
  tryRegisters();
end.

(**)

(*
our assembly code
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
@ end;
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   tryRegisters();
	mov r10, #0
	bl _tryRegisters
@ end.
.L2:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

@ End

*)

(*
the ones with smaller alignment first
@ proc tryRegisters();
	.text
_tryRegisters:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #16
@     a0 := 1;
	mov r0, #1
	str r0, [fp, #-4]
@     b0 := 2;
	mov r0, #2
	str r0, [fp, #-8]
@     a1 := true;
	mov r4, #1
@     c0 := 3;
	mov r0, #3
	str r0, [fp, #-12]
@     b1 := false;
	mov r5, #0
@     d0 := 1;
	mov r0, #1
	str r0, [fp, #-16]
@     c1 := false;
	mov r6, #0
@ end;
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   tryRegisters();
	mov r10, #0
	bl _tryRegisters
@ end.
.L2:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

@ End
*)
