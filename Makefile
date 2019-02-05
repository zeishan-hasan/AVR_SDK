SRC_DIR = src
BUILD_DIR = build
FIRMW_DIR = firmware
USER_DIR = user
MICROCONTROLLER = atmega2560
CXX      = avr-g++
CXX_SRCS = $(wildcard $(SRC_DIR)/*.cpp)
CXX_OBJS = $(CXX_SRCS:.cpp=.o)
USB_PORT = /dev/ttyUSB0
all:createdir $(CXX_OBJS) main.elf app

upload: createdir $(CXX_OBJS) main.elf app
	killall putty&
	@avrdude -q -V -p m2560  -D -c stk500v2 -b 115200 -P $(USB_PORT) -U flash:w:$(FIRMW_DIR)/main.hex:i
	putty -serial $(USB_PORT) -sercfg 9600&
	sleep 0.2
	$(eval PUTTY_ID = $(shell xdotool search --onlyvisible --name Putty))
	xdotool windowsize $(PUTTY_ID) 350 1000
	xdotool windowmove $(PUTTY_ID) 1700 0

app: main.elf
	@avr-objcopy -j .text -j .data -O ihex $(BUILD_DIR)/main.elf $(FIRMW_DIR)/main.hex
main.elf: $(CXX_OBJS)
	@$(CXX) -mmcu=$(MICROCONTROLLER) -Wl,-u,vfscanf,-lscanf_flt,-u,vfprintf,-lprintf_flt -Wl,-Map,$(BUILD_DIR)/main.map -o $(BUILD_DIR)/main.elf build/*.o
%.o: %.cpp
	@echo "Compiling file : $(notdir $<)"
	@$(CXX) -lstdc++ -std=c++11  -I include -I /usr/lib/avr/include -Os -mmcu=$(MICROCONTROLLER)  -c $<  -o $(BUILD_DIR)/$(notdir $@)

createdir: $(OUTPUT_DIR) $(BUILD_DIR) $(FIRMW_DIR) 
$(OUTPUT_DIR):
	@mkdir -p $@
$(BUILD_DIR):
	@mkdir -p $@
$(FIRMW_DIR):
	@mkdir -p $@

clean:
	@rm -rf $(OUTPUT_DIR) $(BUILD_DIR) $(FIRMW_DIR)
