CMP=iverilog
RUN=vvp
WAVE=gtkwave

all: test1 test2 test3

test1:
	$(CMP) -o test1 sillyfunction.v sillyfunction_tb1.v 
	$(RUN) test1

test2:
	$(CMP) -o test2 sillyfunction.v sillyfunction_tb2.v 
	$(RUN) test2

test3:
	$(CMP) -o test3 sillyfunction.v sillyfunction_tb3.v 
	$(RUN) test3

show_test1:
	$(WAVE) sillyfunction_tb1.vcd

show_test2:
	$(WAVE) sillyfunction_tb2.vcd

show_test3:
	$(WAVE) sillyfunction_tb3.vcd

.PHONY:
clean:
	rm *.vcd test*