#!/bin/bash

filename=1.sh

if [ -e ./$filename ]; then
	echo "File $filename exists"
else
	echo "File $filename doesn't exist"
fi

