#!/bin/bash

echo "これは標準エラー出力です" 2>&1 > sample_error.txt

ech " ERROR" 2>> sample_error.txt