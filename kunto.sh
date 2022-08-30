#!/bin/bash
# Kunto Version 1.0
# Created by Tanishq Rathore
# MIT Licensed

# Variables
mkdir ~/.kunto 2>/dev/null
export DIR="~/.kunto"
export AUTHOR="root-tanishq"

# Checking for super user access
if [[ $EUID == 0 ]];then
export SMK_SUDO=''
elif [[ $(groups | grep -oP sudo) == "sudo" ]];then
export SMK_SUDO='sudo'
elif [[ $EUID != 0 && $(groups | grep -oP sudo) != "sudo" ]]; then
echo -e "[\033[0;31m❯\033[0;0m] root or sudo access required for setmykali \033[0;33m[root | sudo] \033[0;0m";
echo -e "[\033[0;31m❯\033[0;0m] if \033[1;33m'sudo'\033[0;0m is granted all the necessary customization changes will be done for \033[0;33mcurrent user \033[0;0m";
echo
exit
fi

# Help Menu
function help_menu () {
	echo "Help Menu here"
}

# Checking for positional parameteres
if [[ -z $1 || -z $2 ]];then
	help_menu
	exit
fi


# Functionality
case "$1" in
"install")
	echo "install"
	;;
"about")
	echo "about"
	;;
"search")
	echo -e "\033[0;0m[\033[0;32m❯\033[0;0m] Following tools found in ${AUTHOR} github.";
	curl -fsSL https://github.com/${AUTHOR}/kunto/tree/main/scripts | grep title=\"kuntool_* | awk -F'title="kuntool_' '{print $2}' | awk -F'.sh"' '{print $1}' | grep -i $2
	;;
"update")
	echo "$0"
	;;
*)
	help_menu
	;;
esac
