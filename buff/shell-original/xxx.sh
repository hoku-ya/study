#!/bin/bash

file_name=$1

if test -e $file_name; then
    echo $file_name 'is exist.'
else
    echo $file_name 'is not exist.'
    exit
fi


backup_dir='./backup-log'
backup_log_file=$backup_dir/.backup.log

if test ! -d $backup_dir; then
    mkdir $backup_dir
    touch $backup_log_file
fi


backup_file_name=${file_name%.*}.backup.${file_name##*.}
cp $file_name $backup_dir/$backup_file_name

if test 

ls -l $file_name >> $backup_log_file 
