function update

	# Variables
	set --local home /home/heart-of-gold
	set --local wezterm $home/.config/wezterm
	set --local fish $home/.config/fish/functions
	set --local backup $home/.config/dotbackup
	set --local dotfiles $home/Projects/config-files
	set --local wm $home/.config/i3

	# Create the old dotfiles dir
	echo "Generating the DOTBACKUP folder"
	mkdir -p $backup
	echo "...done\n\n\n"

	# Copy all of the functions from the original fish folder to the backup
	for file in $fish/*
		echo "Moving all of the fish functions to the backups"
		set --local base (basename $file)
		echo "$file --> $backup/$base"
		mv -f "$file" "$backup/$base"
	end
	echo "...done"

	# Copy the old configuration of wezterm to the backup folder
	echo "Moving the wezterm configuration to backup"
	mv -f "$wezterm/wezterm.lua" "$backup/wezterm.lua"
	echo "...done"

	# Copy the old configuration of i3 to the backup folder
	echo "Moving the i3 configuration to backup"
	mv -f "$wm/config" "$backup/i3/config"
	echo "...done"

	# Symlink every file in the fish functions directory and add the symlink to the wezterm and
	# i3 configuration file
	for file in $dotfiles/fish/functions/*
		echo "Moving all the fish functions from the dotfiles dir to the config function"
		set --local base (basename $file)
		echo "$file --> $fish/$base"
		ln -s $file $fish/$base
	end
	ln -s $dotfiles/wezterm.lua $wezterm/wezterm.lua
	ln -s $dotfiles/i3/config $wm/config
	echo "...done"
end
