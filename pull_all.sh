#!/bin/zsh
#
# used to recursively git pull all of your repos
# assumes all subdirectoris in pwd are repos

# move into each repo, git pull
for i in *(/F); do
    pushd $i
    echo "checking for updates in $i..."
    pull=$(git pull)
    if [ $pull = "Already up to date." ]; then
        print "no updates in $i"
    elif [ $? -eq 0 ]; then
        print $pull
        echo "$i updated successfully."
    else
        print $pull
        exit 1
    fi
    popd
done

echo "done."
