#!/bin/bash
cat > c.sh << 'EOT'

#!/bin/bash

echo "please enter a number"

read n
count=0

while [ $count -lt $n ]; do 
	echo "string queso"
	let count=count+1
done
EOT
	chmod 700 c.sh
	bash c.sh
