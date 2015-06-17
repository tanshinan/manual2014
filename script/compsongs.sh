#!/bin/bash
source ./utils.sh

if [ -f .mydir1 ]; then
    rm .mydir1
fi
if [ -f .mydir2 ]; then
    rm .mydir2
fi


DIR=../songs/*.tex

# save and change IFS 
OLDIFS=$IFS
IFS=$'\n'
 
# read all file name into an array
FILES=($(find $DIR -type f))
 
# restore it 
IFS=$OLDIFS


e_header "SONG COMP"
echo "Number of songs: ${#FILES[@]}"

aLen=${#FILES[@]}

for (( i=0; i<${aLen}; i++ ));
do
	echo "${FILES[$i]} :"

	for (( j=$i+1; j<${aLen}; j++ ));
	do
		printf "."
		tr -cs '[:alnum:]' '\n' <${FILES[$i]} | tr 'A-Z ' 'a-z\n' | sort | awk '!/10pt|footnotesize|melodi|textit|vspace/' > .mydir1
		tr -cs '[:alnum:]' '\n' <${FILES[$j]} | tr 'A-Z ' 'a-z\n' | sort | awk '!/10pt|footnotesize|melodi|textit|vspace/' > .mydir2
		
		#Get the lenght of the two files
		ic=`wc -l .mydir1 | tr -cs '[:alnum:]' '\n' | sed -n 2p`	
		jc=`wc -l .mydir2 | tr -cs '[:alnum:]' '\n' | sed -n 2p`
		
		sum=$ic
		if [ $ic -gt $jc ]; then
			sum=$jc         		
		fi

		com=`comm -12 .mydir1 .mydir2 | grep -c ^`
		com=`expr $com '*' 100`
	
		proc=`expr $com / $sum`
	
		if [ $proc -gt 50 ]; then
			echo "${FILES[$i]} and ${FILES[$j]}"
			echo $proc
		fi
	
	done
	printf "\n"
done

