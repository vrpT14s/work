	.file	"main.c"
	.text
	.globl	save_node_array
	.type	save_node_array, @function
save_node_array:
.LFB4879:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4879:
	.size	save_node_array, .-save_node_array
	.globl	make_new_link
	.type	make_new_link, @function
make_new_link:
.LFB4880:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4880:
	.size	make_new_link, .-make_new_link
	.globl	add_to_adj_list
	.type	add_to_adj_list, @function
add_to_adj_list:
.LFB4881:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	make_new_link
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4881:
	.size	add_to_adj_list, .-add_to_adj_list
	.globl	make_queue_link
	.type	make_queue_link, @function
make_queue_link:
.LFB4882:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4882:
	.size	make_queue_link, .-make_queue_link
	.section	.rodata
.LC0:
	.string	"graph.c"
.LC1:
	.string	"queue->back == NULL"
	.text
	.globl	enqueue
	.type	enqueue, @function
enqueue:
.LFB4883:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	make_queue_link
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L8
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L9
	leaq	__PRETTY_FUNCTION__.2(%rip), %rax
	movq	%rax, %rcx
	movl	$108, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L9:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L10
.L8:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
.L10:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4883:
	.size	enqueue, .-enqueue
	.globl	dequeue
	.type	dequeue, @function
dequeue:
.LFB4884:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L12
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L13
	leaq	__PRETTY_FUNCTION__.1(%rip), %rax
	movq	%rax, %rcx
	movl	$119, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L13:
	movl	$0, %eax
	jmp	.L14
.L12:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L15
	movq	-24(%rbp), %rax
	movq	$0, 8(%rax)
.L15:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4884:
	.size	dequeue, .-dequeue
	.globl	make_new_queue
	.type	make_new_queue, @function
make_new_queue:
.LFB4885:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4885:
	.size	make_new_queue, .-make_new_queue
	.section	.rodata
	.align 8
.LC2:
	.string	"(queue->front == NULL) == (queue->back == NULL)"
	.text
	.globl	is_queue_empty
	.type	is_queue_empty, @function
is_queue_empty:
.LFB4886:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	setne	%dl
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	sete	%al
	xorl	%edx, %eax
	testb	%al, %al
	jne	.L19
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$141, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L19:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	sete	%al
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4886:
	.size	is_queue_empty, .-is_queue_empty
	.section	.rodata
.LC3:
	.string	"[]"
.LC4:
	.string	"%d, "
.LC5:
	.string	"%d]\n"
	.text
	.globl	print_queue
	.type	print_queue, @function
print_queue:
.LFB4887:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L22
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L21
.L22:
	movl	$91, %edi
	call	putchar@PLT
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L24
.L25:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	28(%rax), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L24:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L25
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	28(%rax), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4887:
	.size	print_queue, .-print_queue
	.section	.rodata
.LC6:
	.string	"bfs search happened"
	.text
	.globl	bfs
	.type	bfs, @function
bfs:
.LFB4888:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	cmpq	$0, -56(%rbp)
	je	.L39
	movl	$0, -36(%rbp)
	jmp	.L29
.L30:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 36(%rax)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, 40(%rax)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	$-1, 48(%rax)
	addl	$1, -36(%rbp)
