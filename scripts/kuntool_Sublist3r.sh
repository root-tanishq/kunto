#!/bin/bash
# URL to Repository => https://github.com/aboul3la/Sublist3r
# Author => Ahmed Aboul-Ela
${SMK_SUDO} apt install git python python3 python-pip python3-pip -y 2>/dev/null
cd ${DIR}
# Cloning Repository
git clone https://github.com/aboul3la/Sublist3r.git
# Main tool installation
function tool_install() {
${SMK_SUDO} ${PYTHON_PATH} -m pip install -r ${DIR}/Sublist3r/requirements.txt 2>/dev/null
${SMK_SUDO} ${PYTHON_PATH} ${DIR}/Sublist3r/setup.py install 2>/dev/null
}
if [[ -e $(which python) && $(python --version | awk '{print $2}' | awk -F'.' '{print $1}') = ]];then
  export PYTHON_PATH=$(which python);
  tool_install
elif [[ -e $(which python3) && $(python3 --version | awk '{print $2}' | awk -F'.' '{print $1}') = ]];then
  export PYTHON_PATH=$(which python3);
  tool_install
fi
