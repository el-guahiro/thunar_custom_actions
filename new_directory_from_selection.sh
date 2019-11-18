#!/bin/bash
# ------------------------------------------------------------------------------
# Script creates new directory and move all selected files into that.
# Needs zenity to be installed.
# On Ubuntu run: sudo apt-get install zenity
# ------------------------------------------------------------------------------

# Define a function that launches the zenity input dialog
get_dir_name(){
    zenity --entry \
    --width=600 \
    --title="Сделаем новую папку из выделенного" \
    --text="Как назовём папку?"
}

# Ask user for directory name
foldername=$(get_dir_name) || exit

# Try to create a new directory
errorString=$( mkdir "$foldername" 2>&1 )

# If an error occurs, show dialog again
while [ -n "$errorString" ]; do
    zenity --error \
    --title="$( echo $errorString | cut -d: -f3- )" \
    --text="$( echo $errorString | cut -d: -f2- )" || exit 

    # Ask user for directory name
    foldername=$(get_dir_name) || exit
    errorString=$( mkdir "$foldername" 2>&1 )
done

# Moving files to new directory
mv -t "${PWD}/${foldername}" "${@}" 