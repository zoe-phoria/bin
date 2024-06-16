#!/bin/bash
# read a text and turn it into an array of characters for c\c++
# support script for dl2416 driver

read -p "enter text: "
echo $REPLY | grep -o . > ./lines.txt

nchars=$(( $(wc -l lines.txt | awk '{print $1}') + 1 ))
printf "char [$nchars] = {" > array.txt
while IFS= read -r line; do
    if [[ $line = [a-zA-Z0-9[:space:]] ]]; then
        printf "'$line', " >> array.txt
    else
        printf "0x%X" "'$line" >> array.txt
        printf ", " >> array.txt
    fi
done < lines.txt
rm lines.txt
printf "' '};\n" >> array.txt
