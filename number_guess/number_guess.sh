#!/bin/bash

# number guessing game

#global variables
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo "Enter your username:"
read GUESSER_NAME

HIGHSCORE_RECORD=$($PSQL "SELECT * FROM hiscores WHERE username = '$GUESSER_NAME'")

if [[ -z $HIGHSCORE_RECORD ]]
then
  # new user, create record
  INSERT_RESULT=$($PSQL "INSERT INTO hiscores (username, games_played, best_game) VALUES ('$GUESSER_NAME', 0, 999)")
  HIGHSCORE_RECORD=$($PSQL "SELECT * FROM hiscores WHERE username = '$GUESSER_NAME'")
  echo "Welcome, $GUESSER_NAME! It looks like this is your first time here."
else
  # returning user, display stats
  read ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME <<< $HIGHSCORE_RECORD
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# get values regardless whether new user or not, will use these to update record when game is over
read ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME <<< $HIGHSCORE_RECORD

# set our variables
NUMBER=$(( ($RANDOM % 1000) + 1 ))
GUESSED=false
TOTAL_GUESSED=1
echo "Guess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESSED = false ]]
do
  # verify GUESS is an integer
  while ! [[ "$GUESS" =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS
  done

  if [[ "$GUESS" -eq "$NUMBER" ]]
  then
    echo "You guessed it in $TOTAL_GUESSED tries. The secret number was $NUMBER. Nice job!"
    GUESSED=true
    #update database
    if [[ "$TOTAL_GUESSED" -lt "$BEST_GAME" ]]
    then
      UPDATE_SCORE=$TOTAL_GUESSED
    else
      UPDATE_SCORE=$BEST_GAME
    fi
    UPDATE_RESULT=$($PSQL "UPDATE hiscores SET games_played = $((++GAMES_PLAYED)), best_game = $UPDATE_SCORE WHERE id = $ID")
  else
    if [[ "$GUESS" -gt "$NUMBER" ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
    read GUESS
    ((++TOTAL_GUESSED))
  fi
done
