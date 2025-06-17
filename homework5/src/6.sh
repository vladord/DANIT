#!/bin/bash

read -p "Put your sentence: " sentence
arrwords=(${sentence})
for i in ${arrwords[@]}
	do 
		echo "${i}"
	done | tac
