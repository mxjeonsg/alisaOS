	.file	"bootloader.cxx"
	.text
	.section	.rodata
	.align 8
	.type	_ZN4KStd8ConstantL4ROWSE, @object
	.size	_ZN4KStd8ConstantL4ROWSE, 8
_ZN4KStd8ConstantL4ROWSE:
	.quad	25
	.align 8
	.type	_ZN4KStd8ConstantL7COLUMMSE, @object
	.size	_ZN4KStd8ConstantL7COLUMMSE, 8
_ZN4KStd8ConstantL7COLUMMSE:
	.quad	80
	.globl	video_buffer
	.data
	.align 8
	.type	video_buffer, @object
	.size	video_buffer, 8
video_buffer:
	.quad	753664
	.globl	vbuff
	.align 8
	.type	vbuff, @object
	.size	vbuff, 8
vbuff:
	.quad	753664
	.globl	column
	.section	.bss
	.align 8
	.type	column, @object
	.size	column, 8
column:
	.zero	8
	.globl	row
	.align 8
	.type	row, @object
	.size	row, 8
row:
	.zero	8
	.globl	colour
	.data
	.type	colour, @object
	.size	colour, 1
colour:
	.byte	-16
	.text
	.globl	StringLength
	.type	StringLength, @function
StringLength:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	$0, -8(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L4
.L6:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L5
	movq	-8(%rbp), %rax
	jmp	.L3
.L5:
	addq	$1, -8(%rbp)
.L4:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L6
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L6
	movq	-8(%rbp), %rax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	StringLength, .-StringLength
	.globl	IntegerToCStr
	.type	IntegerToCStr, @function
IntegerToCStr:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movq	$0, -39(%rbp)
	movl	$0, -32(%rbp)
	movq	$11, -24(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.L8
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	cltq
	movb	$48, -39(%rbp,%rax)
	movl	-4(%rbp), %eax
	cltq
	movb	$0, -39(%rbp,%rax)
	movl	$0, %eax
	jmp	.L16
.L8:
	cmpl	$0, -52(%rbp)
	jns	.L11
	cmpl	$10, -56(%rbp)
	jne	.L11
	movl	$1, -8(%rbp)
	negl	-12(%rbp)
	jmp	.L11
.L14:
	movl	-52(%rbp), %eax
	cltd
	idivl	-56(%rbp)
	movl	%edx, -28(%rbp)
	cmpl	$9, -28(%rbp)
	jle	.L12
	movl	-28(%rbp), %eax
	addl	$87, %eax
	movl	%eax, %ecx
	jmp	.L13
.L12:
	movl	-28(%rbp), %eax
	addl	$48, %eax
	movl	%eax, %ecx
.L13:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	cltq
	movb	%cl, -39(%rbp,%rax)
	movl	-12(%rbp), %eax
	cltd
	idivl	-56(%rbp)
	movl	%eax, -12(%rbp)
.L11:
	cmpl	$0, -12(%rbp)
	jne	.L14
	cmpl	$0, -8(%rbp)
	je	.L15
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	cltq
	movb	$45, -39(%rbp,%rax)
.L15:
	movl	-4(%rbp), %eax
	cltq
	movb	$0, -39(%rbp,%rax)
	leaq	-39(%rbp), %rax
	movl	$11, %esi
	movq	%rax, %rdi
	call	StringReverse
	movl	$0, %eax
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	IntegerToCStr, .-IntegerToCStr
	.globl	StringReverse
	.type	StringReverse, @function
StringReverse:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L24
	cmpq	$0, -32(%rbp)
	jne	.L20
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	StringLength
	jmp	.L21
.L20:
	movq	-32(%rbp), %rax
.L21:
	movq	%rax, -32(%rbp)
	movl	$0, -4(%rbp)
	movq	-32(%rbp), %rax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L22
.L23:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-9(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -4(%rbp)
	subl	$1, -8(%rbp)
.L22:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L23
	jmp	.L17
.L24:
	nop
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	StringReverse, .-StringReverse
	.local	_ZZ17StringDuplicateExE2sl
	.comm	_ZZ17StringDuplicateExE2sl,8,8
	.local	_ZGVZ17StringDuplicateExE2sl
	.comm	_ZGVZ17StringDuplicateExE2sl,8,8
	.section	.rodata
.LC0:
	.string	"<StringDuplicate: fail>"
	.text
	.globl	StringDuplicateEx
	.type	StringDuplicateEx, @function
StringDuplicateEx:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpq	$0, -56(%rbp)
	jne	.L26
	movl	$.LC0, %eax
	jmp	.L27
.L26:
	movl	$_ZGVZ17StringDuplicateExE2sl, %eax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L28
	cmpq	$0, -64(%rbp)
	jne	.L29
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	StringLength
	jmp	.L30
.L29:
	movq	-64(%rbp), %rax
.L30:
	movq	%rax, _ZZ17StringDuplicateExE2sl(%rip)
	movl	$_ZGVZ17StringDuplicateExE2sl, %eax
	movb	$1, (%rax)
.L28:
	movq	$0, -24(%rbp)
	movq	_ZZ17StringDuplicateExE2sl(%rip), %rcx
	movq	%rcx, %rax
	subq	$1, %rax
	movq	%rax, -32(%rbp)
	movl	$16, %eax
	subq	$1, %rax
	addq	%rcx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rcx, %rdx
	leaq	-1(%rdx), %rcx
	movb	$0, (%rax)
	leaq	1(%rax), %rdx
	leaq	-1(%rcx), %rax
	jmp	.L31
.L32:
	movb	$0, (%rdx)
	subq	$1, %rax
	addq	$1, %rdx
.L31:
	testq	%rax, %rax
	jns	.L32
	movq	$0, -24(%rbp)
	jmp	.L33
.L34:
	movq	-56(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movq	-40(%rbp), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movb	%al, (%rdx)
	addq	$1, -24(%rbp)
.L33:
	movq	_ZZ17StringDuplicateExE2sl(%rip), %rax
	cmpq	-24(%rbp), %rax
	jnb	.L34
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$0, %eax
.L27:
	movq	%rbx, %rsp
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	StringDuplicateEx, .-StringDuplicateEx
	.globl	_impl_printf
	.type	_impl_printf, @function
_impl_printf:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -216(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L41
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L41:
	movq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	StringLength
	movq	%rax, -192(%rbp)
	movq	-216(%rbp), %rax
	movq	%rax, -200(%rbp)
	movq	$0, -184(%rbp)
	jmp	.L38
.L40:
	movq	-216(%rbp), %rdx
	movq	-184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$39, %al
	je	.L39
	movq	-216(%rbp), %rdx
	movq	-184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	ScrPrintc
.L39:
	addq	$1, -184(%rbp)
.L38:
	movq	-216(%rbp), %rdx
	movq	-184(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L40
	movq	-184(%rbp), %rax
	cmpq	%rax, -192(%rbp)
	jnb	.L40
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_impl_printf, .-_impl_printf
	.align 2
	.globl	_ZN4KStd15MemoryAllocator8$zeroOutEv
	.type	_ZN4KStd15MemoryAllocator8$zeroOutEv, @function
_ZN4KStd15MemoryAllocator8$zeroOutEv:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	$512, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L43
.L44:
	movq	-24(%rbp), %rax
	leaq	28(%rax), %rdi
	movq	-8(%rbp), %rax
	movl	$0, %r8d
	movl	$512, %ecx
	movq	%rax, %rdx
	movl	$1048576, %esi
	call	MemSetFrom
	addq	$512, -8(%rbp)
.L43:
	cmpq	$1048576, -8(%rbp)
	jbe	.L44
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	_ZN4KStd15MemoryAllocator8$zeroOutEv, .-_ZN4KStd15MemoryAllocator8$zeroOutEv
	.align 2
	.globl	_ZN4KStd15MemoryAllocator15$askIfAvailableEy
	.type	_ZN4KStd15MemoryAllocator15$askIfAvailableEy, @function
_ZN4KStd15MemoryAllocator15$askIfAvailableEy:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	cmpq	$1048576, %rax
	ja	.L46
	movl	$1, %eax
	jmp	.L48
.L46:
	movl	$0, %eax
.L48:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	_ZN4KStd15MemoryAllocator15$askIfAvailableEy, .-_ZN4KStd15MemoryAllocator15$askIfAvailableEy
	.section	.rodata
	.align 8
.LC1:
	.string	"[.]MemoryAllocator: Allocated "
.LC2:
	.string	"."
	.text
	.align 2
	.globl	_ZN4KStd15MemoryAllocatorC2Ev
	.type	_ZN4KStd15MemoryAllocatorC2Ev, @function
_ZN4KStd15MemoryAllocatorC2Ev:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$32, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocator8$zeroOutEv
	movq	-8(%rbp), %rax
	movl	$1, 24(%rax)
	movl	$0, %esi
	movl	$.LC1, %edi
	call	ScrPrint
	movl	$10, %esi
	movl	$1048576, %edi
	call	IntegerToCStr
	movl	$0, %esi
	movq	%rax, %rdi
	call	ScrPrint
	movl	$0, %esi
	movl	$.LC2, %edi
	call	ScrPrintln
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	_ZN4KStd15MemoryAllocatorC2Ev, .-_ZN4KStd15MemoryAllocatorC2Ev
	.globl	_ZN4KStd15MemoryAllocatorC1Ev
	.set	_ZN4KStd15MemoryAllocatorC1Ev,_ZN4KStd15MemoryAllocatorC2Ev
	.align 2
	.globl	_ZN4KStd15MemoryAllocatorD2Ev
	.type	_ZN4KStd15MemoryAllocatorD2Ev, @function
_ZN4KStd15MemoryAllocatorD2Ev:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocator8$zeroOutEv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	_ZN4KStd15MemoryAllocatorD2Ev, .-_ZN4KStd15MemoryAllocatorD2Ev
	.globl	_ZN4KStd15MemoryAllocatorD1Ev
	.set	_ZN4KStd15MemoryAllocatorD1Ev,_ZN4KStd15MemoryAllocatorD2Ev
	.section	.rodata
	.align 8
.LC3:
	.string	"[!] MemoryAllocator: Out of memory."
	.text
	.align 2
	.globl	_ZN4KStd15MemoryAllocator11allocate_i8Ey
	.type	_ZN4KStd15MemoryAllocator11allocate_i8Ey, @function
_ZN4KStd15MemoryAllocator11allocate_i8Ey:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L52
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, 16(%rdx)
	leaq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	addq	$12, %rax
	jmp	.L53
.L52:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocator15$askIfAvailableEy
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L54
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, 16(%rdx)
	leaq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	addq	$12, %rax
	jmp	.L53
.L54:
	movl	$0, %esi
	movl	$.LC3, %edi
	call	ScrPrintln
	movl	$0, %eax
.L53:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	_ZN4KStd15MemoryAllocator11allocate_i8Ey, .-_ZN4KStd15MemoryAllocator11allocate_i8Ey
	.section	.rodata
.LC4:
	.string	"Dumping allocated memory: "
	.text
	.align 2
	.globl	_ZN4KStd15MemoryAllocator4dumpEv
	.type	_ZN4KStd15MemoryAllocator4dumpEv, @function
_ZN4KStd15MemoryAllocator4dumpEv:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, %esi
	movl	$.LC4, %edi
	call	ScrPrintln
	movq	$0, -8(%rbp)
	jmp	.L56
.L57:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	addq	$28, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	ScrPrintc
	addq	$1, -8(%rbp)
.L56:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	subq	$1, %rax
	cmpq	-8(%rbp), %rax
	jnb	.L57
	call	ScrNewline
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	_ZN4KStd15MemoryAllocator4dumpEv, .-_ZN4KStd15MemoryAllocator4dumpEv
	.globl	ConstructColour
	.type	ConstructColour, @function
ConstructColour:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -4(%rbp)
	movb	%al, -8(%rbp)
	movzbl	-4(%rbp), %eax
	orb	-8(%rbp), %al
	sall	$4, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	ConstructColour, .-ConstructColour
	.globl	ClearRow
	.type	ClearRow, @function
ClearRow:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movb	$32, -10(%rbp)
	movb	$15, -9(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L61
.L62:
	movq	vbuff(%rip), %rcx
	movq	-24(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	leaq	(%rcx,%rax), %rdx
	movzwl	-10(%rbp), %eax
	movw	%ax, (%rdx)
	addq	$1, -8(%rbp)
.L61:
	cmpq	$79, -8(%rbp)
	jbe	.L62
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	ClearRow, .-ClearRow
	.globl	ClearScr
	.type	ClearScr, @function
ClearScr:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	$0, -8(%rbp)
	jmp	.L64
.L65:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ClearRow
	addq	$1, -8(%rbp)
.L64:
	cmpq	$24, -8(%rbp)
	jbe	.L65
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	ClearScr, .-ClearScr
	.globl	ScrPrint
	.type	ScrPrint, @function
ScrPrint:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L67
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	StringLength
	jmp	.L68
.L67:
	movq	-32(%rbp), %rax
.L68:
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L69
.L76:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L77
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	je	.L72
	movq	column(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, column(%rip)
	cmpq	$80, %rax
	jbe	.L73
.L72:
	movl	$1, %eax
	jmp	.L74
.L73:
	movl	$0, %eax
.L74:
	testb	%al, %al
	je	.L75
	call	ScrNewline
.L75:
	movq	vbuff(%rip), %rcx
	movq	row(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	column(%rip), %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movq	-24(%rbp), %rcx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	movl	%edx, %ecx
	movzbl	colour(%rip), %edx
	movb	%cl, (%rax)
	movb	%dl, 1(%rax)
	addq	$1, -8(%rbp)
.L69:
	movq	-8(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jnb	.L76
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L76
	jmp	.L78
.L77:
	nop
.L78:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	ScrPrint, .-ScrPrint
	.globl	ScrPrintln
	.type	ScrPrintln, @function
ScrPrintln:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	ScrPrint
	call	ScrNewline
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	ScrPrintln, .-ScrPrintln
	.globl	ScrNewline
	.type	ScrNewline, @function
ScrNewline:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	$0, column(%rip)
	movq	row(%rip), %rax
	cmpq	$23, %rax
	ja	.L81
	movq	row(%rip), %rax
	addq	$1, %rax
	movq	%rax, row(%rip)
	jmp	.L80
.L81:
	movq	$1, -8(%rbp)
	jmp	.L83
.L86:
	movq	$0, -16(%rbp)
	jmp	.L84
.L85:
	movq	vbuff(%rip), %rcx
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	movw	%ax, -18(%rbp)
	movq	vbuff(%rip), %rcx
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	subq	$80, %rax
	addq	%rax, %rax
	leaq	(%rcx,%rax), %rdx
	movzwl	-18(%rbp), %eax
	movw	%ax, (%rdx)
	addq	$1, -16(%rbp)
.L84:
	cmpq	$79, -16(%rbp)
	jbe	.L85
	addq	$1, -8(%rbp)
.L83:
	cmpq	$24, -8(%rbp)
	jbe	.L86
	movl	$79, %edi
	call	ClearRow
.L80:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	ScrNewline, .-ScrNewline
	.globl	ScrSetColour
	.type	ScrSetColour, @function
ScrSetColour:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -20(%rbp)
	movb	%al, -24(%rbp)
	movzbl	colour(%rip), %eax
	movb	%al, -1(%rbp)
	movzbl	-24(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-20(%rbp), %eax
	addl	%edx, %eax
	movb	%al, colour(%rip)
	movzbl	-1(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	ScrSetColour, .-ScrSetColour
	.globl	ScrSetColourU8
	.type	ScrSetColourU8, @function
ScrSetColourU8:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	movzbl	colour(%rip), %eax
	movb	%al, -1(%rbp)
	movzbl	-20(%rbp), %eax
	movb	%al, colour(%rip)
	movzbl	-1(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	ScrSetColourU8, .-ScrSetColourU8
	.globl	halt
	.type	halt, @function
halt:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
/APP
# 98 "src/kernel/../include/std/std.cxx" 1
	cli
hlt
# 0 "" 2
/NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	halt, .-halt
	.globl	ScrPrintc
	.type	ScrPrintc, @function
ScrPrintc:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$10, -4(%rbp)
	je	.L93
	movq	column(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, column(%rip)
	cmpq	$80, %rax
	jbe	.L94
.L93:
	movl	$1, %eax
	jmp	.L95
.L94:
	movl	$0, %eax
.L95:
	testb	%al, %al
	je	.L96
	call	ScrNewline
.L96:
	movq	vbuff(%rip), %rcx
	movq	row(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	column(%rip), %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	colour(%rip), %edx
	movzbl	-4(%rbp), %ecx
	movb	%cl, (%rax)
	movb	%dl, 1(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	ScrPrintc, .-ScrPrintc
	.globl	MemSet
	.type	MemSet, @function
MemSet:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, %eax
	movb	%al, -44(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L98
	cmpq	$0, -32(%rbp)
	je	.L98
	cmpq	$0, -40(%rbp)
	je	.L98
	movq	-40(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jnb	.L99
.L98:
	movl	$0, %eax
	jmp	.L100
.L99:
	movq	$0, -8(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L101
.L102:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-44(%rbp), %eax
	movb	%al, (%rdx)
	addq	$1, -8(%rbp)
.L101:
	movq	-8(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jnb	.L102
	movq	-8(%rbp), %rax
.L100:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	MemSet, .-MemSet
	.globl	MemSetFrom
	.type	MemSetFrom, @function
MemSetFrom:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	%r8d, %eax
	movb	%al, -52(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L104
	cmpq	$0, -32(%rbp)
	je	.L104
	cmpq	$0, -40(%rbp)
	jne	.L105
.L104:
	movl	$0, %eax
	jmp	.L106
.L105:
	movq	-40(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L107
	movq	-48(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L107
	cmpq	$0, -48(%rbp)
	jne	.L108
.L107:
	movl	$0, %eax
	jmp	.L106
.L108:
	movq	$0, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L109
.L110:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-52(%rbp), %eax
	movb	%al, (%rdx)
	addq	$1, -8(%rbp)
.L109:
	movq	-8(%rbp), %rax
	cmpq	%rax, -48(%rbp)
	jnb	.L110
	movq	-8(%rbp), %rax
	subq	-40(%rbp), %rax
.L106:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	MemSetFrom, .-MemSetFrom
	.section	.rodata
	.align 8
.LC5:
	.string	"------------------------------"
.LC6:
	.string	"    AlisaOS Boot Manager"
.LC7:
	.string	"True"
.LC8:
	.string	"Putas y moet"
.LC9:
	.string	"Sexito"
	.text
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1048672, %rsp
	movb	$0, -1(%rbp)
	call	ClearScr
	movl	$30, %esi
	movl	$.LC5, %edi
	call	ScrPrintln
	movl	$0, %esi
	movl	$5, %edi
	call	ScrSetColour
	movb	%al, -1(%rbp)
	movl	$0, %esi
	movl	$.LC6, %edi
	call	ScrPrintln
	movzbl	-1(%rbp), %eax
	movl	%eax, %edi
	call	ScrSetColourU8
	movl	$30, %esi
	movl	$.LC5, %edi
	call	ScrPrintln
	call	ScrNewline
	call	ScrNewline
	call	ScrNewline
	leaq	-1048672(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocatorC1Ev
	leaq	-1048672(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocator11allocate_i8Ey
	movq	%rax, -16(%rbp)
	leaq	-1048672(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocator11allocate_i8Ey
	movq	%rax, -24(%rbp)
	leaq	-1048672(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocator11allocate_i8Ey
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movb	$34, (%rax)
	movq	-24(%rbp), %rax
	movb	$35, (%rax)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$69, %al
	jne	.L112
	movl	$0, %esi
	movl	$.LC7, %edi
	call	ScrPrintln
.L112:
	movq	$.LC8, -40(%rbp)
	movl	$.LC8, %edi
	call	StringLength
	movq	%rax, -48(%rbp)
	movl	$0, %edx
	movl	$0, %esi
	movl	$.LC9, %edi
	call	StringDuplicateEx
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	ScrPrintln
	leaq	-1048672(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocator4dumpEv
	leaq	-1048672(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN4KStd15MemoryAllocatorD1Ev
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	kernel_main, .-kernel_main
	.ident	"GCC: (GNU) 13.2.0"
