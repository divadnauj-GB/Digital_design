CROSS_COMPILE=riscv32-unknown-elf-

CC=$(CROSS_COMPILE)gcc
OBJCOPY=$(CROSS_COMPILE)objcopy
NM=$(CROSS_COMPILE)nm
ARCH=-march=rv32i -mabi=ilp32
LINKERSCRIPT?=eldi_soc.ld
CFLAGS+=$(ARCH) -Wall -Wextra  -std=c11 -ffreestanding

CFLAGS+=-O3
CFLAGS+=-fno-pic --specs=nano.specs --specs=nosys.specs
CFLAGS+=$(ARCH)

LDFLAGS +=-T$(LINKERSCRIPT) 
LDFLAGS +=-nostdlib 
LDFLAGS +=-Wl,--no-relax,-Map=$@.map

LDLIBS = 

C_SRC = $(wildcard *.c)
ASM_SRC = $(wildcard *.S)
OBJS = $(patsubst %.c, %.o, $(C_SRC))
OBJS += $(patsubst %.S, %.o, $(ASM_SRC))

build: application.elf program.hex


%.o: %.S
	$(CC) $(CFLAGS) -c $^ -o $@ 
	
%.o: %.c 
	$(CC) $(CFLAGS)  -c $< -o $@ 

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

application.elf: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LDLIBS) -o $@ 
	$(CROSS_COMPILE)size -A -x $@

program.hex: application.bin
	echo "@000000" > program.hex
	hexdump -v -e '"" 32/1 "%02x " "\n"' $< >> program.hex



clean:
	rm -f *.o *.elf *.img *.bin *.nmon symbols.txt .tmp* *.txt *.hex *.log  *.map