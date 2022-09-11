#!/bin/bash
# URL -> https://github.com/projectdiscovery/nuclei
# AUTHOR -> Project Discovery

function tool_install() {
${GO_PATH} install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
