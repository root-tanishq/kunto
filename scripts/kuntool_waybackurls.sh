#!/bin/bash
# URL -> https://github.com/tomnomnom/waybackurls
# AUTHOR -> Tomnomnom

function tool_install() {
${GO_PATH} install github.com/tomnomnom/waybackurls@latest
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
