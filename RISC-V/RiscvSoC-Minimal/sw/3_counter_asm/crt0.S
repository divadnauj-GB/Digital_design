.equ GPIO_BASE, 0x40000000

  .section .text.init
  .global _start
  .type   _start, @function
_start:

  # Initialize global pointer
.option push
.option norelax

main:
counter:
	addi a0,zero,0x400
	slli a0,a0,20
	addi t0,zero, 0;
loopc:
	xori t1,t0,0xff
	sw t1,0(a0)
	addi t0,t0,1
	jal zero,delay

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
	jal zero, loopc   # jump to ra

