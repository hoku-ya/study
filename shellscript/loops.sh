#!/bin/bash

#for文

# for var in 1 2 3 4 5
for i in `seq 1 2 10`;
do
    echo $i
    if [ $i -eq 3 ];
    then 
        break
    fi
done


for command in ls pwd date;
do
    echo $command
    $command
done


#while文

n=0

while (( $n < 10 ))
do 
    echo $n
    sleep 1
    n=$((n+1))
done


n=1

while (( $n < 10 ))
do 
    echo $n
    sleep 1
    if [ $n -eq 5 ];
    then
        break
    fi
    n=$((n+1))
done






read -p '文字列を入力してください：' var

while [ $var != 'exit' ];
do
    echo '入力した値は' $var1
    echo 'exitで処理を終了'
    read -p '文字列を入力してください：' var
done



