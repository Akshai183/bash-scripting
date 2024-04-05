#!/bin/bash
WORD='MUNABHAI'
WORD_LENGTH=${#WORD}
REVERSE=''
LENGTH=$(expr $WORD_LENGTH - 1)
for ((i = $LENGTH; i >= 0; i--)); do
    REVERSE=${REVERSE}${WORD[@]:$i:1}
done
echo $REVERSE
