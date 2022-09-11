#!/bin/bash
# GUI Text Editor -> www.sublimetext.com
${SMK_SUDO} apt-get install apt-transport-https -y
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | ${SMK_SUDO} tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | ${SMK_SUDO} tee /etc/apt/sources.list.d/sublime-text.list
${SMK_SUDO} apt update
${SMK_SUDO} apt install sublime-text -y 
