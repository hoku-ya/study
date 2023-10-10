#!/bin/bash

echo 'This text is written to a file.' > sample_out.txt

echo 'Add more text.' >> sample_out.txt

while read -p 'Enter text to be written to file. Or Enter "exit"u: ' value ;
do
    if [ $value = 'exit' ]; then
        exit
    fi
    echo $value >> sample_out.txt
    echo 'exitで処理を終了'
done



