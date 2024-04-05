#!/bin/bash
WORD='MUNABHAI'
WORD_LENGTH=${#WORD}
LENGTH=$(expr $WORD_LENGTH - 1)
for ((i = 0; i <= $LENGTH; i++)); do
    echo ${WORD[@]:$i:1}
done
