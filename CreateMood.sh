#!/bin/bash

# Script that creates the mood for the user. User selects the applications
# in the listed output, and adds the applications in specific mood variable.


apps=( )

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    #find /usr/share/applications ~/.local/share/applications -maxdepth 1 -type f -exec basename {} .desktop \; fits the result
    #applications += find /usr/share/applications ~/.local/share/applications -maxdepth 1 -type f -exec basename {} .desktop \;
    #mapfile -d $'\0' array << `(find /usr/share/applications ~/.local/share/applications -maxdepth 1 -type f -exec basename {} .desktop \; -print0 )`
    
    #find /usr/share/applications ~/.local/share/applications -type f -exec basename {} .desktop \; | while read f; do
    #    echo "$f "
    #sdone
    
    while IFS= read -r -d '' filename; do
        apps+=( "$filename" )
    done < <(find /usr/share/applications ~/.local/share/applications -type f -exec basename {} .desktop \; -printf '\0')
    
    
    for file in "${apps[@]}"; do
        echo $file
    done
    
    
    # it assings a one line
    #mapfile -t apps < <(find /usr/share/applications ~/.local/share/applications -type f -exec basename {} .desktop \; )
    
    #applications = (` find /usr/share/applications ~/.local/share/applications -maxdepth 1 -type f -exec basename {} .desktop \;`)
    elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macos"
fi

# finds the applications of the user in linux environments
#find /usr/share/applications ~/.local/share/applications -maxdepth 1 -type f -exec basename {} .desktop \;

