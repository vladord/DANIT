#!/bin/bash

volume_size_max=$1
logfile=$2
timestamp=$(date)

if [ ! -e $logfile ]; then
        touch $logfile
fi
space_taken_inodes=$(df -hi / | grep '/' | awk '{print substr ($5, 1, length($5)-1)}')
space_taken=$(df -h / | grep '/' | awk '{print substr ($5, 1, length($5)-1)}')

if [ $space_taken -gt $volume_size_max ]; then
        if [[ $logfile == "" ]]; then
                echo "Percentage of space taken: $space_taken Date: $timestamp"
                else
                echo "Percentage of space taken: $space_taken Date: $timestamp" >> "$logfile"
        fi
fi

if [ $space_taken_inodes -gt $volume_size_max ]; then
        if [[ $logfile == "" ]]; then
                echo "Percentage of space taken by inodes: $space_taken_inodes Date: $timestamp"
        else
                echo "Percentage of space taken by inodes: $space_taken_inodes Date: $timestamp" >> "$logfile"
        fi
fi