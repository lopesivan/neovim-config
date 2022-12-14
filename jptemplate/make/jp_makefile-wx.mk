main           = main.cpp
prerequisite   = $(wildcard *.cpp)

# ----------------------------------------------------------------------------

d              =\
/usr/include/wx-2.8 \
$$PWD

cscope_init    =\
	find $d -name '*.cpp' -o -name '*.h' > cscope.files;\
	cscope -b;\
	echo "CSCOPE_DB=$$PWD/cscope.out; export CSCOPE_DB"

ctags_init     =\
	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q \
	`find $d -name '*.cpp' -o -name '*.h'`

# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

program     = $(main:.cpp=)
sources     = $(prerequisite)
objects     = $(sources:.cpp=.o)

dependences = $(prerequisite:.cpp=.o)

##############################################################################
##############################################################################
##############################################################################

WX_LDFLAGS  = $(shell wx-config --libs)
WX_CXXFLAGS = $(shell wx-config --cxxflags)

CXX         = g++
LD          = $(CC)
WARNINGS    = -Wall
GDBFLAGS    = -g
LDLIBS      = $(WX_LDFLAGS)
INCLUDES    =
DEFINEFLAGS =

CPPFLAGS    = $(WX_CXXFLAGS)
CPPFLAGS   += $(WARNINGS) $(GDBFLAGS) $(INCLUDES) $(DEFINEFLAGS)

# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

all       : $(program)

$(program): $(dependences)

asssist   :
	@make CXX='gccrec g++-code-assist'

tags      :ctags cscope

ctags     :
	$(shell $(ctags_init) )

cscope    :
	$(shell $(cscope_init))

cproto    :
	$(shell $(cproto_cmd))

clean     :
	/bin/rm -rf $(program) $(objects)
	@/bin/rm -rf tags *.orig cscope.* *~
