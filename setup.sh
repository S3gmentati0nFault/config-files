# Understand which package manager to use
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)
DNF_CMD=$(which dnf)

PMANAGER=""
if [[ ! -z $YUM_CMD ]]; then
    PMANAGER=$(yum)
elif [[ ! -z $APT_GET_CMD ]]; then
    PMANAGER=$(apt-get)
elif [[ ! -z $DNF_CMD ]]; then
    PMANAGER=$(dnf)
else
   exit 1;
fi

echo $PMANAGER


# Create the projects folder and clone the config files in it
USER=$(id -un)
HOME=/home/$USER
PROJECTS=$HOME/Projects/
CONFIGS=$HOME/config-files
LOCAL=$HOME/.config
mkdir /home/$USER/Projects
git clone git@github.com:S3gmentati0nFault/config-files.git $PROJECTS

# Install the various packages necessary

# Fish
sudo $PMANAGER install fish
cp -r $CONFIGS/fish/functions $LOCAL/fish/functions

# Nvim
sudo $PMANAGER install neovim
cp -r $CONFIGS/nvim $LOCAL/nvim

# build-essential
sudo $PMANAGER install build-essential

# Wezterm
flatpak install wezterm
cp $CONFIGS/wezterm $LOCAL/

# Okular
sudo $PMANAGER install okular


# Copy the obsidian directory
synchronize -d
