.equ GPIO_BASE, 0x40000000

  .section .text.init
  .global _start
  .type   _start, @function
  .option push
.option norelax
_start:
	addi a0,zero,0x400
	slli a0,a0,20
main:
	lw t0,4(a0)
	sw t0,0(a0)
	beq x0, x0, main
	

