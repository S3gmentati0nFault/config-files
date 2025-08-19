function obsidian_runner
    # Position in the obsidian vault
    cd "/home/heartofgold/obsidian-vault/"

    # Update remote
    git remote update

    # Check if the remote can be fast-forwarded
    git status -uno | grep "fast-forwarded"
    if test $status -eq 0
	git status -uno | grep "changes\|untracked"
	if test $status -eq 0
	    git add .
	    git commit -m "chore: vault backup from $system at $curr_time"
	end
	git pull
	git push
    end

    # Set some variables
    set system (cat /etc/hostname)
    set curr_time (date + "%Y-%m-%dT%H:%M")

    # Run obsidian (uncomment if needed)
    /home/heartofgold/Applications/Obsidian-1.5.12_d38638eb60807df6c38b5c8a80dfad16.AppImage --no-sandbox %U
end
