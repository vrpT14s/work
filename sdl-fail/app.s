	.file	"app.c"
	.text
	.section	.rodata
.LC0:
	.string	"SDL initialization failed."
.LC1:
	.string	"Test Window"
.LC2:
	.string	"Window creation failed."
	.align 8
.LC3:
	.string	"Renderer could not be created!"
	.text
	.globl	init_sdl
	.type	init_sdl, @function
init_sdl:
.LFB4879:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$32, %edi
	call	SDL_Init@PLT
	testl	%eax, %eax
	jns	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	print_error
	movl	$1, %edi
	call	exit@PLT
.L2:
	movl	$4, %r9d
	movl	$480, %r8d
	movl	$640, %ecx
	movl	$536805376, %edx
	movl	$536805376, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	SDL_CreateWindow@PLT
	movq	-8(%rbp), %rdx
	movq	%rax, 48(%rdx)
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	print_error
	movl	$1, %edi
	call	exit@PLT
.L3:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movl	$2, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	SDL_CreateRenderer@PLT
	movq	-8(%rbp), %rdx
	movq	%rax, 56(%rdx)
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L5
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	print_error
	movl	$1, %edi
	call	exit@PLT
.L5:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4879:
	.size	init_sdl, .-init_sdl
	.globl	init_app
	.type	init_app, @function
init_app:
.LFB4880:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 72(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4880:
	.size	init_app, .-init_app
	.globl	close_sdl
	.type	close_sdl, @function
close_sdl:
.LFB4881:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, %rdi
	call	SDL_DestroyWindow@PLT
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	SDL_DestroyRenderer@PLT
	call	SDL_Quit@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4881:
	.size	close_sdl, .-close_sdl
	.section	.rodata
.LC4:
	.string	"Program done."
	.text
	.globl	run
	.type	run, @function
run:
.LFB4882:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	init_app
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	init_sdl
	movq	-72(%rbp), %rax
	movq	(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	*%rdx
	jmp	.L9
.L11:
	movq	-72(%rbp), %rax
	movq	24(%rax), %rcx
	leaq	-64(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*%rcx
.L10:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	SDL_PollEvent@PLT
	testl	%eax, %eax
	jne	.L11
	movq	-72(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	*%rdx
.L9:
	movq	-72(%rbp), %rax
	movzbl	72(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	.L10
	movq	-72(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	*%rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	close_sdl
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4882:
	.size	run, .-run
	.section	.rodata
.LC5:
	.string	"%s - Error: %s\n"
	.text
	.globl	print_error
	.type	print_error, @function
print_error:
.LFB4883:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	call	SDL_GetError@PLT
	movq	%rax, %rcx
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4883:
	.size	print_error, .-print_error
	.ident	"GCC: (GNU) 13.1.1 20230714"
	.section	.note.GNU-stack,"",@progbits
