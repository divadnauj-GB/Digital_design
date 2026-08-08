

TOP = trafic_lights_tb
SRC = trafic_lights.v
TEST_SRC= trafic_lights_tb.v 

BIN = $(TOP).vvp

$(BIN): $(SRC) $(TEST_SRC)
	iverilog -o $(BIN) -s $(TOP) $(SRC) $(TEST_SRC)

.PHONY: all clean test

all: $(BIN)

test: $(BIN)
	vvp $(BIN)

wave: $(TOP).vcd
	gtkwave $(TOP).vcd

clean:
	rm -f *.vvp *.vcd 