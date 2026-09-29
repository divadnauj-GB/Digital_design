#0 1 2 3 4 5 6
#a b c d e f g



.data
pattern: .word 0x03000000,0x06000000,0x04080000,0x000c0000,0x00060000,0x00020100,0x00000300,0x00000600,0x00000408,0x0000000c,0x00000044,0x00004040,0x00404000,0x40400000,0x60000000,0x21000000
delaycnt: .word 0x00004e20
loopcnt:  .word 0x00000010

.text
.section .text.init
 .global _start
 .type   _start, @function
_start:
.option push
.option norelax

main:
   addi a0,zero,0x400
   slli a0,a0,20   
   addi t5,x0,64    # initialize the length of the display pattern (in bytes)
   lw t3, 0(t5)    	# load delaycnt value

restart:   
   addi t4,x0,0 #start the pattern index in 0
   lw s1,4(t5) #load the loopcnt value
forward:
   beq t5,t4, restart
   addi a1,zero,0xfe #initialize the EN0
   slli a1,a1,8
   addi s0,zero,4 #initialize a register to index each display
   lw t0,0(t4) #read the data to send to all displays
   andi a2,t0,0xff #takes just the LSB byte
   xori a2,a2,0xff #
   or a2,a2,a1 #merges the ENx with the byte
   sw  a2, 0(a0) # send the value to the display
   addi s0,s0,-1

   lw t2, 0(t5)
   jal ra, delay

next_disp:
   beq s0,zero,next_step
   slli a1,a1,1
   addi a1,a1,0x100
   srli t0,t0,8
   andi a2,t0,0xff
   xori a2,a2,0xff
   or a2,a2,a1   
   sw  a2, 0(a0) # send the value to the display
   addi s0,s0,-1

   lw t2, 0(t5)
   jal ra, delay

next_step:
   beq s1,zero,continue
   addi s1,s1,-1
   jal ra,forward

continue:
	lw s1,4(t5)
    addi t4, t4, 4 # increment to the next address
	jal ra,forward

delay:
   beq t2,zero,next_disp	
   addi  t2, t2, -1     # increment counter
   j delay







	
	
