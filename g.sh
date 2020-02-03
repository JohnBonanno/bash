#!/bin/bash




next="y"
counter="0"

while [ $counter -lt 1 ]; do

echo -n "i. file type: "
	
read filetype
extension="${filetype#*.}"

for i in *.$extension; do
    [ -f "$i" ] || break ##create some output?

    fullf="$i"

  
if [ "$extension" == "c" ]; then
	echo "/* this is $i */"
	fi
	
    echo  "ii. preview of $fullf"
        line="$(head -n 1 $fullf) from $fullf"



    echo "$line"
    echo -n "iii. delete? y/n "

    read keep
   
   
    if [ "$keep" == "y" ]; then
    rm $fullf
#elif [ "$keep" == n];then
#keep="n" should i prompt user again if not n or y?
    fi
    
done

echo -n "iv. continue? "
read run;

# while [ "$run" == "n" || "$run" == "y" ]; do done

if [ "$run" == "n" ]; then
        let counter=counter+1
elif [ "$run" == "y" ] ;then
	echo " "

fi
done
