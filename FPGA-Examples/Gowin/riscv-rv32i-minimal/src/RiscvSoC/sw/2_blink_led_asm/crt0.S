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
	addi t0,zero,-1
	slli t0,t0,12
	addi t0,t0,-1
	slli t0,t0,8
	addi t0,t0,0xfe
loopc:
	xori t0,t0,0x00000001
	sw t0,0(a0)
	jal ra, delay
    beq x0,x0,loopc
	
	

.section .text
.global delay
.type   delay, @function
delay:
	#li t2,1000000
	addi t2,zero,0x0f4
	slli t2,t2,12
	addi t2,t2,0x240
	ll:
	addi t2,t2,-1
	beq t2,zero,done
	beq x0,x0,ll
done:
	jal ra, loopc   # jump to ra
	

	