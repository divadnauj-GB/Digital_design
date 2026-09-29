.equ GPIO_BASE, 0x40000000

  .section .text.init
  .global _start
  .type   _start, @function
_start:
main:
	li a0,GPIO_BASE
	lw t0,4(a0)
	sw t0,0(a0)
	beq x0, x0, main
	

