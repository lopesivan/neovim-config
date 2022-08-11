#!/usr/bin/env bash

[ $1 ] && {
    file=${1}.txt
} || {
  echo 1>&2 Sintaxe: $0 in out
  exit 1
}

ctags -R .

a=__file_1.txt
b=__file_2.txt

sed 's/\t.*$//' tags | sort | uniq | sed '/^.$/d; /^!/d' > $a
cp $a $b
sed '/^_/d' -i $a
sed '/^_/!{d}' -i $b

sort $a | uniq > _$a
sort $b | uniq > _$b

cat $a $b > $file
rm tags $a $b _$a _$b

exit 0
