#!/bin/sh
# ideas used from https://gist.github.com/motemen/8595451

# abort the script if there is a non-zero error
set -e

remote=$(git config remote.origin.url)

pages_dir="$1"

if [ ! -d "$pages_dir" ]
then
    echo "Usage: $0 DIRECTORY"
    exit 1
fi

cd "$pages_dir"

# test to see if this directory is a git repo
cdup=$(git rev-parse --show-cdup)
if [ "$cdup" != '' ]
then
    git init
    git remote add --fetch origin "$remote"
    # if we already have the site ready to push, but we can't checkout the new
    # branch as it will say we have changes. So stash them and pop the stash
    # later
    if [[ `git status --porcelain` ]]; then
        # changes
        git stash
        stashed=true;
      else
        # no changes
        stashed=false;
    fi
fi

if git rev-parse --verify origin/gh-pages > /dev/null 2>&1
then
    git checkout gh-pages
else
    git checkout --orphan gh-pages
fi

if [ "$stashed" = true ] ; then
  git stash pop
fi

# stage any changes and new files
git add -A
# now commit
git commit -m "Deploy to GitHub pages"
# and push, but send any output to /dev/null to hide anything sensitive
git push --force --quiet origin gh-pages > /dev/null 2>&1
