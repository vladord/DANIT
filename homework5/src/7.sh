#!/bin/bash

read -p "Please input filename: " filename
echo "Number of lines in file: "
echo $(wc -l $filename) | cut -d' ' -f1
