#!/bin/bash
# URL -> https://github.com/ffuf/ffuf
# AUTHOR -> ffuf

function tool_install() {
${GO_PATH} install github.com/ffuf/ffuf@latest
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
