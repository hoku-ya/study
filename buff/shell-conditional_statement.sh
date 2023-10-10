#!/bin/bash

var=$1
if test $var = blue;
then
    echo '進め'
elif [ $var = 'red' ];
then    echo '止まれ'
else
    echo '待て'
fi


# 数値型の比較

var2=$2
if [ $var2 -eq 10 ];
then
    echo 'input is 10'
fi

if [ $var2 -lt 20 ];
then
    echo '入力した値は20より小さい'
elif [ $var2 -ge 60 ];
then 
    echo '入力した値は60以上'
else
    echo '20以上60未満'
fi


#and 

# if [ $3 -gt 20 ] && [ $3 -le 60 ];
# if [ $3 -gt 20 -a $3 -le 60 ];
# if [[ $3 -gt 20 && $3 -le 60 ]];
if test $3 -gt 20 && test $3 -le 60;
then
    echo '第3引数が20より大きくて60以下です'
fi


#or

if [ $4 -lt 10 ] || [ $4 -gt 60 ];
# if [ $4 -lt 10 -o $4 -gt 60 ];
# if [[ $4 -lt 10 || $4 -gt 60 ]];
# if test $4 -lt 10 || test $4 -gt 60;
then
  echo '第4引数が10より小さいか60より大きい'
fi


# 否定

# if ! test $5 = "apple";
if [ ! $5 = 'apple' ]
then
  echo '第5引数はappleではない'
fi





# case文

var=$6
case $var in
'blue' )
  echo 'GO';;
'red' )
  echo 'STOP';;
'yello' )
  echo 'WAIT';;
*)
  echo 'Wrong Color';;
esac

var=$7
case $var in
  [a-z] )
    echo 'a-zまでの値です。';;
  [A-Z] )
    echo 'A-Zまでの値です。';;
  [0-9] )
    echo '数値です。';;
esac


# ファイル・ディレクトリ・引数など存在チェック

if [ -e $8 ];
then
  echo '$8ないよ'
fi