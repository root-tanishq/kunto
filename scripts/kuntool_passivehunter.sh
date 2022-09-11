#!/bin/bash
# URL to Repository => https://github.com/devanshbatham/Passivehunter
# Author => devanshbatham
if [[ ! -e $(which git) ]];then
  ${SMK_SUDO} apt install git -y
fi
cd ${DIR}
# Cloning Repository
git clone https://github.com/devanshbatham/Passivehunter
cd Passivehunter
# Main tool installation
function tool_install() {
${SMK_SUDO} ${PYTHON_PATH} -m pip install -r ${DIR}/Passivehunter/requirements.txt
${SMK_SUDO} ln -s ${DIR}/Passivehunter/passivehunter.py /usr/local/bin/passivehunter
${SMK_SUDO} chmod +x /usr/local/bin/passivehunter
}
if [[ -e $(which python) && $(python --version | awk '{print $2}' | awk -F'.' '{print $1}') = "3" && -e $(which pip) ]];then
  export PYTHON_PATH=$(which python);
  tool_install
elif [[ -e $(which python3) && $(python3 --version | awk '{print $2}' | awk -F'.' '{print $1}') = "3" && -e $(which pip3) ]];then
  export PYTHON_PATH=$(which python3);
  tool_install
else
  ${SMK_SUDO} apt install python python-pip -y
  ${SMK_SUDO} apt install python3 python3-pip -y
  if [[ -e $(which python) && $(python --version | awk '{print $2}' | awk -F'.' '{print $1}') = "3" && -e $(which pip) ]];then
    export PYTHON_PATH=$(which python);
    tool_install
  elif [[ -e $(which python3) && $(python3 --version | awk '{print $2}' | awk -F'.' '{print $1}') = "3" && -e $(which pip3) ]];then
    export PYTHON_PATH=$(which python3);
    tool_install
  else
    echo "Issue in python"
  fi
fi
