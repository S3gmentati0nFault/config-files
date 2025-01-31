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

	set --local current (pwd)
	set --local machine $hostname
	set --local user (id -un)

	if test ! -d /home/$user/obsidian-vault
		echo "The folder does not exist"
		cd /home/$user
		git clone git@github.com:S3gmentati0nFault/obsidian-vault.git
	end

	set --local vault "/home/$user/obsidian-vault"
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

	cd $current
	end
end
