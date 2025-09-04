#---------------------------------------------------------------------------------
# 3DS Static Library Makefile (with Citro2D + libctru support)
# Outputs: libmygraphics.a
#---------------------------------------------------------------------------------

# Library name
LIBNAME := vcplib

# Directories
BUILD   := build
INCLUDE := include
SRC     := src

#---------------------------------------------------------------------------------
# Toolchain
#---------------------------------------------------------------------------------
include $(DEVKITARM)/3ds_rules

# Compiler flags
CFLAGS  := -g -Wall -O2 -mword-relocations
CFLAGS  += -ffunction-sections -fdata-sections
CFLAGS  += -DARM11 -D_3DS

CXXFLAGS := $(CFLAGS) -fno-rtti -fno-exceptions
ASFLAGS  := -g

# Include paths (critical: tell compiler where to find C2D/ctru headers)
INCLUDES := -I$(INCLUDE) -I$(SRC)
INCLUDES += -I$(PORTLIBS)/include
INCLUDES += -I$(CTRULIB)/include
INCLUDES += -I$(CITRO2D)/include

#---------------------------------------------------------------------------------
# Source files
#---------------------------------------------------------------------------------
CFILES  := $(foreach dir,$(SRC),$(notdir $(wildcard $(dir)/*.c)))
CPPFILES:= $(foreach dir,$(SRC),$(notdir $(wildcard $(dir)/*.cpp)))
SFILES  := $(foreach dir,$(SRC),$(notdir $(wildcard $(dir)/*.s)))

OBJS    := $(addprefix $(BUILD)/,$(CFILES:.c=.o) $(CPPFILES:.cpp=.o) $(SFILES:.s=.o))
DEPS    := $(OBJS:.o=.d)

# Output library
LIBOUT  := lib$(LIBNAME).a

#---------------------------------------------------------------------------------
# Build rules
#---------------------------------------------------------------------------------
.PHONY: all clean

all: $(LIBOUT)

$(BUILD):
	@mkdir -p $(BUILD)

# Compile C files
$(BUILD)/%.o: $(SRC)/%.c | $(BUILD)
	@echo "CC $<"
	@$(CC) $(CFLAGS) $(INCLUDES) -MMD -MP -MF $(@:.o=.d) -c $< -o $@

# Compile C++ files
$(BUILD)/%.o: $(SRC)/%.cpp | $(BUILD)
	@echo "CXX $<"
	@$(CXX) $(CXXFLAGS) $(INCLUDES) -MMD -MP -MF $(@:.o=.d) -c $< -o $@

# Assemble .s files
$(BUILD)/%.o: $(SRC)/%.s | $(BUILD)
	@echo "AS $<"
	@$(AS) $(ASFLAGS) -c $< -o $@

# Build static library
$(LIBOUT): $(OBJS)
	@echo "AR $@"
	@$(AR) rcs $@ $^

# Include dependencies
-include $(DEPS)

#---------------------------------------------------------------------------------
# Install to devkitPro (optional)
#---------------------------------------------------------------------------------
install:
	@cp $(LIBOUT) $(DEVKITPRO)/lib/
	@cp -r $(INCLUDE)/* $(DEVKITPRO)/include/
	@echo "Library installed."

#---------------------------------------------------------------------------------
# Cleanup
#---------------------------------------------------------------------------------
clean:
	@echo "Cleaning..."
	@rm -rf $(BUILD) $(LIBOUT)   