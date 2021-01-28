var i: integer;

begin
i:=1;
while i<100 do
  repeat 
  for i:= 1 to 10 do break end;
  break 2
  until i=0 end end.


(*after we allow optimisation
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

	.text
pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@ i:=1;
	mov r5, #1
	set r6, _i
	str r5, [r6]
@ while i<100 do
	cmp r5, #100
	bge .L1
@   for i:= 1 to 10 do break end;
	str r5, [r6]
	mov r4, #10
	cmp r5, r4
	bgt .L1
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _i, 4, 4
@ End
*)

(*before we allow optimisation

@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

	.text
pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@ i:=1;
	mov r0, #1
	set r1, _i
	str r0, [r1]
@ while i<100 do
.L2:
	set r0, _i
	ldr r0, [r0]
	cmp r0, #100
	blt .L3
	b .L4
.L3:
@   repeat 
.L5:
@   for i:= 1 to 10 do break end;
	mov r0, #1
	set r1, _i
	str r0, [r1]
	mov r4, #10
.L7:
	set r0, _i
	ldr r0, [r0]
	cmp r0, r4
	bgt .L8
	b .L8
	set r0, _i
	ldr r0, [r0]
	add r0, r0, #1
	set r1, _i
	str r0, [r1]
	b .L7
.L8:
@   break 2
	b .L4
	set r0, _i
	ldr r0, [r0]
	cmp r0, #0
	beq .L6
	b .L5
.L6:
	b .L2
.L4:
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _i, 4, 4
@ End

*)