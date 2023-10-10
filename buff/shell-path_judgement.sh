#!/bin/bash

if test $# -ne 1; then
  echo 'Enter one argument.'
  exit
fi



if test $(echo "$1" | cut -c 1) = "/"; then
  echo '絶対パス'
else
  echo '相対パス'
fi