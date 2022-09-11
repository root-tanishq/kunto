#!/bin/bash
# URL -> https://github.com/Findomain/Findomain
# AUTHOR -> Findomain

cd ${DIR}
wget https://github.com/Findomain/Findomain/releases/download/8.2.1/findomain-linux.zip
unzip -d findomain-linux findomain-linux.zip
${SMK_SUDO} cp -vf ${DIR}/findomain-linux/findomain /usr/local/bin/findomain
${SMK_SUDO} chmod +x /usr/local/bin/findomain
