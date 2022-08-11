#!/bin/sh

git clone --depth=1 https://hub.fastgit.xyz/sumneko/lua-language-server

cd lua-language-server
# if the cloning speed is too slow, edit .gitmodules and replace github.com
# with hub.fastgit.org, which should be faster than github.
git submodule update --init --recursive

# build on Linux
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild!/bin/sh


