DEBUG =
.PHONY: all clean install uninstall

CFLAGS = -Wall -O2

CROSS:=
CC = $(CROSS)gcc
STRIP = $(CROSS)strip
INSTALL = install -D
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

SRCDIR = .
SRC := $(wildcard $(SRCDIR)/*.c)
ODIR := .
OBJ  := $(patsubst %.c,$(ODIR)/%.o,$(SRC))


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

install: txt2bmp ASC16 GB2312 gb2312.hzk
	$(INSTALL_PROGRAM) txt2bmp /usr/local/bin/txt2bmp
	$(INSTALL_DATA) ASC16 /usr/local/share/txt2bmp/ASC16
	$(INSTALL_DATA) GB2312 /usr/local/share/txt2bmp/GB2312
	$(INSTALL_DATA) gb2312.hzk /usr/local/share/txt2bmp/gb2312.hzk

uninstall:
	rm /usr/local/bin/txt2bmp
	rm /usr/local/share/txt2bmp/ASC16
	rm /usr/local/share/txt2bmp/GB2312
	rm /usr/local/share/txt2bmp/gb2312.hzk

clean:
	-rm -f *.o $(TARGET)

sinclude $(SRC:.c=.d)

%.d: %.c
	@set -e; rm -f $@; \
		$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
		sed 's,\(.*\)\.o[:]*,\1.o $@:,' < $@.$$$$ > $@; \
		rm -f $@.$$$$