.L29:
	movl	-36(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L30
	movl	$0, %eax
	call	make_new_queue
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movl	$1, 36(%rax)
	movq	-56(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-56(%rbp), %rax
	movl	$0, 48(%rax)
	movq	-56(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	enqueue
.L37:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	print_queue
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	dequeue
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L40
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L33
.L36:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	36(%rax), %eax
	testl	%eax, %eax
	jne	.L41
	movq	-8(%rbp), %rax
	movl	$1, 36(%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-16(%rbp), %rax
	movl	48(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 48(%rax)
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	enqueue
	jmp	.L35
.L41:
	nop
.L35:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
.L33:
	cmpq	$0, -32(%rbp)
	jne	.L36
	jmp	.L37
.L40:
	nop
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L26
.L39:
	nop
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4888:
	.size	bfs, .-bfs
	.globl	no_of_nodes
	.bss
	.align 4
	.type	no_of_nodes, @object
	.size	no_of_nodes, 4
no_of_nodes:
	.zero	4
	.globl	nodes
	.align 32
	.type	nodes, @object
	.size	nodes, 5600
nodes:
	.zero	5600
	.globl	no_of_edges
	.align 4
	.type	no_of_edges, @object
	.size	no_of_edges, 4
no_of_edges:
	.zero	4
	.text
	.globl	context
	.type	context, @function
context:
.LFB4889:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4889:
	.size	context, .-context
	.section	.rodata
.LC7:
	.string	"Malloc fail?"
	.text
	.globl	startup
	.type	startup, @function
startup:
.LFB4890:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	context
	testq	%rax, %rax
	jne	.L45
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L45:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	$0, 32(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4890:
	.size	startup, .-startup
	.section	.rodata
.LC8:
	.string	"%d - EMPTY\n"
.LC9:
	.string	"%d - [%d"
.LC10:
	.string	", %d"
.LC11:
	.string	"]"
	.text
	.globl	print_adj_list
	.type	print_adj_list, @function
print_adj_list:
.LFB4891:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L47
	movq	-32(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L46
.L47:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	32(%rax), %edx
	movq	-32(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L49
.L50:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
.L49:
	cmpq	$0, -16(%rbp)
	jne	.L50
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L46:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4891:
	.size	print_adj_list, .-print_adj_list
	.globl	draw_arrowed_line
	.type	draw_arrowed_line, @function
draw_arrowed_line:
.LFB4892:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -120(%rbp)
	movl	%esi, -124(%rbp)
	movl	%edx, -128(%rbp)
	movl	%ecx, -132(%rbp)
	movl	%r8d, -136(%rbp)
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	movl	-136(%rbp), %edi
	movl	-132(%rbp), %ecx
	movl	-128(%rbp), %edx
	movl	-124(%rbp), %esi
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	SDL_RenderDrawLine@PLT
	movl	-124(%rbp), %eax
	subl	-132(%rbp), %eax
	movl	%eax, -108(%rbp)
	movl	-128(%rbp), %eax
	subl	-136(%rbp), %eax
	movl	%eax, -104(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2ssl	-104(%rbp), %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2ssl	-108(%rbp), %xmm2
	pxor	%xmm1, %xmm1
	mulss	%xmm0, %xmm1
	addss	%xmm2, %xmm1
	cvtss2sd	%xmm1, %xmm1
	movsd	%xmm1, -96(%rbp)
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movsd	-96(%rbp), %xmm1
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm0, -40(%rbp)
	movsd	-96(%rbp), %xmm4
	movsd	%xmm4, -160(%rbp)
	movq	-48(%rbp), %rax
	movsd	-40(%rbp), %xmm1
	movq	%rax, %xmm0
	call	cabs@PLT
	movsd	-160(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -96(%rbp)
	movsd	-88(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movsd	-96(%rbp), %xmm1
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm0, -40(%rbp)
	movsd	-96(%rbp), %xmm1
	movsd	.LC13(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	-88(%rbp), %xmm1
	movsd	.LC13(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movsd	-96(%rbp), %xmm1
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm0, -40(%rbp)
	movss	.LC14(%rip), %xmm0
	movss	%xmm0, -100(%rbp)
	movss	-100(%rbp), %xmm0
	movss	.LC15(%rip), %xmm1
	divss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, -144(%rbp)
	movss	%xmm0, -140(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %xmm0
	call	cexpf@PLT
	movq	%xmm0, %rax
	movl	%eax, %edx
	andb	$-1, %dh
	movd	%edx, %xmm1
	shrq	$32, %rax
	movd	%eax, %xmm0
	cvtss2sd	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movsd	-88(%rbp), %xmm0
	movq	-96(%rbp), %rax
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	__muldc3@PLT
	movq	%xmm0, %rax
	movapd	%xmm1, %xmm0
	movq	%rax, -32(%rbp)
	movsd	%xmm0, -24(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	movsd	-24(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movss	-100(%rbp), %xmm0
	movss	.LC15(%rip), %xmm1
	divss	%xmm1, %xmm0
	movss	.LC16(%rip), %xmm1
	movaps	%xmm1, %xmm2
	mulss	%xmm0, %xmm2
	movss	.LC17(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movaps	%xmm2, %xmm1
	movss	%xmm1, -152(%rbp)
	movss	%xmm0, -148(%rbp)
	movq	-152(%rbp), %rax
	movq	%rax, %xmm0
	call	cexpf@PLT
	movq	%xmm0, %rax
	movl	%eax, %edx
	andb	$-1, %dh
	movd	%edx, %xmm1
	shrq	$32, %rax
	movd	%eax, %xmm0
	cvtss2sd	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movsd	-88(%rbp), %xmm0
	movq	-96(%rbp), %rax
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	__muldc3@PLT
	movq	%xmm0, %rax
	movapd	%xmm1, %xmm0
	movq	%rax, -16(%rbp)
	movsd	%xmm0, -8(%rbp)
	movsd	-16(%rbp), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	-8(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-136(%rbp), %xmm1
	movsd	-72(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-132(%rbp), %xmm1
	movsd	-80(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %ecx
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	movl	-136(%rbp), %edx
	movl	-132(%rbp), %esi
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	SDL_RenderDrawLine@PLT
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-136(%rbp), %xmm1
	movsd	-56(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-132(%rbp), %xmm1
	movsd	-64(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %ecx
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	movl	-136(%rbp), %edx
	movl	-132(%rbp), %esi
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	SDL_RenderDrawLine@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4892:
	.size	draw_arrowed_line, .-draw_arrowed_line
	.globl	draw_edge
	.type	draw_edge, @function
draw_edge:
.LFB4893:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	12(%rax), %edi
	movq	-24(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-16(%rbp), %rax
	movl	12(%rax), %edx
	movq	-16(%rbp), %rax
	movl	8(%rax), %esi
	movq	-8(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	draw_arrowed_line
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4893:
	.size	draw_edge, .-draw_edge
	.globl	draw_adj_list
	.type	draw_adj_list, @function
draw_adj_list:
.LFB4894:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L54
.L55:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	draw_edge
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
.L54:
	cmpq	$0, -16(%rbp)
	jne	.L55
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4894:
	.size	draw_adj_list, .-draw_adj_list
	.globl	draw_path
	.type	draw_path, @function
draw_path:
.LFB4895:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	56(%rax), %rax
	movl	$255, %r8d
	movl	$47, %ecx
	movl	$240, %edx
	movl	$240, %esi
	movq	%rax, %rdi
	call	SDL_SetRenderDrawColor@PLT
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L57
.L59:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rcx
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	draw_edge
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -8(%rbp)
.L57:
	cmpq	$0, -8(%rbp)
	je	.L60
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L59
.L60:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4895:
	.size	draw_path, .-draw_path
	.globl	draw_nodes
	.type	draw_nodes, @function
draw_nodes:
.LFB4896:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	movl	$255, %r8d
	movl	$255, %ecx
	movl	$255, %edx
	movl	$255, %esi
	movq	%rax, %rdi
	call	SDL_SetRenderDrawColor@PLT
	movl	$0, -112(%rbp)
	jmp	.L62
.L63:
	movl	-112(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	nodes(%rip), %rax
	addq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	draw_adj_list
	addl	$1, -112(%rbp)
.L62:
	movl	no_of_nodes(%rip), %eax
	cmpl	%eax, -112(%rbp)
	jl	.L63
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	movl	$255, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$245, %esi
	movq	%rax, %rdi
	call	SDL_SetRenderDrawColor@PLT
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	16(%rax), %rax
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	je	.L64
	movq	-104(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	draw_adj_list
.L64:
	movl	$0, -108(%rbp)
	jmp	.L65
.L67:
	movl	-108(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	nodes(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	8(%rdx,%rax), %rbx
	movq	%rcx, -80(%rbp)
	movq	%rbx, -72(%rbp)
	movq	16(%rdx,%rax), %rcx
	movq	24(%rdx,%rax), %rbx
	movq	%rcx, -64(%rbp)
	movq	%rbx, -56(%rbp)
	movq	32(%rdx,%rax), %rcx
	movq	40(%rdx,%rax), %rbx
	movq	%rcx, -48(%rbp)
	movq	%rbx, -40(%rbp)
	movq	48(%rdx,%rax), %rax
	movq	%rax, -32(%rbp)
	movzbl	-54(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	-55(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-56(%rbp), %eax
	movzbl	%al, %esi
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	movl	$255, %r8d
	movq	%rax, %rdi
	call	SDL_SetRenderDrawColor@PLT
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	16(%rax), %rcx
	movl	-108(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	nodes(%rip), %rax
	addq	%rdx, %rax
	cmpq	%rax, %rcx
	jne	.L66
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	movl	$255, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$245, %esi
	movq	%rax, %rdi
	call	SDL_SetRenderDrawColor@PLT
.L66:
	movl	-72(%rbp), %edx
	movl	-64(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, -96(%rbp)
	movl	-68(%rbp), %edx
	movl	-60(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, -92(%rbp)
	movl	-64(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -88(%rbp)
	movl	-60(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -84(%rbp)
	movq	-120(%rbp), %rax
	movq	56(%rax), %rax
	leaq	-96(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SDL_RenderFillRect@PLT
	addl	$1, -108(%rbp)
.L65:
	movl	no_of_nodes(%rip), %eax
	cmpl	%eax, -108(%rbp)
	jl	.L67
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L68
	call	__stack_chk_fail@PLT
.L68:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4896:
	.size	draw_nodes, .-draw_nodes
	.globl	render
	.type	render, @function
render:
.LFB4897:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-40(%rbp), %rax
	movq	56(%rax), %rax
	movl	$255, %r8d
	movl	$63, %ecx
	movl	$63, %edx
	movl	$63, %esi
	movq	%rax, %rdi
	call	SDL_SetRenderDrawColor@PLT
	movq	-40(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	SDL_RenderClear@PLT
	movq	-40(%rbp), %rax
	movq	56(%rax), %rax
	movl	$255, %r8d
	movl	$32, %ecx
	movl	$255, %edx
	movl	$15, %esi
	movq	%rax, %rdi
	call	SDL_SetRenderDrawColor@PLT
	movl	$10, -32(%rbp)
	movl	$10, -28(%rbp)
	movl	$620, -24(%rbp)
	movl	$460, -20(%rbp)
	movq	-40(%rbp), %rax
	movq	56(%rax), %rax
	leaq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SDL_RenderDrawRect@PLT
	movq	-40(%rbp), %rax
	movq	56(%rax), %rax
	movl	$255, %r8d
	movl	$255, %ecx
	movl	$255, %edx
	movl	$255, %esi
	movq	%rax, %rdi
	call	SDL_SetRenderDrawColor@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	draw_nodes
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	32(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	draw_path
	movq	-40(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	SDL_RenderPresent@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L70
	call	__stack_chk_fail@PLT
.L70:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4897:
	.size	render, .-render
	.section	.rodata
.LC18:
	.string	"DISTANCES"
.LC19:
	.string	"%d - %d\n"
	.text
	.globl	print_distances
	.type	print_distances, @function
print_distances:
.LFB4898:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	jmp	.L72
.L73:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	48+nodes(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L72:
	movl	no_of_nodes(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L73
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4898:
	.size	print_distances, .-print_distances
	.globl	touches_node
	.type	touches_node, @function
touches_node:
.LFB4899:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	8(%rax), %edx
	movl	-4(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	addl	%eax, %eax
	cmpl	%eax, %edx
	jge	.L75
	movq	-16(%rbp), %rax
	movl	12(%rax), %edx
	movl	-8(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	movq	-16(%rbp), %rax
	movl	20(%rax), %eax
	addl	%eax, %eax
	cmpl	%eax, %edx
	jge	.L75
	movl	$1, %eax
	jmp	.L76
.L75:
	movl	$0, %eax
.L76:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4899:
	.size	touches_node, .-touches_node
	.globl	update_touched_node
	.type	update_touched_node, @function
update_touched_node:
.LFB4900:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L79
.L82:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	leaq	nodes(%rip), %rdx
	addq	%rax, %rdx
	movl	-32(%rbp), %ecx
	movl	-28(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	touches_node
	testb	%al, %al
	je	.L80
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	%rax, %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	leaq	nodes(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, 16(%rcx)
	jmp	.L78
.L80:
	addl	$1, -4(%rbp)
.L79:
	movl	no_of_nodes(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L82
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	$0, 16(%rax)
.L78:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4900:
	.size	update_touched_node, .-update_touched_node
	.section	.rodata
.LC20:
	.string	"ADJ LISTS:"
.LC21:
	.string	"test.txt"
.LC22:
	.string	"key pressed but don't care.\n"
	.text
	.globl	key_handling
	.type	key_handling, @function
key_handling:
.LFB4901:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	-60(%rbp), %eax
	subl	$98, %eax
	cmpl	$21, %eax
	ja	.L84
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L86(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L86(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L86:
	.long	.L92-.L86
	.long	.L84-.L86
	.long	.L91-.L86
	.long	.L90-.L86
	.long	.L84-.L86
	.long	.L90-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L89-.L86
	.long	.L88-.L86
	.long	.L84-.L86
	.long	.L87-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L84-.L86
	.long	.L85-.L86
	.text
.L88:
	movq	-56(%rbp), %rax
	movb	$1, 72(%rax)
	jmp	.L93
.L89:
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -36(%rbp)
	jmp	.L94
.L95:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	nodes(%rip), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	print_adj_list
	addl	$1, -36(%rbp)
.L94:
	movl	no_of_nodes(%rip), %eax
	cmpl	%eax, -36(%rbp)
	jl	.L95
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L93
.L91:
	movl	$0, no_of_nodes(%rip)
	jmp	.L93
.L92:
	movl	no_of_nodes(%rip), %eax
	movl	%eax, %edx
	leaq	nodes(%rip), %rax
	movq	%rax, %rsi
	leaq	nodes(%rip), %rax
	movq	%rax, %rdi
	call	bfs
	movl	$0, %eax
	call	print_distances
	jmp	.L93
.L87:
	leaq	-40(%rbp), %rdx
	leaq	-44(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SDL_GetMouseState@PLT
	movl	-40(%rbp), %edx
	movl	-44(%rbp), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	update_touched_node
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L99
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	-32(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movl	no_of_nodes(%rip), %ebx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	24(%rax), %rax
	movl	%ebx, %edx
	leaq	nodes(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	bfs
	jmp	.L93
.L90:
	leaq	-40(%rbp), %rdx
	leaq	-44(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SDL_GetMouseState@PLT
	movl	-40(%rbp), %edx
	movl	-44(%rbp), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	update_touched_node
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L100
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	-32(%rbp), %rdx
	movq	%rdx, 32(%rax)
	jmp	.L93
.L85:
	movl	no_of_edges(%rip), %edx
	movl	no_of_nodes(%rip), %eax
	leaq	.LC21(%rip), %rcx
	movl	%eax, %esi
	leaq	nodes(%rip), %rax
	movq	%rax, %rdi
	call	save_node_array
	jmp	.L93
.L84:
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	print_error@PLT
	jmp	.L93
.L99:
	nop
	jmp	.L93
.L100:
	nop
.L93:
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L98
	call	__stack_chk_fail@PLT
.L98:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4901:
	.size	key_handling, .-key_handling
	.globl	node_set_defaults
	.type	node_set_defaults, @function
node_set_defaults:
.LFB4902:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	16+nodes(%rip), %rax
	movl	$5, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	20+nodes(%rip), %rax
	movl	$5, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	24+nodes(%rip), %rax
	movb	$-1, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	25+nodes(%rip), %rax
	movb	$-1, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	26+nodes(%rip), %rax
	movb	$-1, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	nodes(%rip), %rax
	movq	$0, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	32+nodes(%rip), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4902:
	.size	node_set_defaults, .-node_set_defaults
	.section	.rodata
.LC23:
	.string	"Too many nodes!"
	.text
	.globl	event_handling
	.type	event_handling, @function
event_handling:
.LFB4903:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1025, %eax
	je	.L103
	cmpl	$1025, %eax
	ja	.L115
	cmpl	$1024, %eax
	je	.L105
	cmpl	$1024, %eax
	ja	.L115
	cmpl	$256, %eax
	je	.L106
	cmpl	$768, %eax
	je	.L107
	jmp	.L115
.L106:
	movq	-56(%rbp), %rax
	movb	$1, 72(%rax)
	jmp	.L104
.L107:
	movq	-56(%rbp), %rax
	movq	32(%rax), %rcx
	movq	-64(%rbp), %rax
	movl	20(%rax), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	*%rcx
	jmp	.L104
.L103:
	leaq	-36(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SDL_GetMouseState@PLT
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	update_touched_node
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	movzbl	16(%rax), %eax
	cmpb	$1, %al
	jne	.L109
	movl	no_of_nodes(%rip), %eax
	cmpl	$98, %eax
	jle	.L110
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	print_error@PLT
	jmp	.L104
.L110:
	movl	no_of_nodes(%rip), %eax
	movl	-40(%rbp), %ecx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	8+nodes(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	no_of_nodes(%rip), %eax
	movl	-36(%rbp), %ecx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	12+nodes(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	no_of_nodes(%rip), %eax
	movl	no_of_nodes(%rip), %ecx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	28+nodes(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	no_of_nodes(%rip), %eax
	movl	%eax, %edi
	call	node_set_defaults
	movl	no_of_nodes(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	leaq	nodes(%rip), %rdx
	addq	%rbx, %rdx
	movq	%rdx, 16(%rax)
	movl	no_of_nodes(%rip), %eax
	addl	$1, %eax
	movl	%eax, no_of_nodes(%rip)
	movl	no_of_nodes(%rip), %ebx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	24(%rax), %rax
	movl	%ebx, %edx
	leaq	nodes(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	bfs
	jmp	.L116
.L109:
	movq	-64(%rbp), %rax
	movzbl	16(%rax), %eax
	cmpb	$3, %al
	jne	.L116
	cmpq	$0, -32(%rbp)
	je	.L116
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L112
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	8(%rax), %rax
	cmpq	%rax, -32(%rbp)
	je	.L117
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	add_to_adj_list
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movb	$0, (%rax)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	$0, 8(%rax)
	movl	no_of_nodes(%rip), %ebx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	24(%rax), %rax
	movl	%ebx, %edx
	leaq	nodes(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	bfs
	movl	no_of_edges(%rip), %eax
	addl	$1, %eax
	movl	%eax, no_of_edges(%rip)
	jmp	.L116
.L112:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	context
	movb	$1, (%rax)
	jmp	.L116
.L105:
	leaq	-36(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SDL_GetMouseState@PLT
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	update_touched_node
	jmp	.L104
.L116:
	nop
	jmp	.L115
.L117:
	nop
.L104:
.L115:
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L114
	call	__stack_chk_fail@PLT
.L114:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4903:
	.size	event_handling, .-event_handling
	.globl	shutdown
	.type	shutdown, @function
shutdown:
.LFB4904:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4904:
	.size	shutdown, .-shutdown
	.globl	main
	.type	main, @function
main:
.LFB4905:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	startup(%rip), %rax
	movq	%rax, -96(%rbp)
	leaq	render(%rip), %rax
	movq	%rax, -88(%rbp)
	leaq	event_handling(%rip), %rax
	movq	%rax, -72(%rbp)
	leaq	key_handling(%rip), %rax
	movq	%rax, -64(%rbp)
	leaq	shutdown(%rip), %rax
	movq	%rax, -80(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	run@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L121
	call	__stack_chk_fail@PLT
.L121:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4905:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 8
__PRETTY_FUNCTION__.2:
	.string	"enqueue"
	.align 8
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 8
__PRETTY_FUNCTION__.1:
	.string	"dequeue"
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 15
__PRETTY_FUNCTION__.0:
	.string	"is_queue_empty"
	.align 8
.LC13:
	.long	0
	.long	1077149696
	.align 4
.LC14:
	.long	1078530000
	.align 4
.LC15:
	.long	1091567616
	.align 4
.LC16:
	.long	-2147483648
	.align 16
.LC17:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.ident	"GCC: (GNU) 13.1.1 20230714"
	.section	.note.GNU-stack,"",@progbits
