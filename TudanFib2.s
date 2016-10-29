fib:
	mov r1, #4 @this is input val
	cmp r1, #1 @checks against base case
	bgt fib_branch1
	mov r0, #1
	SWI 0x6b
	SWI 0x11

fib_branch1: sub sp, sp, #12 @moves stack pointer
	str lr, [sp,#0] @saves return address
	str r1, [sp,#4] @saves current iteration value of n
	sub r1, r1, #1 @sets n to n-1
	cmp r1, #1
	blgt fib_branch1

	ldr r1, [sp,#4] @reloads n
	str r1, [sp,#8] @saves return value for iteration of n
	sub r1, r1, #2 @sets n to n-2
	cmp r1, #1
	blgt fib_branch1

	ldr r2, [sp, #8] @loads n to r2
	add r3, r3, r2
	ldr lr, [sp, #0] @loads return address to lr
	add sp, sp, #12
	mov pc, lr