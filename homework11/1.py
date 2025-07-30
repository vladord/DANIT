"""
Description of the class structure
Alphabet Class, characterized by:
Language
List of letters

For the Alphabet, you can:
Print all the letters of the alphabet
Count the number of letters

English Alphabet Properties:
Language
List of letters
Number of letters

For the English Alphabet, you can:
Count the number of letters
Determine whether a letter belongs to the English alphabet
Get an example text in English.
Task
Alphabet Class

Create the Alphabet class
Create the __init__() method, inside of which two attributes will be defined: 1) lang - language and 2) letters - list of letters. The initial values of the properties are taken from the method's input parameters.
Create the print() method, which will print the alphabet letters to the console.
Create the letters_num() method, which will return the number of letters in the alphabet.
EngAlphabet Class
Create the EngAlphabet class by inheriting from the Alphabet class.
Create the __init__() method, inside of which the parent method __init__() will be called. The language designation (e.g., En) and a string consisting of all the letters of the alphabet will be passed to it as parameters.
Add a private static attribute _letters_num, which will store the number of letters in the alphabet.
Create the is_en_letter() method, which will take a letter as a parameter and determine whether this letter belongs to the English alphabet.
Redefine the letters_num() method - let it return the value of the _letters_num attribute in the current class.
Create a static method example(), which will return an example text in English."""

class Alphabet():
    def __init__(self, language, letters_list=[]):
        self.language = language
        self.letters_list = letters_list

    def print(self):
        for i in self.letters_list:
            print(i)

    def letters_num(self):
        return len(self.letters_list)


class EngAlphabet(Alphabet):
    def __init__(self):
        super().__init__(language = "EN", letters_list = ["a", "z"])
        self._letters_num=super().letters_num()

    def is_en_letter(self, letter_to_test):
        if str.lower(letter_to_test) in (self.letters_list):
            return True
        else:
            return False
        
    def letters_num(self):
        print(self._letters_num)

    @staticmethod
    def example():
        return "An example text in English."

english = EngAlphabet()
english.letters_num()
print(english.is_en_letter("A")) 
print(english.example())
