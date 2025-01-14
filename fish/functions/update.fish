function update
	set --local options 'h/help' 'r/repo' 'l/local'
	argparse $options -- $argv

	if set --query _flag_help
		printf "Usage: synchronize [-h -r -l]\n\n"
		printf "Options:\n"
		printf "  -h/--help\t\tPrints help and exits\n"
		printf "  -r/--repo\t\tMoves any modification done to the configurations into the
			Github repository\n"
		printf "  -l/--local\t\tMoves any modification done to the configurations into
			the local configuration path\n"
		return
	end

	set --local current (pwd)
	set --local user (id -un)
	set --local home "/home/$user"
	
	if set --query _flag_repo
		cp -rf "$home/.config/fish/functions/*" "$home/Projects/config-files/fish/functions"
		cp -rf "$home/.config/nvim/*" "$home/Projects/config-files/nvim/"
	end

	if set --query _flag_local
		cp -rf "$home/Projects/config-files/fish/functions" "$home/.config/fish/functions/*"
		cp -rf "$home/Projects/config-files/nvim/" "$home/.config/nvim/*"
	end
end
