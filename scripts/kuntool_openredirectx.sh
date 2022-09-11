#!/bin/bash
# URL to Repository => https://github.com/devanshbatham/OpenRedireX
# Author => devanshbatham
if [[ ! -e $(which git) ]];then
  ${SMK_SUDO} apt install git -y
fi
cd ${DIR}
# Cloning Repository
git clone https://github.com/devanshbatham/OpenRedireX
cd OpenRedireX
# Main tool installation
${SMK_SUDO} ln -s ${DIR}/OpenRedireX/openredirex.py /usr/local/bin/openredirex
${SMK_SUDO} chmod +x /usr/local/bin/openredirex
