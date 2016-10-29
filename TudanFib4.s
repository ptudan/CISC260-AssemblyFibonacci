main:
	mov r2, #4
	cmp r2, #1
	blgt fib
	mov r1, r3
	mov r0, #1
	SWI 0x6b
	SWI 0x11


fib: sub sp, sp, #8 @moves stack pointer down
	str lr, [sp,#0] @saves link reg
	str r2, [sp,#4] @saves n
	sub r2, r2, #1 @n-1
	cmp r2, #1
	blgt fib @calls fib with n-1
	ldr r2, [sp,#4] @reloads n
	cmp r2, #1
	subgt r2, r2, #2 @ does n-2
	cmp r2, #1
	add r3, r3, r2 @adds to ret val
	blgt fib @calls fib with n-2
	ldr lr, [sp,#0]
	add sp, sp, #8 @moves stack back up
	mov pc, lr @moves pc to link reg