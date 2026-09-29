OUTPUT_ARCH( "riscv" )
ENTRY( _start )

STACK_SIZE = 1k; /* 32 kB stack size */

MEMORY
{
    brom (rx): ORIGIN = 0x00000000, LENGTH = 1K
    sram (rwx): ORIGIN = 0x00000000, LENGTH = 16M
}

SECTIONS
{

.text : {
        . = ALIGN(4);
        KEEP(*(.text.init)); 
        *(.text.trap_vec); 
        *(.text.reset); 
        *(.text);
        . = ALIGN(4);
        *(.text.*);
    } > brom
    
.rodata : {
        . = ALIGN(4);
        *(.rodata);
        *(.rodata*);
        *(.srodata);
        *(.srodata*);
        . = ALIGN(4);
        _sidata = .;
    } > brom

.data : AT ( _sidata ){
        . = ALIGN(4);
        __global_pointer$ = . + 0x800; /* GP is set to the middle of the 2K BSS area */
        _sdata = .;
        *(.data*);
        *(.data*)
        *(.sdata .sdata.*)
        . = ALIGN(4);
        _edata = .;
    } > sram /* "> sram" is the VMA, "> brom" is the LMA */

.bss (NOLOAD) : {
        . = ALIGN(4);
        __bss_start = .;
        *(.sbss .sbss.*)
        *(.bss .bss.*);
        *(COMMON)
        . = ALIGN(4);
        __BSS_END__ = .;
        _end = .; PROVIDE (end = .);
    } > sram

.stack (NOLOAD) : {
        . = ALIGN(4);
        . += STACK_SIZE;
        . = ALIGN(4);
        __stack_top = .;
    } > sram

}