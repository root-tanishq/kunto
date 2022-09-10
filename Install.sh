#!/bin/bash
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

if [[ -e ${which curl} ]]; then
  ${SMK_SUDO} curl -fsSL https://root-tanishq.github.io/kunto/kunto.sh -o /usr/local/bin/kunto
  ${SMK_SUDO} chmod +x /usr/local/bin/kunto
elif [[ -e ${which wget} ]]; then
  ${SMK_SUDO} wget https://root-tanishq.github.io/kunto/kunto.sh -O /usr/local/bin/kunto
  ${SMK_SUDO} chmod +x /usr/local/bin/kunto
else
  echo "Seems like we messed up"
fi
