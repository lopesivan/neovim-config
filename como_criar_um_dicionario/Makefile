DICTIONARY = exemplo

TAB    = $(DICTIONARY).tab

TARGET = $(DICTIONARY).dict.dz
OBJS   = $(DICTIONARY).dict.dz $(DICTIONARY).idx $(DICTIONARY).ifo $(DICTIONARY).idx.oft

# TOOLS
TABFILE = /usr/lib/stardict-tools/tabfile

all: $(TARGET)

$(TARGET):
	$(TABFILE) $(TAB)

clean:
	rm $(OBJS)

test:
	sdcv -2 ${PWD} -u "$(DICTIONARY)"

