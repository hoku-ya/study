#!/bin/bash

fruit=('banana' 'apple' 'grape')

echo "${fruit[@]}" # 全表示
echo "${fruit[0]}"
echo "${!fruit[@]}" # インデックス表示
echo "${#fruit[@]}" # 要素数

fruit[3]='lemon'
echo "${fruit[@]}"
unset fruit[2] # インデックス2(3番目)を削除
echo "${fruit[@]}"
