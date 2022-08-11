define QUTEBROWSER
#!/usr/bin/env bash

test -n "$$DEBUG" && set -x
# ----------------------------------------------------------------------------
# Modo strict
set -euo pipefail
# ----------------------------------------------------------------------------

##############################################################################
##############################################################################
##############################################################################

# Run!
$${HOME}/developer/qutebrowser/.venv/bin/python3 -m qutebrowser "$$@"
# ----------------------------------------------------------------------------
#export PYENV_VERSION=system
#source $${HOME}/developer/qutebrowser/.venv/bin/activate
## DO STUFF
#LD_LIBRARY_PATH=$${HOME}/developer/openssl/lib qutebrowser
## Reset version
#unset PYENV_VERSION
# ----------------------------------------------------------------------------
exit 0
endef

export QUTEBROWSER
.gitignore: $(SRCS)
qutebrowser.sh:
	echo "$$QUTEBROWSER" >> $@
	chmod +x $@

update:
	python scripts/mkvenv.py --update

pyqt5:
	python -m pip install PyQt5

dict:
	python scripts/dictcli.py install pt-BR

install: build update dict qutebrowser.sh

build:
	python scripts/mkvenv.py

clean:
	rm -rf qutebrowser.sh

clean_all: clean
	rm -rf .venv
