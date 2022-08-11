LANGUAGE  = C
PROJECT   = adt
##############################################################################
# Dirs
MODEL     = ./model
VIEW      = ./view/$(LANGUAGE)/$(PROJECT)
SRCS      = $(shell find model/ -name \*.tmpl -printf '%f\n' )

templates = $(foreach s,$(SRCS),$(addprefix $(VIEW)/,$(s:.tmpl=.py)))
TARGETS   = $(templates)

all: $(TARGETS)

# tmpl -> py
$(VIEW)/%.py:  $(MODEL)/%.tmpl
	cheetah-compile --flat $^ --odir $(VIEW)

mklinks: rmlinks
	@(cd $(MODEL); pwd; echo $(@); ./$(@).sh)
rmlinks:
	@(cd $(MODEL); pwd; echo $(@); ./$(@).sh)
clean:
	find . -name "*.pyc" -delete
	find . -name "*.py.bak" -delete
	rm $(templates)
