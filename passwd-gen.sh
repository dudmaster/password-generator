#!/bin/bash


# Default parameters

password_length=10
num_passwords=5


# Info

display_help() {
    echo "Password generator script."
    echo "Usage: $0 [-l <length>] [-n <number>] [-h]"
    echo "-l <length>    Specify the length of the password (default 10)"
    echo "-n <number>    Specify the number of passwords to be generated (default 5)"
    echo "-h             Prints this info"
    echo "Usage exmaple: $0 -l 12 -n 3"
    echo "Author: dudmaster"
}


# Parsing command line arguments

while getopts ":l:n:h" opt; do
    case $opt in
        l)
            password_length=$OPTARG
            ;;
        n)
            num_passwords=$OPTARG
            ;;
        h)
            display_help
            exit 0
            ;;
        \?)
            echo "Error: unacceptable argument - $OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Error: option - $OPTARG requires an argument" >&2
            exit 1
            ;;
    esac
done


# Password generation and stdout

for ((i = 1; i <= num_passwords; i++)); do
    password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w "$password_length" | head -n 1)
    echo "$password"
done

exit 0
