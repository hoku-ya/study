#!/bin/bash

# Hello Worldを表示
echo 'Hello World'

var1="shell"
echo $var1

# lsコマンドを実行
var2=`ls`
echo $var2

# cat echo.shを改行抜きで実行
var3=$(cat echo.sh)
echo $var3

# 環境変数を表示
echo $PWD
echo $HOME

exit 0

echo 'BB'
