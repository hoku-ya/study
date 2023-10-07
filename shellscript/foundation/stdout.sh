#!/bin/bash

read -p "input var: " var
echo var = $var > stdout-sample.txt

read -p "input var1: " var1
echo var1 = $var1 >> stdout-sample.txt