#!/bin/bash

# Script that creates the mood for the user. User selects the applications
# in the listed output, and adds the applications in specific mood variable.


for app in /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop;
do 
	# extracting the application name from the path 
	$basename = `basename "$app"`;

	# the applications has the extension of .desktop,
	# this line removes the extension.
	echo "${basename::-8}";
done
