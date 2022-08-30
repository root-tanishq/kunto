#!/bin/bash
# Kunto Version 1.0
# Created by Tanishq Rathore
# MIT Licensed

# Variables
mkdir ~/.kunto 2>/dev/null
export DIR="~/.kunto/"
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
	echo -e "\033[0;36m

   ▄█   ▄█▄ ███    █▄  ███▄▄▄▄       ███      ▄██████▄  
  ███ ▄███▀ ███    ███ ███▀▀▀██▄ ▀█████████▄ ███    ███ 
  ███▐██▀   ███    ███ ███   ███    ▀███▀▀██ ███    ███ 
 ▄█████▀    ███    ███ ███   ███     ███   ▀ ███    ███ 
▀▀█████▄    ███    ███ ███   ███     ███     ███    ███ 
  ███▐██▄   ███    ███ ███   ███     ███     ███    ███ 
  ███ ▀███▄ ███    ███ ███   ███     ███     ███    ███ 
  ███   ▀█▀ ████████▀   ▀█   █▀     ▄████▀    ▀██████▀  
  ▀                                                     
                  
     					- Tanishq Rathore
 Help menu 

 $0 install <tool name>					- Install the following tool.
 $0 search <tool name>					- Search for available tools in the authors github.
 $0 update						- Update kunto to the latest version.

        "
}

# Checking for positional parameteres
if [[ -z $1 ]];then
	help_menu
	exit
fi


# Functionality
case "$1" in
"install")
	if [[ -z $2 ]];then
		help_menu
		exit
	fi
	if [[ $(curl -sI https://${AUTHOR}.github.io/kunto/scripts/kuntool_$2.sh  | grep HTTP/ | cut -d ' ' -f 2) == "200" ]]; then
		echo -e "\033[0;0m[\033[0;32m❯\033[0;0m] Installing $2 from ${AUTHOR} github.";
		bash -c "$(curl -fsSL https://${AUTHOR}.github.io/kunto/scripts/kuntool_$2.sh)";
	else
		echo -e "[\033[0;31m❯\033[0;0m] $2 not found in $AUTHOR github.";
	fi
	exit
	;;
"help")
	help_menu
	exit
	;;
"search")
	if [[ -z $2 ]];then
		help_menu
		exit
	fi
	echo -e "\033[0;0m[\033[0;32m❯\033[0;0m] Following tools found in ${AUTHOR} github.";
	curl -fsSL https://github.com/${AUTHOR}/kunto/tree/main/scripts | grep title=\"kuntool_* | awk -F'title="kuntool_' '{print $2}' | awk -F'.sh"' '{print $1}' | grep -i $2
	;;
"update")
	if [[ $(curl -fsSL https://${AUTHOR}.github.io/kunto/kunto.sh | md5sum | cut -d ' ' -f '1') != $(md5sum $0 | cut -d ' ' -f '1') ]] ;then 
		echo -e "\033[0;0m[\033[0;32m❯\033[0;0m] Updating kunto from ${AUTHOR} github.";
		${SMK_SUDO} curl -fsSL https://${AUTHOR}.github.io/kunto/kunto.sh -o $0;
		${SMK_SUDO} chmod +x $0;
		exit
	fi
	;;
*)
	help_menu
	;;
esac
