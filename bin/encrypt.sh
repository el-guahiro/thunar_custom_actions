#!/usr/bin/env bash
#https://github.com/ruanyf/simple-bash-scripts
echo "Welcome, I am ready to encrypt a file/folder for you"
echo "currently I have a limitation, Place me to the same folder, where a file to be encrypted is present"
echo "Enter the Exact File Name with extension"
read -r file
# decryption command
# gpg -d filename.gpg > filename
#расшифровать - в filename
# gpg -o filename filename.gpg
gpg -c "$file"
echo "I have encrypted the file sucessfully..."
echo "Now I will be removing the original file"
rm -rf "$file"
