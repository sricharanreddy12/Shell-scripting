#! /bin/bash

Number=$1

#-- -gt ---greater than
#-- -lt --lessthan
#-- -eq -- equals to
#-- -ne -- not equals to

if [$Number -gt 10]
then
   echo "given number $Number is greater than 10"
else
   echo " given number $Number is lessthan 10"
fi      