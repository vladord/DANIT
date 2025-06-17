#!/bin/bash

read -p "Enter file to copy " file_to_copy
read -p "Enter target " file_to_paste
cp $file_to_copy $file_to_paste
