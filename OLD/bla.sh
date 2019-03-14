#!/bin/bash

BIGLINE="+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-"

clear
echo -e "${BIGLINE}"

show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Here you are ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Get there ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} It's dangerous but you can do it ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} Everything's alright ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt

  while [ opt != '' ]
  do
    if [[ $opt = "" ]]; then
      exit;
    else
      case $opt in
      1) clear;
      option_picked "Here you are";
      sub_menu1;
      ;;

      2) clear;
      option_picked "Get there";
      sub_menu2;
      ;;

      3) clear;
      option_picked "It's dangerous but you can do it";
      echo "test"
      sub_menu4;
      ;;

      4) clear;
      option_picked "Everything's alright";
      show_menu;
      ;;

      x)exit;
      ;;

      \n)exit;
      ;;

      *)clear;
      option_picked "Pick an option from the menu";
      show_menu;
      ;;
      esac
    fi
  done
}

function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

sub_menu1(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Continue ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "You wake up and try to get up. Something is very unusual..."
    echo -e "You can't! Your legs are gone! You try to reach to your phone and post on Facebook."
    echo -e "You can't! Reflection in the mirror tells you that you are some weird round and yellow creature."
    echo -e "Your passcode for the next level is ${RED_TEXT}yellow${NORMAL}"

    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read sub1
  while [ sub1 != '' ]
  do
    if [[ $sub1 = "" ]]; then
      exit;
    else
      case $sub1 in
      1) clear;
      option_picked "Select the passcode";
      sub_menu2;
      ;;

      x)exit;
      ;;

      \n)exit;
      ;;

      *)clear;
      option_picked "Pick an option from the menu";
      show_menu;

      ;;
      esac
    fi
  done
}

sub_menu2(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Go back to the previous level ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter the passcode or select menu option 1 to go back or ${RED_TEXT}enter to exit. ${NORMAL}"
    read sub1
  while [ sub1 != '' ]
  do
    if [[ $sub1 = "" ]]; then
      exit;
    else
      case $sub1 in
      1) clear;
      option_picked "Went back";
      echo "Once again,"
      sub_menu1;
      ;;

      yellow) clear;
      option_picked "Passcode is correct";
      echo "well, let's continue"
      sub_menu3
      ;;

      x)exit;
      ;;

      \n)exit;
      ;;

      *)clear;
      option_picked "Passcode is incorrect";
      sub_menu2;
      ;;
      esac
    fi
  done
}

sub_menu3(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Go back to the previous level ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Go to the next level ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "You are hungry."
    echo -e "You start to roll around your cave in search for something eatable."
    echo -e "This place is empty. So you need to order some."
    echo -e "On your fridge you see a note \"The food is there: ${RED_TEXT}https://github.com/lina-nikiforova/fixit/raw/master/the_task\"${NORMAL}"
    echo -e "${ENTER_LINE}Go to the next level when you are ready or select menu option 1 to go back or ${RED_TEXT}enter to exit. ${NORMAL}"
    read sub1
  while [ sub1 != '' ]
  do
    if [[ $sub1 = "" ]]; then
      exit;
    else
      case $sub1 in
      1) clear;
      option_picked "Went back";
      echo "Once again,"
      sub_menu2;
      ;;

      2) clear;
      option_picked "Open it!";
      sub_menu4;
      ;;

      x)exit;
      ;;

      \n)exit;
      ;;

      *)clear;
      option_picked "Get the food ;)";
      sub_menu3;
      ;;
      esac
    fi
  done
}


sub_menu4(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Go back to the previous level ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Go to the next level ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "The food is delivered and smells so good!"
    echo -e "Open it!"
    echo -e "${ENTER_LINE}Go to the next level when you are ready or select menu option 1 to go back or ${RED_TEXT}enter to exit. ${NORMAL}"
    read sub1
  while [ sub1 != '' ]
  do
    if [[ $sub1 = "" ]]; then
      exit;
    else
      case $sub1 in
      1) clear;
      option_picked "Went back";
      echo "Once again,"
      sub_menu3;
      ;;

      2) clear;
      option_picked "Hmmm, not exactly what you expected";
      sub_menu5;
      ;;

      x)exit;
      ;;

      \n)exit;
      ;;

      *)clear;
      option_picked "Open the food ;)";
      sub_menu4;
      ;;
      esac
    fi
  done
}


sub_menu5(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Go back to the previous level ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Go to the next level ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "The ghosts are back!"
    echo -e "Damn, you just woke up and need to fight for your food?"
    echo -e "Luckily, there's a special magic script to help you out."
    echo -e "Run \"pytest script.py\" and get all the tests passed to run away from the ghosts"
    echo -e "${ENTER_LINE}Select menu option 1 to go back or ${RED_TEXT}enter to exit. ${NORMAL}"
    read sub1
  while [ sub1 != '' ]
  do
    if [[ $sub1 = "" ]]; then
      exit;
    else
      case $sub1 in
      1) clear;
      option_picked "Went back";
      echo "Once again,"
      sub_menu4;
      ;;

      x)exit;
      ;;

      \n)exit;
      ;;

      *)clear;
      option_picked "Fix the script";
      sub_menu5;
      ;;
      esac
    fi
  done
}

clear
show_menu
