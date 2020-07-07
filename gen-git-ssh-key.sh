#!/bin/bash

SSH_CONFIG=~/.ssh/config

read -p "Please enter your github email: " email
ssh-keygen -t rsa -b 4096 -C $email

eval "$(ssh-agent -s)"
echo ""
echo "Starting ssh-agent in the background..."
echo "Checking to see if your ~/.ssh/config file exists in the default location..."

if test -f "$SSH_CONFIG"; then
    echo "~/.ssh/config exists."

    ssh-add -K ~/.ssh/id_rsa

    echo ""
    echo "added SSH private key to your ~/.ssh/config."
    echo "copied passphrase to your keychain."

    pbcopy < ~/.ssh/id_rsa.pub

    echo ""
    echo "copied your key to your clipboard."  

    echo ""
    echo "===================================="
    echo "== Your generated SSH private key =="
    echo "===================================="

    cat ~/.ssh/id_rsa.pub
else
    echo "~/.ssh/config does not exist."

    mkdir ~/.ssh
    touch ~/.ssh/config

    echo "created ~/.ssh/config."

    ssh-add -K ~/.ssh/id_rsa

    echo ""
    echo "added SSH private key to your ~/.ssh/config."
    echo "copied passphrase to your keychain."

    pbcopy < ~/.ssh/id_rsa.pub

    echo ""
    echo "copied your key to your clipboard."  

    echo ""
    echo "===================================="
    echo "== Your generated SSH private key =="
    echo "===================================="
    cat ~/.ssh/id_rsa.pub
fi