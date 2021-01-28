@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

	.text
pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@     for i:=0 to 10 do for j:=0 to 10 do a[i][j]:=i*j end end;
	mov r0, #0
	set r1, _i
	str r0, [r1]
	mov r5, #10
.L2:
	set r0, _i
	ldr r0, [r0]
	cmp r0, r5
	bgt .L3
	mov r0, #0
	set r1, _j
	str r0, [r1]
	mov r4, #10
.L4:
	set r0, _j
	ldr r0, [r0]
	cmp r0, r4
	bgt .L5
	set r0, _i
	ldr r0, [r0]
	set r1, _j
	ldr r1, [r1]
	mul r0, r0, r1
	set r1, _a
	set r2, _i
	ldr r2, [r2]
	mov r3, #40
	mul r2, r2, r3
	add r1, r1, r2
	set r2, _j
	ldr r2, [r2]
	mov r3, #4
	mul r2, r2, r3
	add r1, r1, r2
	str r0, [r1]
	set r0, _j
	ldr r0, [r0]
	add r0, r0, #1
	set r1, _j
	str r0, [r1]
	b .L4
.L5:
	set r0, _i
	ldr r0, [r0]
	add r0, r0, #1
	set r1, _i
	str r0, [r1]
	b .L2
.L3:
@     i := 0;
	mov r0, #0
	set r1, _i
	str r0, [r1]
@     while i< 10 do 
.L6:
	set r0, _i
	ldr r0, [r0]
	cmp r0, #10
	blt .L7
	b .L8
.L7:
@         j:=0;
	mov r0, #0
	set r1, _j
	str r0, [r1]
@         repeat
.L9:
@             if a[i][j]=63 then break  else j := j+1 end
	set r0, _a
	set r1, _i
	ldr r1, [r1]
	mov r2, #40
	mul r1, r1, r2
	add r0, r0, r1
	set r1, _j
	ldr r1, [r1]
	mov r2, #4
	mul r1, r1, r2
	add r0, r0, r1
	ldr r0, [r0]
	cmp r0, #63
	beq .L11
	b .L12
.L11:
	b .L10
	b .L13
.L12:
	set r0, _j
	ldr r0, [r0]
	add r0, r0, #1
	set r1, _j
	str r0, [r1]
.L13:
	set r0, _j
	ldr r0, [r0]
	cmp r0, #10
	beq .L10
	b .L9
.L10:
@         i := i+1
	set r0, _i
	ldr r0, [r0]
	add r0, r0, #1
	set r1, _i
	str r0, [r1]
	b .L6
.L8:
@     print_num(i); newline(); print_num(j); newline()
	set r0, _i
	ldr r0, [r0]
	bl print_num
	bl newline
	set r0, _j
	ldr r0, [r0]
	bl print_num
	bl newline
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _a, 400, 4
	.comm _i, 4, 4
	.comm _j, 4, 4
@ End
