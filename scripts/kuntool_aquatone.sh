#!/bin/bash
# URL -> https://github.com/michenriksen/aquatone
# AUTHOR -> michenriksen

cd ${DIR}
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_$(dpkg --print-architecture)_1.7.0.zip
unzip -d "aquatone" aquatone_linux_$(dpkg --print-architecture)_1.7.0.zip
${SMK_SUDO} cp -vf ${DIR}/aquatone/aquatone /usr/local/bin/aquatone
${SMK_SUDO} chmod +x /usr/local/bin/aquatone
