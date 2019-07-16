BUILD_DIR 	= build
STATICLIB_DIR = static_lib
# Select F_CPU (default: 16000000)
F_CPU = 
# Select microntroller (default: atmega2560)
MICRO = 
# Select SDK Path (default: lib_atmega2560.a)
LIBNAME = 

#
ASM_SRCS  = $(shell find ./ -type f -regex ".*\.s")
ASM_OBJS  = $(ASM_SRCS:.s=.o)

#
CXX_SRCS := $(shell find ./ -type f -regex ".*\.cpp")
CXX_OBJS  = $(CXX_SRCS:.cpp=.o)
	#
C_SRCS := $(shell find ./ -type f -regex ".*\.c")
C_OBJS  = $(C_SRCS:.c=.o)

INCLUDE_DIR := -I /usr/lib/avr/include -I ../standardCpp \
	$(addprefix -I ,$(shell find ./ -name  '*.h' -exec dirname {} \;)) 
#
CXX_FLAGS = -std=c++14 -nostdlib  -Wmain -Wextra  -Wno-maybe-uninitialized -fdata-sections -ffunction-sections -funsigned-char -funsigned-bitfields -fshort-enums $(INCLUDE_DIR)
CC_FLAGS  = -std=gnu99 -nostdlib  -Wmain -Wextra  -Wno-maybe-uninitialized -fdata-sections -ffunction-sections -funsigned-char -funsigned-bitfields -fshort-enums  $(INCLUDE_DIR)
#
CXX = avr-g++ 
CC  = avr-gcc 
#
all: atmega2560

#
lib: $(CXX_OBJS)
	@echo "Creating library"
	@avr-ar rcs $(STATICLIB_DIR)/$(LIBNAME) $(BUILD_DIR)/*.o
	@echo "Removing $(BUILD_DIR)/*.o"
	#@rm -rf $(BUILD_DIR)
	
%.o: %.c
	@echo "Compiling file : $(notdir $<)"
	@$(CC) $(CC_FLAGS) -Os -DF_CPU=$(F_CPU) -mmcu=$(MICRO)  -c $<  -o $(BUILD_DIR)/$(notdir $@)

%.o: %.cpp
	@echo "Compiling file : $(notdir $<)"
	@$(CXX) $(CXX_FLAGS) -Os -DF_CPU=$(F_CPU) -mmcu=$(MICRO)  -c $<  -o $(BUILD_DIR)/$(notdir $@)

%.o: %.s
	@echo "Compiling file : $(notdir $<)"
	@$(CXX) $(CXX_FLAGS) -Os -DF_CPU=$(F_CPU) -mmcu=$(MICRO)  -c $<  -o $(BUILD_DIR)/$(notdir $@)


#
createdir: $(BUILD_DIR) $(STATICLIB_DIR)

$(BUILD_DIR):
	@mkdir -p $@
$(STATICLIB_DIR):
	@mkdir -p $@

# Remove all build files
clean:
	@rm -rf $(BUILD_DIR)
	@rm -rf $(STATICLIB_DIR)

# ATMEGA2560
# Compile for atmega2560
atmega2560: MPROG := m2560
#
atmega2560: MICRO := atmega2560
atmega2560: F_CPU := 16000000
atmega2560: LIBNAME := libysdk_$(MICRO).a
atmega2560: createdir $(ASM_OBJS) $(C_OBJS) $(CXX_OBJS) lib

# ATMEGA328P
# Compile for atmega2560
atmega328p: MPROG := m328P
#
atmega328p: MICRO := atmega328p
atmega328p: F_CPU := 16000000
atmega328p: LIBNAME := libysdk_$(MICRO).a
atmega328p: createdir $(ASM_OBJS) $(C_OBJS) $(CXX_OBJS) lib

# Show this help prompt.
help:
	@ echo
	@ echo '  Usage:'
	@ echo ''
	@ echo '    make <target> [flags...]'
	@ echo ''
	@ echo '  Targets:'
	@ echo ''
	@ awk '/^#/{ comment = substr($$0,3) } comment && /^[a-zA-Z][a-zA-Z0-9_-]+ ?:/{ print "   ", $$1, comment }' $(MAKEFILE_LIST) | column -t -s ':' | sort
	@ echo ''
	@ echo '  Flags:'
	@ echo ''
	@ awk '/^#/{ comment = substr($$0,3) } comment && /^[a-zA-Z][a-zA-Z0-9_-]+ ?\?=/{ print "   ", $$1, $$2, comment }' $(MAKEFILE_LIST) | column -t -s '?=' | sort
	@ echo ''
	@ echo ''
	@ echo ''
