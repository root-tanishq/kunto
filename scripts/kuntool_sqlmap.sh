#!/bin/bash
# URL -> https://github.com/sqlmapproject/sqlmap
# AUTHOR -> Sqlmapproject
if [[ ! -e $(which git) ]];then
  ${SMK_SUDO} apt install git -y
fi
cd ${DIR}

# Cloning repository
git clone --depth 1 https://github.com/sqlmapproject/sqlmap
${SMK_SUDO} ln -s ${DIR}/sqlmap/sqlmap.py /usr/local/bin/sqlmap
${SMK_SUDO} chmod +x /usr/local/bin/sqlmap