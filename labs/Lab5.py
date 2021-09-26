import random

#guessesTaken = 0

number = random.randint(1,99)
guess = None
print('Please guess a number betweem 1 and 99')

while guess != number:
    guess = int(input())

    #guessesTaken = guessesTaken + 1


    if guess < number:
        print("Your guess is too low, please guess a higher number")
    if guess > number:
        print("Your guess is too high, please guess a lower number")
    if guess == number:
        print('congratualtions you won the game!')
        break

#if guess == number:
   # guessesTaken = (guessesTaken)
   # print('Congrats, you guest the number in ' + guessesTaken + ' guesses!')


