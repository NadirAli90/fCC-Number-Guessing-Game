#!/bin/bash

#~~~~~~~~~~~~~NUMBER GUESSING GAME~~~~~~~~~~~~~

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read  NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$NAME'")

if [[ $USER_ID ]]; then
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
    echo "Welcome, $NAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES ('$NAME');")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$NAME'")
fi

COUNT=0
FOUND=0

R_NUM=$((1 + $RANDOM % 1000))

GAMES_PLAYED=$((GAMES_PLAYED + 1))
echo "Guess the secret number between 1 and 1000:"

while [[ $FOUND = 0 ]]; do
read NUM
if [[ ! $NUM =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
elif [[ $NUM -eq $R_NUM ]]; then
    COUNT=$((COUNT + 1))
    echo "You guessed it in $COUNT tries. The secret number was $R_NUM. Nice job!"
    if [[ $COUNT -le $BEST_GAME  || $BEST_GAME -eq 0 ]]; then
        INSERT_DATA=$($PSQL "UPDATE users SET best_game = $COUNT, games_played = $GAMES_PLAYED where name = '$NAME'")
    else 
        INSERT_DATA=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED where name = '$NAME'")
    fi
    FOUND=1
elif [[ $NUM -lt $R_NUM ]]; then
    COUNT=$((COUNT + 1))
    echo "It's higher than that, guess again:"
else
    COUNT=$((COUNT + 1))
    echo "It's lower than that, guess again:"
fi
done
