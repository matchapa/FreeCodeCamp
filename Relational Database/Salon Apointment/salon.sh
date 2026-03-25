#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "How may I help you?"

  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do 
    echo "$SERVICE_ID) $NAME"
  done
  echo -e "0) Exit"
  
  # select a service
  echo -e "\nSelect an option: "
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) SERVICE_MENU $SERVICE_ID_SELECTED ;;
    2) SERVICE_MENU $SERVICE_ID_SELECTED ;;
    3) SERVICE_MENU $SERVICE_ID_SELECTED ;;
    0) EXIT_MENU ;;
    *) OTHER_MENU ;;
  esac
}

SERVICE_MENU(){
  # get service name
  SERVICE_ID=$1
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
  echo -e "\nYou selected: $SERVICE_NAME"

  # ask and search for phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #  get name or add it if they aren't already a customer
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    #insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' ")

  # ask for service time
  echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # TIME_AVAILABLE=$($PSQL "SELECT * FROM appointments WHERE time = '$SERVICE_TIME' ")
  # if [[ -n $TIME_AVAILABLE ]]
  # then 
  #   MAIN_MENU "We are sorry but currently that time is occupied. Please, try again.\n"
  # fi

  # confirm appointment
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID, $CUSTOMER_ID, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

  # exit
  EXIT_MENU
}


EXIT_MENU(){
  echo -e "\nThank you for choosing us!\n"
}

OTHER_MENU(){
  echo -e "\nPlease enter a valid option.\n"
  MAIN_MENU
}

MAIN_MENU