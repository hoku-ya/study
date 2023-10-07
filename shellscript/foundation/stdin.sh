#!/bin/bash

read var
echo var = $var

read var1 var2 var3
echo var1 = $var1, var2 = $var2, var3 = $var3

read -p 'Input var: ' var
echo var = $var

read -sp 'password: ' password
echo password = $password

read -a names
echo names = ${names[@]}