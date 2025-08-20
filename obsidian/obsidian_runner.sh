#!/bin/sh

# Position in the obsidian vault
cd "/home/heartofgold/obsidian-vault/" || exit 1

# Update remote
git remote update

# Set some variables
system=$(cat /etc/hostname)
curr_time=$(date +"%Y-%m-%dT%H:%M")

# Check if the remote can be fast-forwarded
if git status -uno | grep -q "fast-forwarded"; then
    if git status -uno | grep -q "changes\|untracked"; then
        git add .
        git commit -m "chore: vault backup from $system at $curr_time"
    fi
    git pull
    git push
fi

exec /home/heartofgold/Applications/Obsidian-1.5.12_d38638eb60807df6c38b5c8a80dfad16.AppImage
