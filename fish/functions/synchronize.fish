function synchronize

	# Set the function's flags
	set --local options 'h/help' 'u/upload' 'd/download'
	argparse $options -- $argv
	
	if set --query _flag_help
		printf "Usage: synchronize [-h -u -d]\n\n"
		printf "Options:\n"
		printf "  -h/--help\t\tPrints help and exits\n"
		printf "  -u/--upload\t\tUploads the modifications done to the repository to Github\n"
		printf "  -d/--download\t\tDownloads locally the contents of the Github repository\n"
		return
	end

	set --local machine $hostname
	set --local vault ""
	if [ $machine = "pigna" ]
		set vault "/home/heart-of-gold/obsidian-vault/"
	else
		set vault "/home/heartofgold/obsidian-vault/"
	end
	echo $vault

	if [ (pwd) != $vault ]
		echo "Moving to the vault -- $vault"
		cd $vault
	end

	if set --query _flag_upload
		# Pushing to master
		git add .
		git commit -m "Synchronization for machine: $machine"
		git push
	end

	if set --query _flag_download
		# Pulling from source
		git pull
	end
end
