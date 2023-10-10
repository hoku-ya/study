#!/bin/bash

if test -e $1; then
  echo 'Enter argument 1. "ok" or "ng" '
  exit
fi

if test $1 = 'ok'; then
  echo "argument is $1" > ok.txt 
elif test $1 = 'ng'; then
  echo "argument is $1" 2>&1 > ng.txt
else
  echo 'Enter only "ok"/"no" '
fi
