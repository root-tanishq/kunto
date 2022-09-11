#!/bin/bash
# Browser -> brave.com
${SMK_SUDO} apt install apt-transport-https curl -y
${SMK_SUDO} curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| ${SMK_SUDO} tee /etc/apt/sources.list.d/brave-browser-release.list
${SMK_SUDO} apt update
${SMK_SUDO} apt install brave-browser -y 
