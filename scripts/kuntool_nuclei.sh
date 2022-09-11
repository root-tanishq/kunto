#!/bin/bash
# URL -> https://github.com/projectdiscovery/nuclei
# AUTHOR -> Project Discovery

function tool_install() {
${SMK_SUDO} ${GO_PATH} install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
export PATH=$PATH:~/go/bin
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
