#!/bin/zsh

# parent directory of your repos
dir=~/awsgit

# define repositories (one per line)
repos="
md
red
"

# build array, split by newline (\n)
repoarray=( ${(f)repos} )

# move into each repo, git pull
for i in $repoarray; do
    cd $dir/$i
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
done

echo "done."