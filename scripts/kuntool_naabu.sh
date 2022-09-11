#!/bin/bash
# URL -> https://github.com/projectdiscovery/naabu
# AUTHOR -> Project Discovery

function tool_install() {
${SMK_SUDO} apt install -y libpcap-dev
${GO_PATH} install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
