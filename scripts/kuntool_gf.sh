#!/bin/bash
# URL -> https://github.com/tomnomnom/gf
# AUTHOR -> Tomnomnom
if [[ ! -e $(which git) ]];then
  ${SMK_SUDO} apt install git -y
fi
cd ${DIR}

# Cloning Repository
git clone https://github.com/tomnomnom/gf
mkdir ~/.gf
cp -rvf ${DIR}/gf/examples/* ~/.gf/


function tool_install() {
${GO_PATH} install github.com/tomnomnom/gf@latest
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
