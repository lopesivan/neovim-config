program    := matrix
sources    := matrix.cpp
BOOST_PATH :=/usr/include/boost

RM         := /bin/rm -rf
CTAGS      := /usr/bin/ctags \
           -R                \
           --c++-kinds=+p    \
           --fields=+iaS     \
           --extra=+q

##############################################################################

CC       = g++
LD       = $(CC)

CFLAGS   = -c
LDFLAGS  = -o
GDBFLAGS = -g
WARNING  = -Wall

objects := $(sources:.cpp=.o)
targets := $(program)

# Compile
.cpp.o:
	$(CC) $(WARNING) $(GDBFLAGS) $(CFLAGS) -I $(BOOST_PATH) $<

all: $(targets)

tags:
	$(CTAGS) $(sources) *.hpp

$(program): $(objects)
	$(LD) $(LDFLAGS) $@ $^

clean:
	$(RM) $(program) $(target) $(objects) *.orig tags

# END OF FILE
