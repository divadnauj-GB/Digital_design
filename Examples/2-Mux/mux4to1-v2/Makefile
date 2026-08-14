ICARUS=iverilog
RUN=vvp
WAVE=gtkwave

SRC = $(wildcard *.v)
SRC += ../mux2to1-v1/mux2to1.v

all: test 

test:
	$(ICARUS) -o mux.vvp $(SRC)
	$(RUN) mux.vvp
	$(WAVE) mux.vcd


.PHONY:
clean:
	rm -f *.vcd test* *.out *.vvp