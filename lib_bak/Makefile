CXX_SRCS := $(shell find $(SRC_DIR)/ -type f -regex ".*\.cpp")
CXX_OBJS  = $(CXX_SRCS:.cpp=.o)
INCLUDE_DIR := 	$(addprefix -I ,$(shell find ./ -name  '*.h' -exec dirname {} \;))
CXX_FLAGS = -lstdc++ -std=c++14 $(INCLUDE_DIR)


all: $(CXX_OBJS)

	
%.o: %.cpp
	@echo "Compiling file : $(notdir $<)"
	@$(CXX) $(CXX_FLAGS) -nostdlib $(INCLUDE_DIR) -Os -mmcu=$(MICROCONTROLLER)  -c $<  -o $(BUILD_DIR)/$(notdir $@)