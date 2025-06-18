#!/bin/bash

number_to_guess=$(shuf -i 1-100 -n 1)

for i in 1 2 3 4 5; do
        read -p "Please guess number: " guess
        if [ $guess -gt $number_to_guess ]; then
                echo "Too high"
        elif [ $number_to_guess -gt $guess ]; then
                echo "Too low"
        else
                echo "Congratulations! You guessed the right number."
                exit 0
        fi
done

echo "Sorry, you've run out of attempts. The correct number was $number_to_guess"


