.equ GPIO_BASE, 0x40000000

  .section .text.init
  .global _start
  .type   _start, @function
_start:

  # Initialize global pointer
.option push
.option norelax
loop:
	xor x1, x1, x1
	xor x2, x2, x2
	xor x3, x3, x3
	xor x4, x4, x4
	xor x5, x5, x5
	xor x6, x6, x6
	xor x7, x7, x7
	xor x8, x8, x8
	xor x9, x9, x9
	xor x10, x10, x10
	xor x11, x11, x11
	xor x12, x12, x12
	xor x13, x13, x13
	xor x14, x14, x14
	xor x15, x15, x15
	xor x16, x16, x16
	xor x17, x17, x17
	xor x18, x18, x18
	xor x19, x19, x19
	xor x20, x20, x20
	xor x21, x21, x21
	xor x22, x22, x22
	xor x23, x23, x23
	xor x24, x24, x24
	xor x25, x25, x25
	xor x26, x26, x26
	xor x27, x27, x27
	xor x28, x28, x28
	xor x29, x29, x29
	xor x30, x30, x30
	xor x31, x31, x31
	la		gp,__global_pointer$
.option pop

	# Clear the bss segment
	la      a0,__bss_start
	la      a1,__BSS_END__

clear_bss:
	bgeu	a0,a1,finish_bss
	sb		x0,0(a0)
	addi	a0,a0,1
	beq		x0,x0,clear_bss
finish_bss:

	la      a0,_sdata
	la      a1,_edata
	la      a2,_sidata
copy_data:
	bgeu	a0,a1,finish_data
	lbu		a3,0(a2)
	sb		a3,0(a0)
	addi	a0,a0,1
	addi	a2,a2,1
	beq		x0,x0,copy_data
finish_data:

	la sp, __stack_top
	#call    __libc_init_array       # Run global initialization functions

	call    main

	# abort execution here
	#ebreak			

	.size  _start, .-_start

.section .text
.global main
.type   main, @function
main:
	li a0,GPIO_BASE
	li t0,0x00000001
	xori t1,t0,0xffffffff
	sw t1,0(a0)
	call delay
left:
	slli t0,t0,1
	xori t1,t0,0xffffffff
	sw t1,0(a0)
	call delay
	li a1,0x20
	beq t0,a1,right
	beq x0, x0, left
	
right:
	srli t0,t0,1
	xori t1,t0,0xffffffff
	sw t1,0(a0)
	call delay
	li a1,0x01
	beq t0,a1,left
	beq x0, x0, right
	
.section .text
.global delay
.type   delay, @function
delay:
	li t2,1000000
	ll:
	addi t2,t2,-1
	bne t2,zero,ll
	jr ra   # jump to ra
	

