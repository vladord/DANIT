#!/bin/bash

file=10.sh
if [ -f $file ]; then
  cat $file
	else
		echo "File "$file" doesn't exist"
fi

