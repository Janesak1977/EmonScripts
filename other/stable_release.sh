#!/bin/bash

# sudo apt-get install jq

M=$(pwd)

if [ -d "$M/.git" ]; then


    if [ -f "$M/module.json" ]; then
        version=$(cat "$M/module.json" | jq -r '.version')
    elif [ -f "$M/version.json" ]; then
        version=$(cat "$M/version.json" | jq -r '.version')
    else
        echo "module or version file not found"
        exit 0
    fi

    changes=$(git -C $M diff-index HEAD --)
    if [ "$changes" = "" ]; then
    
        echo "Creating stable release for: $M $version"       
    
        git -C $M fetch --all --prune

        git -C $M checkout stable
        
        git -C $M checkout stable

        git -C $M merge origin/master

        git -C $M push origin stable

        git -C $M tag -a $version -m $version

        git -C $M push origin $version

        git -C $M checkout master

        git -C $M merge origin/stable

        git -C $M push origin master
    fi
fi



