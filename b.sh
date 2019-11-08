#!/bin/bash
#If the program is in command-line mode and there is an invalid argument, the program should print an error message and display the help message.

if [ ! -d "./todo" ]; then
	mkdir -p "todo"
	chmod 700 todo
fi

if [ ! -d "./completed" ]; then
	mkdir -p "completed"
	chmod 700 completed
fi

function list (){
	count="1"
	
	for i in ./todo/*.txt; do
	[ -f "$i" ]|| break
		echo $count
		cat $i
		let count=count+1	
		echo ""
	done
}

function listCompletedItems (){

		echo "Completed items:"
		
			for i in ./completed/*.txt; do
			cat $i		
			done
		echo "__________________________"
}
function addAnItem (){
		echo -n "please enter an item to add: "	
		todoNum=$(cd ./todo/ && ls|wc -l)
		let todoNum=todoNum+1

		let count=count+1
		read newItem
		touch ./todo/${todoNum}.txt 
		echo ${newItem} >> ./todo/${todoNum}.txt
		chmod 700 ./todo/${todoNum}.txt
		echo "enter description"
		read description
		
		echo "__________________" >> ./todo/${todoNum}.txt
		echo $description >> ./todo/${todoNum}.txt
}

function completeAnItem() {
	echo  "which item would you like to mark complete? "
	
	read completed
	count="1"
	for i in ./todo/*.txt; do
	[ -f "$i" ]|| break
	

	
	if [ "$completed" -eq "$count" ]
	then
	mv $i ./completed/

		let count=count+1


	fi	
	done
}	


valid="0"
counter="0"

while [ "$#" -gt "0" ]
do
  


if [[ "$1" == "list" && -z "$2" ]]; then
		 list 
		exit
elif [ "$1" == "help" ]; then
		
	echo "--HELP: list, complete [item], list completed, add [item]"
	exit
	
elif [[ "$1" == "list" && "$2" == "completed" || "$1" == "list completed" ]]; then 
		listCompletedItems
			exit
		
elif [[ "$1" == "add" &&  "$2" ]]; then

	
		todoNum=$(cd ./todo/ && ls|wc -l)
		let todoNum=todoNum+1
		
		let count=count+1
		#	echo "$filenumber"
		touch ./todo/${todoNum}.txt 
		echo $2 >> ./todo/${todoNum}.txt
		chmod 700 ./todo/${todoNum}.txt

	#	if  [ "$(tee)" ]; then

	#append="$(tee)"
	#echo "$append" >> ./todo/${todoNum}.txt	
							
	#fi
					exit

elif [ "$1" == "complete" ]; then

	for i in ./todo/*.txt; do
	
	if [[ "$2" == *"$(head -n 1 $i)"* ]]; then
	
	mv $i ./completed/
		fi
		exit
	done		
	
	


else 
	echo "invalid input"	
	echo "--HELP: list, complete [item], list completed, add [item]"
			exit	
	fi
done


echo  "Welcome to to-do list manager! "

#home
while [ $counter -lt 1 ]; do



#(cd ./todo/ && ls -v | cat -n | while read n f; do mv -n "$f" "$n.txt"; done) 
#(cd ./completed/ && ls -v | cat -n | while read n f; do mv -n "$f" "$n.txt"; done)

echo " to do: "
echo ""
count="1"
list

echo "A) Mark an item as completed"
echo "B) Add a new item"
echo "C) See completed items"
echo""
echo "Q) Quit"


	echo -n "Enter Choice: "
	read choice


if [ $choice ==  "A" ]; then
completeAnItem

elif [ $choice ==  "B" ]; then
addAnItem

elif [ $choice ==  "C" ]; then
listCompletedItems
		
		elif [ $choice ==  "Q" ]; then
			let counter=counter+1;
		else echo "please enter a valid command!"
	fi
done



