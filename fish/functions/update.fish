function update

	# Variables
	set --local user (id -u -n)
	set --local home /home/$user
	set --local wezterm $home/.config/wezterm
	set --local fish $home/.config/fish/functions
	set --local backup $home/.config/dotbackup
	set --local dotfiles $home/Projects/config-files
	set --local wm $home/.config/i3
	set --local poly $home/.config/polybar/shapes

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

	# Copy the old polybar configuration to the backup folder
	echo "Moving the polybar configuration to backup"
	mv -f "$poly/modules.ini" "$backup/modules.ini"
	mv -f "$poly/user_modules.ini" "$backup/user_modules.ini"
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
	ln -s $dotfiles/polybar/modules.ini $poly/modules.ini
	ln -s $dotfiles/polybar/user_modules.ini $poly/user_modules.ini
	echo "...done"
end
