MCU = msp430g2553
TARGET = test
 
#
# Directories
#
 
BASEDIR = $(PWD)
OBJDIR = $(PWD)
SRCDIR = $(PWD)
 
#
# Programs
#
 
CC = msp430-gcc
OBJCOPY = msp430-objcopy
MAKETXT = srec_cat
SIZE = msp430-size
TAGS = ctags
 
#
# Flags
#
 
CFLAGS =  -g -pipe -mmcu=$(MCU) -Os -std=c99 -Wall -Wno-main
CFLAGS += -DBASEDIR=\"$(BASEDIR)/\"
LDFLAGS = -Wl,-Map=$(TARGET).map
 
#
# Libraries
#
 
#LIBS = -lm
 
#
# Obj files
#
 
OBJS =  $(OBJDIR)/CC1100-CC2500.o \
	$(OBJDIR)/TI_CC_spi.o \
	$(OBJDIR)/main_acktest.o \
	$(OBJDIR)/uart.o \
	$(OBJDIR)/utils.o
 
#
# Rules
#
 
all: clean depend $(TARGET).elf $(TARGET).hex $(TARGET).txt
 
asm: $(TARGET).lst
 
tags: $(SRCDIR)/*.[ch]
	$(TAGS) $(SRCDIR)/*.[ch]
 
depend:
	$(CC) $(CFLAGS) -MM $(SRCDIR)/*.c > .depend
 
$(TARGET).elf: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(LIBS) $(OBJS) -o $@
	$(SIZE) $(TARGET).elf
 
%.hex: %.elf
	$(OBJCOPY) -O ihex $< $@
 
%.lst: $(SRCDIR)/*.c
	$(CC) -c $(CFLAGS) -Wa,-anlhd $< > $@
 
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@
 
%.txt: %.hex
	$(MAKETXT) -O $@ -TITXT $< -I
 
clean:
	-rm -f .depend $(TARGET).* $(OBJDIR)/*.o *.core tags
