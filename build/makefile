
#cross tool chain
CC=arm-none-eabi-
DEBUGGER=gdb

#machine (target)
MACH=cortex-m4

#libraries
LIBS=--specs=nano.specs

#c compiler flages
CFLAGS=-c -g -gdwarf-2 -mcpu=$(MACH)  -mthumb -mfloat-abi=soft -std=gnu11 -o0

#linker flags
LINKFLAGS=-mcpu=$(MACH) -mthumb -mfloat-abi=soft -T

#includes
INCS=-I ../inc/.

SRC_DIR=../src/

#projct_name
NAME=lap3

#capture all C files for file.elf dependencies
SRC=$(wildcard *.c $(SRC_DIR)*.c)
OBJ=$(SRC:.c=.o)
OBJ_BASE=$(notdir $(OBJ))


all: $(NAME).bin
	@echo "<<<<<<<<<<<   BUILD IS FINISHED   >>>>>>>>>>>>"

%.o: %.c
	$(CC)gcc $(CFLAGS) $(INCS) $< -o $@

%.o: $(SRC_DIR)%.c
	$(CC)gcc $(CFLAGS) $(INCS) $< -o $@

$(NAME).elf: $(OBJ_BASE)
	$(CC)gcc $(LIBS) $(LINKFLAGS) linker_script.ld $(OBJ_BASE) -o $@ -Wl,-Map=$(NAME).map
	cp $(NAME).elf $(NAME).axf

$(NAME).bin: $(NAME).elf
	$(CC)objcopy -O binary $< $@

debug: $(NAME).elf
	$(CC)$(DEBUGGER)

load: $(NAME).elf
	openocd -f board/stm32f4discovery.cfg

sections: $(NAME).elf
	$(CC)objdump -h $(NAME).elf

print:
	@echo $(OBJ_BASE)

clean_all: 
	rm *.o *.elf *.map *.bin *.axf

clean:
	rm *.elf *.bin