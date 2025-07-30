from random import randint
number_to_guess = randint(1, 100)
print(number_to_guess)
for i in range(5):

    print("Please guess number: ")
    input_number = int(input())
    if input_number > number_to_guess:
        print("Too high")
    elif input_number < number_to_guess:
        print("Too low")
    else:
        print("Congratulations! You guessed the right number.")
        break
else:
    print(f"Sorry, you've run out of attempts. The correct number was {number_to_guess}")
