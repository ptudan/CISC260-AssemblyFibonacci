main:
	mov r2, #4
	cmp r2, #1
	bgt fib
	mov r1, r2
	b finish

finish:
	mov r0, #1
	SWI 0x6b
	SWI 0x11

fib:
	sub sp, sp, #8
	str lr, [sp,#0]
	str r2, [sp,#4]
	sub r2, r2, #1
	cmp r2, #0
	bgt zero
	cmp r2, #2
	bgt one
	blgt fib @add sp, sp, #16
	ldr r1, [sp,#8]

zero:
	