#!/bin/bash

newDir="./backup"   

if [ ! -d "./backup" ]; then

	mkdir -p "backup"
fi
numFiles=0
for i in *.sh; do
let numFiles=numFiles+1
done


#if for i in *sh $i is not null

#if [ "$numFiles" -gt "1" ]; then
cp  ./*.c ./"backup"
#else
#	echo "no such file"
#fi

