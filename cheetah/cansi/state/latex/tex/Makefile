SRCS = $(shell ls *.tex )
EXT = ps dvi pdf bak log aux nav out snm toc brf idx

OUT = $(foreach s,$(SRCS), $(addprefix $(s:.tex=.), $(EXT)))

LATEX         = latex
DVIPS         = dvips
PS2PDF        = ps2pdf
PDFLATEX      = pdflatex
DOCVIEWER     = evince
CONVERTE      = convert
CONVERTEFLAGS = -density 90x90

PDF           = $(SRCS:.tex=.pdf)
PS            = $(SRCS:.tex=.ps)
DVI           = $(SRCS:.tex=.dvi)
PNG           = $(SRCS:.tex=.png)

TARGETS       =$(PDF)

all: $(TARGETS)

# tex -> pdf
%.pdf:  %.tex
	$(PDFLATEX) $(@:.pdf=)
	$(PDFLATEX) $(@:.pdf=)

# ----------------------------------------------------------------------------
show:
	for pdf in *.pdf; do \
		${DOCVIEWER} $$pdf; \
	done
# ----------------------------------------------------------------------------

clean:
	rm -rf $(TARGETS) $(OUT)

