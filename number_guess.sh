#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read  NAME
USER_IS=$($PSQL "SELECT user_id FROM users WHERE name = '$NAME'")

if [[ -z $USER_IS ]]; then
    INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES ('$NAME')")
    echo "Welcome, $NAME! It looks like this is your first time here."
else
    echo "Welcome back, $NAME! You have played <games_played> games, and your best game took <best_game> guesses."
fi

random_number=$((1 + RANDOM % 1000))
