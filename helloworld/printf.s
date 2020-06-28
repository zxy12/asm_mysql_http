msg:
	.ascii	"hello world.\n"
	.text
	.globl	_start
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$msg, %rdi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	popq	%rbp
	ret

_start:
	call main
    movq $60, %rax     # 'exit' syscall number
    xor %rdi, %rdi      # set rdi to zero
    syscall
