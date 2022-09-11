#!/bin/bash
# URL -> https://github.com/tomnomnom/meg
# AUTHOR -> Tomnomnom

function tool_install() {
${GO_PATH} install github.com/tomnomnom/meg@latest
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
