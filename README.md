# Kunto
> Work In Progress - Not Ready to Use Completely 


> Want to help ping me on https://twitter.com/root_tanishq

Kunto is a bash tool created for the purpose of installing tools fast. Kunto uses bash scripts hosted on github-pages through which the tools which are not available to REPOS can be installed using kunto if the script for the tool exists.

> Note: The tool is only tested over ubuntu ,although it will work perfectly with other debian distros 

## INSTALLATION

> Run the following command in the terminal
```bash
bash -c "$(curl -fsSl https://root-tanishq.github.io/kunto/Install.sh)"
```

![kunto install](https://raw.githubusercontent.com/root-tanishq/kunto/main/images/install_kunto.png)

## USAGE

### Install

Install subcommnad will fetch the script of the tool and installed into your system if the script exists.

```
kunto install <Script name shown from search command of kunto>
```

### Search

Search subcommand will show the available scripts with similar name provided as input.

```
kunto search subl
``` 

![kunto search](https://raw.githubusercontent.com/root-tanishq/kunto/main/images/kunto_search.png)

### Update

Update subcommand will update `/usr/local/bin/kunto` file to the latest version from the AUTHORS kunto github repo.

```
kunto update
```

## Script Developing Guide

Kunto uses bash in the background to install tools. Simple bash script which matches with the *template* and follows the below instructions will work fine with kunto
- SUDO
Use `${SMK_SUDO}` Variable before any command which requires superuser access.
For EG:- 
```bash
${SMK_SUDO} apt install git -y
```

- Python
If the tool is based on python please make sure to use the below code to help kunto use the right *python* binary and version.

```bash
function tool_install() {
${SMK_SUDO} ${PYTHON_PATH} <python command>
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
```

- Go
If the tool is based on Go please make sure to use the below code to help kunto finds if the *golang* is installed or not.
```bash 
function tool_install() {
${SMK_SUDO} ${GO_PATH} <Go Command>
}
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
```

- NAMING FORMAT 
kunto uses a naming format to find and install scripts which is  `kuntool_<TOOL NAME>.sh` . Please place all the scripts in `scripts` folder of the kunto repository.

- Template
Please use the below template for ease of creating the scripts.
```bash
#!/bin/bash
# URL to Repository => <GITHUB OF THE TOOL>
# Author => <TOOL CREATOR>

# If there is requirement to clone repo please use the below code to verify is git installed or not
if [[ ! -e $(which git) ]];then
  ${SMK_SUDO} apt install git -y
fi
cd ${DIR}



# Cloning Repository
git clone # <GITHUB LINK OF THE TOOL>
# cd Folder --------------------> NAVIGATIONAL COMMANDS




# Main tool installation
function tool_install() {
${SMK_SUDO} ${PYTHON_PATH} # Python Command
${SMK_SUDO} ${GO_PATH}     # Go Command
}



# If the tool is build on python please make sure to use the below code otherwise remove it
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




# If the tool is build on GO please make sure to use the below code otherwise remove it
if [[ ! -e $(which go) ]];then
  ${SMK_SUDO} apt install golang -y
  export GO_PATH=$(which go)
  tool_install
else 
  export GO_PATH=$(which go)
  tool_install
fi
```

## READ BEFORE FORK

If you want to fork and create your own scripts make sure to change the `AUTHOR` in kunto scripts for loading scripts from your FORK.

## Author
Hi I am Tanishq AKA Kun I created the tool to make the installation of the tools which are not directly included in the repo.

## LICENSE
```MIT
MIT License

Copyright (c) 2022 ⛩️kun

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
