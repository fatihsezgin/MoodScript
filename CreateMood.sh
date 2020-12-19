#!/bin/bash

# Script that creates the mood for the user. User selects the applications
# in the listed output, and adds the applications in specific mood variable.


apps=( )

# function for getting the applications based on the user Operating System.
# assings the apps array.
function fillApps(){
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Reads the applications in the specific folders that Linux based systems uses for storing the applications
        # Assigns the file names into the apps array.
        while IFS= read -r -d '' filename; do
            apps+=( "$filename" )
        done < <(find /usr/share/applications ~/.local/share/applications -type f -exec basename {} .desktop \; -printf '\0')
        
        for file in "${apps[@]}"; do
            echo $file
        done
        
        elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    fi
    
}
# function that displays the application
function displayApps(){
    find /usr/share/applications ~/.local/share/applications -type f -exec basename {} .desktop \; -printf '\0'
}

#function that writes into the txt file.
function writeToTxt(){
    read appsForMood # stores the user input. 
    # splits the @appsForMood and assings the @moodApps array.
    read -ra moodApps <<< "$appsForMood"
    for i in "${moodApps[@]}"; do
        echo "$i" >> $1.txt  # the applications will be written into the txt file.
    done
}

# function for creating a Mood for the user. 
# a txt file will be created by given mood name.
# the applications that given by the user, will be written into the .txt that already has created within the moodname.
function createMood(){
    echo -e "The applications based on your OS will be listed below.\n Please enter the app names exactly in that form in able to work properly."
    echo
    #prints the application names that currently installed into the user system
    fillApps
    echo
    echo -e "Please name your Mood"
    read moodName # stores the name of the Mood
    touch $moodName.txt
    
    echo -e "Please enter the apps for $moodName Mood. Please use white space as a delimiter"
    
    writeToTxt $moodName
}

# function that updates the mood.
function updateMood(){
    echo -e "Please enter the Mood Name that you want to update"
    read moodName

    # checks if the mood has been already created.
    if test -f "$moodName.txt"; then

        echo -e "Contents of the $moodName will be displayed"
        echo 

        # contents of the moodname will be displayed for user to see.
        cat $moodName.txt 

        echo -e "For any addition the applications the list of applications will be listed. Enter for continue"
        read 
        
        # for any addition the applications will be listed.
        displayApps
        echo
        echo -e "Please use the white space for the delimiter"
        writeToTxt $moodName
    else 
        echo -e "$moodName Mood does not exist"
        echo -e "You will be redirected into the main menu. Press enter for continue"
        read 
        main
    fi 
    
}

function deleteMood(){
    echo -e "Plese enter the Mood name that you want to delete"
    read moodName

    # checks if the Mood is valid.
    if test -f "$moodName.txt"; then
        rm "$moodName.txt"
    else
        echo -e "$moodName Mood does not exist"
    fi
    echo -e "You will be redirected into the main menu. Press enter for continue"
    read 
    main
}

function main (){

    echo -e "This script helps you to create a Mood for your wishes.\nPlease select the operation number

        [1] Creating a Mood
        [2] Updating a Mood
        [3] Deleting a Mood
    "
    read option

    case $option in
        '1')
            createMood
        ;;
        
        '2')
            updateMood
        ;;
        
        '3')
            deleteMood
        ;;
    esac
}



main


