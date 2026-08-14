ICARUS=iverilog
RUN=vvp
WAVE=gtkwave

all: test1 test2 test3

test1:
	$(ICARUS) -o test1 sillyfunction.v sillyfunction_tb1.v 
	$(RUN) test1

test2:
	$(ICARUS) -o test2 sillyfunction.v sillyfunction_tb2.v 
	$(RUN) test2

test3:
	$(ICARUS) -o test3 sillyfunction.v sillyfunction_tb3.v 
	$(RUN) test3

show_test1:
	$(WAVE) sillyfunction_tb1.vcd

show_test2:
	$(WAVE) sillyfunction_tb2.vcd

show_test3:
	$(WAVE) sillyfunction_tb3.vcd

.PHONY:
clean:
	rm -f *.vcd test* *.out