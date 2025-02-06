function update

	# Variables
<<<<<<< HEAD
	set --local home /home/heartofgold
=======
	set --local home /home/heart-of-gold
>>>>>>> 73777506182a46cf1f78ed2e91f7cbedbbfaf17c
	set --local wezterm $home/.config/wezterm
	set --local fish $home/.config/fish/functions
	set --local backup $home/.config/dotbackup
	set --local dotfiles $home/Projects/config-files
<<<<<<< HEAD
=======
	set --local wm $home/.config/i3
>>>>>>> 73777506182a46cf1f78ed2e91f7cbedbbfaf17c

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

<<<<<<< HEAD
	# Symlink every file in the fish functions directory and add the symlink to the wezterm
	# configuration file
=======
	# Copy the old configuration of i3 to the backup folder
	echo "Moving the i3 configuration to backup"
	mv -f "$wm/config" "$backup/i3/config"
	echo "...done"

	# Symlink every file in the fish functions directory and add the symlink to the wezterm and
	# i3 configuration file
>>>>>>> 73777506182a46cf1f78ed2e91f7cbedbbfaf17c
	for file in $dotfiles/fish/functions/*
		echo "Moving all the fish functions from the dotfiles dir to the config function"
		set --local base (basename $file)
		echo "$file --> $fish/$base"
		ln -s $file $fish/$base
	end
	ln -s $dotfiles/wezterm.lua $wezterm/wezterm.lua
<<<<<<< HEAD
=======
	ln -s $dotfiles/i3/config $wm/config
>>>>>>> 73777506182a46cf1f78ed2e91f7cbedbbfaf17c
	echo "...done"
end
