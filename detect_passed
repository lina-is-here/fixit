#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color
LGray='\033[0;37m'

while read -r line; do
    # do your stuff here with $line
    echo $line
    if [[ $line == *"16 passed"* ]]; then
        sleep 1
        echo -e "${GREEN}CONGRATULATIONS${NC}"
        sleep 1
        echo -e "${LGray}You got away from the ghosts${NC}"
        sleep 1
        echo ""
        echo -e "Enter the code ${GREEN}I_SURVIVED${NC} to escape"
    fi
done < <(pytest $1)
