BUILD_DIR 	= build
LIB_DIR	= lib
MICROCONTROLLER = atmega2560
CXX_FLAGS = -lstdc++ -lfcntl -std=c++14 

CXX_SRCS := $(shell find . -type f -regex ".*\.cpp") \
			
CXX_OBJS  = $(CXX_SRCS:.cpp=.o)

CXX       = avr-g++
CC        = avr-gcc


all: createdir $(CXX_OBJS)
	
clean:

%.o: %.cpp
	@echo "Compiling file : $(notdir $<)"
	@$(CXX) $(CXX_FLAGS) -I . -Os -mmcu=$(MICROCONTROLLER)  -c $<  -o $(BUILD_DIR)/$(notdir $@)


createdir: $(BUILD_DIR) 

$(BUILD_DIR):
	@mkdir -p $@
# Remove all build files
clean:
	@rm -rf $(BUILD_DIR) 