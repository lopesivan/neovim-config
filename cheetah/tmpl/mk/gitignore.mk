define GITIGNOREDS
*.o
depend
endef

SRCS = $(wildcard [a-z]*.c)
EXES = $(SRCS:.c=)

uso:
	@echo "USO:\nmake .gitignore"

export GITIGNOREDS
.gitignore: $(SRCS)
	echo $(EXES) | sed 's/ /\n/g' > $@
	echo "$$GITIGNOREDS" >> $@

