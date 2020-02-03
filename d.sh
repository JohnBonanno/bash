#!/bin/bash

if ! [ -z $1 ];then

	n=$1
	ps aux|grep $n

else

	echo "please enter a process that you'd like to monitor"
	read n
	ps aux|grep $n
fi
