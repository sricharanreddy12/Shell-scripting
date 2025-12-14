#! /bin/bash

for i in {1..100}

do
echo $i
if [ $i -eq 50 ]  # need values upto 50
then
    exit 1
fi    
done