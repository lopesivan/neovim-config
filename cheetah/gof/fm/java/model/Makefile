TARGET_CLASS = Client

hamls    = \$(wildcard *.haml)
EXT      = .xml

.SUFFIXES:              # Delete the default suffixes
.SUFFIXES: .haml \$(EXT) # Define our suffix list

\# ---------------------------------------------------------------------------- 
\# ---------------------------------------------------------------------------- 
\# ---------------------------------------------------------------------------- 
HAML     = haml
HAMLFLAGS= -f xhtml --double-quote-attributes

\# ---------------------------------------------------------------------------- 
\# shell macro
\# ---------------------------------------------------------------------------- 

targets_haml=\
	for d in \$(hamls); \
	do \
		for e in .xml; do \
			echo \$\${d%.*}\$\$e; \
		done; \
	done

%.xml : %.haml
	\$(HAML) \$(HAMLFLAGS) \$< \$@

\# ---------------------------------------------------------------------------- 

prebuilding = \$(shell \$(targets_haml))

all   : dist

indent:
	@ant \$@

dist  : \$(prebuilding)
	@ant -Dmain=\$(TARGET_CLASS) \$@

run   :
	@ant -Dmain=\$(TARGET_CLASS) \$@

\# ---------------------------------------------------------------------------- 
\# ---------------------------------------------------------------------------- 
\# ---------------------------------------------------------------------------- 

clean :
	-ant clean
	-rm -rf \$(addprefix *, \$(EXT))
	@(find src/ -type f -name \*.orig -exec rm {} \; )

\# END OF FILE

