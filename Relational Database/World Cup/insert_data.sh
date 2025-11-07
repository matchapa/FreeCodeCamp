#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Limpiamos tablas para agregar datos 
echo $($PSQL "TRUNCATE games, teams;")

#Leemos linea a linea games.csv y asignamos datos a variables
cat games.csv | while IFS=',' read YEAR ROUND WINNER_NAME OPPONENT_NAME WINNER_GOALS OPPONENT_GOALS
do
  # Salteamos primer linea
  if [[ $YEAR != year ]] 
  then
    # Obtenemos winner_id e ingresamos a BD si no está
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_NAME' ") 
    if [[ -z $WINNER_ID ]] 
    then
      $PSQL "INSERT INTO teams(name) VALUES ('$WINNER_NAME');"
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_NAME';")
    fi

    # Obtenemos opponent_id e ingresamos a BD si no está
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_NAME' ") 
    if [[ -z $OPPONENT_ID ]] 
    then
      $PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT_NAME');"
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_NAME';")
    fi

    # Ingresamos datos de partidos
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)";

  fi
done
