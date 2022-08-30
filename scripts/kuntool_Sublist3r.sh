#!/bin/bash
# URL to Repository => https://github.com/aboul3la/Sublist3r
# Author => Ahmed Aboul-Ela
${SMK_SUDO} apt install git python python3 python-pip python3-pip -y 2>/dev/null
cd ${DIR}
git clone https://github.com/aboul3la/Sublist3r.git
${SMK_SUDO} python -m pip install -r ${DIR}/Sublist3r/requirements.txt 2>/dev/null
${SMK_SUDO} python3 -m pip install -r ${DIR}/Sublist3r/requirements.txt 2>/dev/null
${SMK_SUDO} python ${DIR}/Sublist3r/setup.py install 2>/dev/null
${SMK_SUDO} python3 ${DIR}/Sublist3r/setup.py install 2>/dev/null
echo -e "\033[0;0m[\033[0;32m❯\033[0;0m] $2 Installation done";
