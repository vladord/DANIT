#!/bin/bash
LOCATION=~/watch
flag=0
mkdir -p $LOCATION
FILES_ON_START=$(ls $LOCATION -p | grep -v '/$')

while [ $flag ]; do
        FILES=$(ls $LOCATION -p | grep -v '/$')
        for FILE in $FILES; do
            if [[ ${FILES_ON_START[*]} =~ $FILE ]]; then
                echo "File $FILE was already there"
            elif [[ $FILE == *.back* ]]; then
                echo "File $FILE already backupped"
            else
                mv $LOCATION/$FILE $LOCATION/$FILE.back
            fi

            done
        sleep 5
        #break
    done
