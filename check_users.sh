#!/bin/bash

# Check users in file "_passwd_" and sort them by alphabetical order
#

# Set IFS to newline to split input by lines
IFS=$'\n'

# Read each line from /etc/passwd into an array
read -d '' -r -a lines < /etc/passwd

# Loop through each line in the array
for line in "${lines[@]}"; do
    # Extract the username, home directory, and shell using cut
    username=$(echo "$line" | cut -d: -f1)
    homedir=$(echo "$line" | cut -d: -f6)
    shell=$(echo "$line" | cut -d: -f7)
    # Print the extracted fields in the desired format
    echo -e "User: $username\t$homedir\t$shell"  
done | sort 
