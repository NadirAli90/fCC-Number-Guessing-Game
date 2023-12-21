#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESS_FUNC () {
if [[ $1 ]]; then
 echo "$1"
fi
read NUM
if [[ ! $NUM =~ ^[0-9]+$ ]]; then
    GUESS_FUNC "That is not an integer, guess again:"
elif [[ $NUM -gt $R_NUM ]]; then
    ((COUNT++))
    GUESS_FUNC "It's lower than that, guess again:"
elif [[ $NUM -lt $R_NUM ]]; then
    ((COUNT++))
    GUESS_FUNC "It's higher than that, guess again:"
elif [[ $NUM -eq $R_NUM ]]; then
    ((COUNT++))
    echo "You guessed it in $COUNT tries. The secret number was $R_NUM. Nice job!"
fi
}

echo "Enter your username:"
read  NAME
R_NUM=$((1 + RANDOM % 1000))

DATA_QUERY=$($PSQL "SELECT * FROM users WHERE name = '$NAME'")
IFS="|" read -r USER_ID USER_NAME GAMES_PLAYED BEST_GAME <<< $DATA_QUERY

if [[ -z $USER_ID ]]; then
    echo "Welcome, $NAME! It looks like this is your first time here."
else
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
((GAMES_PLAYED++))
COUNT=0
GUESS_FUNC
