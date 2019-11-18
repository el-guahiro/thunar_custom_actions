run() {    
cd # make sure we're in the home directory
echo 'What emblem do you want to apply?'
read /home/user/.local/share/icons/elementary-xfce/emblems/22/emblem.png

if ! [ -z $emblem ]; then
    for i in $@
    do
        echo 'Changing stuff...'
        $(gvfs-set-attribute $i -t stringv metadata::emblems $emblem)
    done
    echo 'Done!'
else
    echo 'Emblem must be specified! Exiting...'
    exit  
fi
}

init() {

if [[ -z $@  ]]; then
    echo "No arguments provided"
else   
    run $@
fi
}

init $