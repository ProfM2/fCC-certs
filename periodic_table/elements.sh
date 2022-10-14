#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# if we don't have 1 argument, quit
if [[ "$#" -ne 1 ]] 
then
  echo "Please provide an element as an argument."
else
  # we have the first argument to test against, check number or string
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # find element via atomic number
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number = '$1'")
  else
    if [[ `echo $1 | wc -c` > 3 ]]
    then
      # find element via name
      ELEMENT=$($PSQL "SELECT * FROM elements WHERE name = '$1'")
    else
      # find element via symbol
      ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol = '$1'")
    fi
  fi

  # test if we found the element
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    # read into element variables
    read ATOMIC_NUMBER BAR SYMBOL BAR NAME <<< $ELEMENT
    # format columns - remove all whitespace, skip | elements
    ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed -e 's/^[ \t]*//' -e 's/\ *$//g')
    SYMBOL_FORMATTED=$(echo $SYMBOL | sed -e 's/^[ \t]*//' -e 's/\ *$//g')
    NAME_FORMATTED=$(echo $NAME | sed -e 's/^[ \t]*//' -e 's/\ *$//g')

    # read properties table
    PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number = '$ATOMIC_NUMBER_FORMATTED'")

    # read into properties variables
    read ATOMIC_NUMBER BAR MASS BAR MELTING BAR BOILING BAR TYPE_ID <<< $PROPERTIES
    # format columns - remove all whitespace
    ATOMIC_MASS_FORMATTED=$(echo $MASS | sed -e 's/^[ \t]*//' -e 's/\ *$//g')
    MELTING_FORMATTED=$(echo $MELTING | sed -e 's/^[ \t]*//' -e 's/\ *$//g')
    BOILING_FORMATTED=$(echo $BOILING | sed -e 's/^[ \t]*//' -e 's/\ *$//g')
    TYPE_ID_FORMATTED=$(echo $TYPE_ID | sed -e 's/^[ \t]*//' -e 's/\ *$//g')

    # read types table
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = '$TYPE_ID_FORMATTED'")
    TYPE_FORMATTED=$(echo $TYPE | sed -e 's/^[ \t]*//' -e 's/\ *$//g')

    # format columns - remove all whitespace
    echo -e "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $NAME_FORMATTED ($SYMBOL_FORMATTED)." \
      "It's a $TYPE_FORMATTED, with a mass of $ATOMIC_MASS_FORMATTED amu." \
      "$NAME_FORMATTED has a melting point of $MELTING_FORMATTED celsius and a boiling point of $BOILING_FORMATTED celsius."
  fi
fi
