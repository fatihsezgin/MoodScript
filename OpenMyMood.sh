#!/bin/bash

# Command line argument should deliver valid Mood name that has been
# created with CreateMood.sh
wantedMood=$1

# Checks if the file does exists
# if exists, redirects to the execute function that reads the file content
# and executes each line of the file.
function checkFile(){
    if test -f "$wantedMood.txt"; then
        execute
    else
        echo -e "The Mood that you want to open does not exists.\n
        You can create a Mood by CreateMood.sh script."
    fi
}

# read and execute the file contents.
function execute(){
    while read line; do
        $line;
    done < "$wantedMood.txt"
}

#main function
function main(){
    checkFile
}

main