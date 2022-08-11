#!/usr/bin/env bash

if test "$#" -eq 0; then
  echo USO: $0 \*.extensao
  exit
fi

[ -p tubo ] && rm tubo
mkfifo tubo
tmpfile=$(mktemp)
for f in "$@"; do
  echo =${f%.*}=

  cat $f| sed -e 's/#/\\&/g' -e 's/\$/\\&/g' > tubo &
  cat <<EOF  > tubo &
#encoding UTF-8
#compiler commentStartToken = '//'
// :Template ${f%.*} [data]
#compiler reset
EOF

  cat tubo > $tmpfile
  cp $tmpfile ${f%.*}.cheetah
  > $tmpfile
done

[ -p tubo ] && rm tubo
