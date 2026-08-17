ICARUS=iverilog
RUN=vvp
WAVE=gtkwave

SRC = $(wildcard *.v)

all: test 

test:
	$(ICARUS) -o sim.vvp $(SRC)
	$(RUN) sim.vvp -fst > log.log
	$(WAVE) sim.vcd


.PHONY:
clean:
	rm -f *.vcd test* *.out *.vvp *.log