DEBUG =
.PHONY: all clean

CFLAGS = -Wall -O2

CROSS:=
CC = $(CROSS)gcc
STRIP = $(CROSS)strip

ifeq ($(DEBUG), 1)
	CFLAGS += -Wextra -DDEBUG=1
else
	CFLAGS += -DDEBUG=0
endif

TARGET = txt2bmp

all: $(TARGET)

strip_target: all
	$(STRIP) $(TARGET)

txt2bmp: txt2bmp.o encoding_detect.o dot_matrix_font_to_bmp.o \
	encoding_convert.o bmp_io.o 

clean:
	-rm -f *.o $(TARGET)
