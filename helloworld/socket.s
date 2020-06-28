	.file	"socket.c"
	.text
	.section	.rodata
.LC0:
	.string	"127.0.0.1"
.LC1:
	.string	"connect err%d,%s\n"
.LC2:
	.string	"GET /"
.LC3:
	.string	"send a str%s\n"
.LC4:
	.string	"\r\n"
.LC5:
	.string	"send %d char\n"
	.align 8
.LC6:
	.string	"(Message form server: %d, [%s],%d)\n"
	.text
	.globl	_start
	.type	main, @function

_start:

	call main
    	movq $60, %rax     # 'exit' syscall number
    	xor %rdi, %rdi      # set rdi to zero
    	syscall

main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$456, %rsp
	.cfi_offset 3, -24
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -20(%rbp)
	leaq	-64(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movw	$2, -64(%rbp)
	leaq	.LC0(%rip), %rdi
	call	inet_addr@PLT
	movl	%eax, -60(%rbp)
	movl	$80, %edi
	call	htons@PLT
	movw	%ax, -62(%rbp)
	leaq	-64(%rbp), %rcx
	movl	-20(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	movl	%eax, -24(%rbp)
	cmpl	$-1, -24(%rbp)
	jne	.L2
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	call	__errno_location@PLT
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	leaq	.LC2(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rsi
	movl	-20(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	movl	%eax, -36(%rbp)
	leaq	.LC4(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rsi
	movl	-20(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -36(%rbp)
.L5:
	leaq	-464(%rbp), %rsi
	movl	-20(%rbp), %eax
	movl	$0, %ecx
	movl	$399, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.L7
	movl	-36(%rbp), %eax
	cltq
	movb	$0, -464(%rbp,%rax)
	leaq	-464(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rcx
	leaq	-464(%rbp), %rdx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$0, -36(%rbp)
	jne	.L5
	jmp	.L4
.L7:
	nop
.L4:
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	addq	$456, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
