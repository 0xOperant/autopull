#!/bin/zsh
#
# used to recursively git pull all of your repos
# assumes all subdirectoris in pwd are repos

# move into each repo, git pull
echo "[.] Starting git pulls..."
for i in *(/F); do
    pushd $i
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
            # popd
        fi
    else
        print "[.] $i is not a git repository. skipping. \n" 
    fi
    popd
done

echo "[.] Done."
