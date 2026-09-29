.equ GPIO_BASE, 0x40000000

  .section .text.init
  .global _start
  .type   _start, @function
_start:

  # Initialize global pointer
.option push
.option norelax

main:
	addi a0,zero,0x400
	slli a0,a0,20
	addi t0,zero,0x00000001
	xori t1,t0,0xffffffff
	sw t1,0(a0)
	call delay1

left:
	li a1,0x20
	beq t0,a1,right
	xori t1,t0,0xffffffff
	sw t1,0(a0)
	slli t0,t0,1	
	jal ra, delay1

	
right:
	li a1,0x01
	beq t0,a1,left
	xori t1,t0,0xffffffff
	sw t1,0(a0)
	srli t0,t0,1
	jal ra, delay2
	
	


delay1:
	#li t2,1000000
	addi t2,zero,0x0f4
	slli t2,t2,12
	addi t2,t2,0x240
	ll1:
	addi t2,t2,-1
	beq t2,zero,done1
	beq x0,x0,ll1
done1:
	jal zero, left   # jump to ra
	


delay2:
	#li t2,1000000
	addi t2,zero,0x0f4
	slli t2,t2,12
	addi t2,t2,0x240
	ll2:
	addi t2,t2,-1
	beq t2,zero,done2
	beq x0,x0,ll2
done2:
	jal zero, right   

