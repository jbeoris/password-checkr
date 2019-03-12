#!/bin/bash
#title           :password_checkr.sh
#description     :checks for pwned passwords against cracked list using k-anonymity.
#author		     :John Beoris
#date            :20190312
#version         :0.1    
#usage		     :bash password_checkr.sh
#notes           :Use password manager to make better passwords.
#bash_version    :3.2
#==============================================================================

api_endpoint="https://api.pwnedpasswords.com/range/" # Can use any API that accepts SHA1 range.
temp_file=$(mktemp /tmp/password_checkr_data.txt)
length=5 # Can be modified. Smaller length is more secure.

echo "Let's test your password security."
printf "Enter Password and press [ENTER]: "
read password

full_hash=$(printf $password | openssl sha1 | tr [a-z] [A-Z])

echo "Password SHA1 Hash: ${full_hash}"
echo "Checking API for matching entries..."

partial_hash="${full_hash:0:$length}"
remainder="${full_hash:$length:${#full_hash}}"
api_url="${api_endpoint}${partial_hash}"

rm $temp_file 2> /dev/null

curl -s $api_url >> $temp_file

matches=$(cat $temp_file | grep $remainder)

printf "Results: "

if $(cat $temp_file | grep -q $remainder); then
    count=$(echo ${matches##*:} | tr -d "\n\r")
    count_text="times"
    if [ "$count" = "1" ]; then
        count_text="${count} time"
    else
        count_text="${count} times"
    fi
    echo "WARNING! the password \"${password}\" has been cracked ${count_text}!"
else
    echo "No matches found. Password is secure."
fi

rm $temp_file 2> /dev/null
