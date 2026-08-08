TOP=trafic_lights_tb

GHDL=ghdl
GHDL_ELAB_FLAGS=--std=08 --workdir=build --ieee=standard --work=work
GHDL_RUN_FLAGS=--max-stack-alloc=0 --vcd=simulation.vcd --ieee-asserts=disable --assert-level=error --stop-time=10ms 
WORK_DIR=build
ROOT = .
SRCS = $(wildcard $(ROOT)/*.vhd)


all: simulate	

build:
	mkdir -p $(WORK_DIR)
	@echo $(SRCS)

import: $(SRCS) build
	$(GHDL) -i $(GHDL_ELAB_FLAGS) $(SRCS)

elaborate: import
	$(GHDL) -m $(GHDL_ELAB_FLAGS) $(TOP) 

simulate: elaborate
	$(GHDL) -r $(GHDL_ELAB_FLAGS) $(TOP) $(GHDL_RUN_FLAGS)

wave: simulate
	gtkwave simulation.vcd &

clean:
	rm -rf $(WORK_DIR) simulation.vcd *.o