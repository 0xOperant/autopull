#!/bin/zsh
#
# used to recursively (one level) git pull all of your repos

echo "[.] Starting git pulls..."
# make list of directories
for i in *(/F); do
    # move into directory
    pushd $i
    # check if repo
    if [ -d ".git" ]; then
        echo "[.] checking for updates in $i:"
        pull=$(git pull)
        if [ $pull = "Already up to date." ]; then
            print "[.] no updates in $i. \n"
        elif [ $? -eq 0 ]; then
            print $pull
            echo "[.] $i updated successfully. \n"
        else
            print "[.] Error pulling $i: " 
            print $pull "\n"
        fi
    else
        print "[.] $i is not a git repository. skipping. \n" 
    fi
    popd
done

echo "[.] Done."
