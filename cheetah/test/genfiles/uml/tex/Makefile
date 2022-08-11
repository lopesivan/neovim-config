SRCS = $(shell ls *.mp )
EXT  = ps dvi pdf bak log aux nav out snm toc brf idx 1

OUT = $(foreach s,$(SRCS), $(addprefix $(s:.mp=.), $(EXT)))

PDF           = $(SRCS:.mp=.pdf)

TARGETS       = $(PDF)

all: $(TARGETS)

# mp -> pdf
%.pdf:  %.mp
	mptopdf  $^

clean:
	rm -rf $(TARGETS) $(OUT) *.pdf
