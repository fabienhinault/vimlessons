#!/bin/bash

lang=$1
if [ -z $lang ]
then
  lang=en
fi

TMPDIR=$(mktemp -d)
pushd "$lang"
ls *.txt
for f in $(ls *.txt)
do
  cp $f $TMPDIR/$f
  echo $(head -n 1 $TMPDIR/$f) 
  vim "$(head -n 1 $TMPDIR/$f)" $TMPDIR/$f
  echo "continuer ? (O/n)"
  read answer
  if [ "$answer" = "n" ]
  then
    exit 0
  fi
done

popd
