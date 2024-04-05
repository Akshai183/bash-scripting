#!/bin/bash
WORD='MUNABHAI'
WORD_LENGTH=${#WORD}
LENGTH=$(expr $WORD_LENGTH - 1)
for ((i = $LENGTH; 1 <= 0; i--)); do
    echo ${WORD[@]:$i:1}
done
