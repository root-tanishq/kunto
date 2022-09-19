#!/bin/bash
# URL to Repository => https://github.com/root-tanishq/userefuzz
# Author => root-tanishq

function tool_install() {
${SMK_SUDO} ${PYTHON_PATH} -m pip install userefuzz
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
