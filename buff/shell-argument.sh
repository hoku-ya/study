#!/bin/bash

if test -e $1; then
    echo "Please input argument."
    read -p "環境変数名：" name
    read -p "環境変数の値：" value
    export $name=$value
else
    name=$1
    value=$2
fi

export $name=$value


#### 実行コマンド：
`source ./shell-argument.sh <環境変数名> <環境変数の値>`
もしくは
`source ./shell-argument.sh`としてreadで読み込み