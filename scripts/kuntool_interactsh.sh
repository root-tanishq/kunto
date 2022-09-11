#!/bin/bash
# URL -> https://github.com/projectdiscovery/interactsh
# AUTHOR -> Project Discovery

function tool_install() {
${GO_PATH} install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
