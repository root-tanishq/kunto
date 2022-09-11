#!/bin/bash
# URL -> https://github.com/OWASP/Amass
# AUTHOR -> OWASP

cd ${DIR}
wget https://github.com/OWASP/Amass/releases/download/v3.19.3/amass_linux_$(dpkg --print-architecture).zip
unzip amass_linux_$(dpkg --print-architecture).zip
${SMK_SUDO} cp -vf ${DIR}/amass_linux_$(dpkg --print-architecture)/amass /usr/local/bin/amass
${SMK_SUDO} chmod +x /usr/local/bin/amass
