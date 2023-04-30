#!/bin/bash

DOTFILES_DIRECTORY="$(pwd)"
CONFIG_DIR="${HOME}/.config"
OLD_DOTFILES="${HOME}/.dotfiles.old"
OLD_CONFIG="${HOME}/.config.old"
DRY_RUN=false

link_home() {
    FILE="${HOME}/${2}"
   	NEW_FILE="${DOTFILES_DIRECTORY}/${1}"
   	echo "Backing up $FILE to dir $OLD_DOTFILES"
   	backup_file "$FILE" "$OLD_DOTFILES"
    # Force create/replace the symlink.
    link_file "$NEW_FILE" "$FILE"
    echo "Linking $FILE to new target $NEW_FILE"
}

link_config() {
	FILE="${CONFIG_DIR}/${2}"
	NEW_FILE="${DOTFILES_DIRECTORY}/${1}"
	echo "Backing up $FILE to dir $OLD_CONFIG"
	backup_file "$FILE" "$OLD_CONFIG"
    # Force create/replace the symlink.
    link_file "$NEW_FILE" "$FILE"
    echo "Linking $FILE to new target $NEW_FILE"
}

backup_file() {
	if [ "$DRY_RUN" = false ]
	then
		mv -f "${1}" "${2}" 2>/dev/null
	fi
}

link_file() {
	if [ "$DRY_RUN" = false ]
	then
		ln -fsT "${1}" "${2}"
	fi
}

while getopts d OPTION
do
    case "${OPTION}" in
        d)
        	echo "-d flag was passed, wont actually backup or link anything"
        	DRY_RUN=true
        	;;
        ?)
        	echo "Unknown argument, only argument is -d for dry-run"
        	exit 1
        	;;
    esac
done

echo "Creating backup dirs $OLD_DOTFILES and $OLD_CONFIG"
if [ "$DRY_RUN" = false ]
then
	mkdir -p $OLD_DOTFILES $OLD_CONFIG
fi

# Create the necessary symbolic links between the `dotfiles` and the appropriate directory.
link_home 	"shell/bashrc"             		".bashrc"
link_home 	"shell/bash_profile"       		".bash_profile"
link_home 	"shell/bashrc.d"				".bashrc.d"
link_config "config/micro"	 				"micro"
link_config "config/terminator"    			"terminator"
link_config "config/ulauncher"        		"ulauncher"
