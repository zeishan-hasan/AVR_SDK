SRC_DIR 	= src
BUILD_DIR 	= build
FIRMW_DIR 	= firmware
LIBS_DIR	= libs

PROGRAMMER 		= stk500v2 
MPROG 			= m2560
MICROCONTROLLER = atmega2560


CXX       = avr-g++
CC        = avr-gcc

CXX_SRCS := $(shell find $(LIBS_DIR)/ -type f -regex ".*\.cpp") \
			$(shell find $(SRC_DIR)/ -type f -regex ".*\.cpp")
CXX_OBJS  = $(CXX_SRCS:.cpp=.o)

ASM_SRCS  = $(wildcard $(SRC_DIR)/*.s)
ASM_OBJS  = $(ASM_SRCS:.s=.o)

INCLUDE_DIR := -I include -I /usr/lib/avr/include -I libs \
	$(addprefix -I ,$(shell find $(LIBS_DIR)/ -name  *.h -exec dirname {} \;)) \
	$(addprefix -I ,$(shell find $(SRC_DIR)/ -name  *.h -exec dirname {} \;))


CXX_FLAGS = -lstdc++ -std=c++11 $(INCLUDE_DIR)  
LD_FLAGS  = -Wl,-u,vfscanf,-lscanf_flt,-u,vfprintf,-lprintf_flt


FLASH_PORT 		= /dev/ttyUSB0
COM_PORT 		= /dev/ttyUSB0
FLASH_BAUDRATE 	= 115200
COM_BAUDRATE 	= 1000000

#OTA SETUP
IP = 192.168.1.167
USERNAME = pi

all:createdir $(CXX_OBJS) $(ASM_OBJS) main.elf app



ota:
	scp $(FIRMW_DIR)/main.hex $(USERNAME)@$(IP):~/firmwareDownload/$(FIRMW_DIR)/
	ssh $(USERNAME)@$(IP) "cd ~/firmwareDownload && make upload"
	 

upload: createdir $(CXX_OBJS) main.elf app
	@killall hexdump putty 2>/dev/null || true
	@avrdude -q -V -p $(MPROG) -D -c $(PROGRAMMER) -b $(FLASH_BAUDRATE) -P $(FLASH_PORT) -U flash:w:$(FIRMW_DIR)/main.hex:i
	
app: main.elf
	@avr-objcopy -j .text -j .data -O ihex $(BUILD_DIR)/main.elf $(FIRMW_DIR)/main.hex
main.elf: $(CXX_OBJS)
	@$(CXX) -mmcu=$(MICROCONTROLLER) $(LD_FLAGS) -Wl,-Map,$(BUILD_DIR)/main.map -o $(BUILD_DIR)/main.elf build/*.o
%.o: %.cpp
	@echo "Compiling file : $(notdir $<)"
	@$(CXX) $(CXX_FLAGS) -Os -mmcu=$(MICROCONTROLLER)  -c $<  -o $(BUILD_DIR)/$(notdir $@)
%.o: %.s
	@echo "Compiling file : $(notdir $<)"
	@$(CC)  -Os -mmcu=$(MICROCONTROLLER)  -c $<  -o $(BUILD_DIR)/$(notdir $@)


createdir: $(BUILD_DIR) $(FIRMW_DIR) 

$(BUILD_DIR):
	@mkdir -p $@
$(FIRMW_DIR):
	@mkdir -p $@

monitor:
	@killall hexdump putty 2>/dev/null || true
	@putty -serial $(COM_PORT) -sercfg $(COM_BAUDRATE)&
	@sleep 0.2
#@./moveWindow 0
rawMonitor:
	@killall hexdump putty 2>/dev/null || true
	rawMonitorSerial $(COM_PORT) $(COM_BAUDRATE)

clean:
	@rm -rf $(BUILD_DIR) $(FIRMW_DIR)
