#!/bin/bash
# URL -> https://github.com/lc/gau
# AUTHOR -> lc

function tool_install() {
${GO_PATH} install github.com/lc/gau/v2/cmd/gau@latest
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
