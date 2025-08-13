from random import randint
def numberguess(number_to_guess=None):
    if number_to_guess is None:
        number_to_guess = randint(1, 100)

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

if __name__ == '__main__':
    number_to_guess = randint(1, 100)
    print("Number to guess " + str(number_to_guess))
    numberguess(number_to_guess)
