#!/bin/sh

INSTALL_FOLDER="$NVIM_BEGINNER/share/nvim"
cd "$INSTALL_FOLDER" || exit
lua-language-server
# if exist path `lua-language-server' then remove.
_d=lua-language-server
test -d $_d && rm -rf $_d

git clone --depth=1 https://hub.fastgit.xyz/sumneko/lua-language-server

cd lua-language-server || exit
# if the cloning speed is too slow, edit .gitmodules and replace github.com
# with hub.fastgit.org, which should be faster than github.
git submodule update --init --recursive

# build on Linux
cd 3rd/luamake || exit
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild


