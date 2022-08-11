sudo apt install aspell-pt-br
aspell -l pt_BR dump master >/tmp/pt_br.words
vim
# now, inside vim
:mkspell ~/.vim/spell/pt /tmp/pt_br.words
