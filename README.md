# Kunto
> Work In Progress - Not Ready to Use Completely 
> Want to help ping me on https://twitter.com/root_tanishq

Kunto is a bash script which execute github-pages hosted bash script for installing tools fast instead of visiting many repos by yourself , Kunto will do it for you

> Note: The tool is only tested over ubuntu ,although it will work perfectly with other debian distros 

## INSTALLATION

> Run the following command in the terminal
```bash
bash -c "$(curl -fsSl https://root-tanishq.github.io/kunto/Install.sh)"
```

![kunto install](https://github.com/root-tanishq/kunto/blob/main/images/install_kunto.png)

## USAGE

### Install

Will Install the tool if the installation script is present on the github-pages.

```
kunto install <Script name shown from search command of kunto>
```

### Search

Will search for tools present on github-pages.

```
kunto search subl
``` 

![kunto search](https://github.com/root-tanishq/kunto/blob/main/images/kunto_search.png)

### Update

Update the kunto script if there are any update availables.

```
kunto update
```

## Script Developing Guide

If you want to create an script for kunto , Please create a bash file with all the installation commands required by the tool for any command which needs to be executed please use `${SMK_SUDO}` instead of sudo

- for python version , please use the below code for solving issues regarding python version and binary name issues
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
- NAMING FORMAT - All the scripts should be placed in `scripts` folder with the following NAMING FORMAT `kuntool_<TOOL NAME>.sh` 


## READ BEFORE FORK

If you want to fork and create your own scripts make sure to change the `AUTHOR` in kunto scripts for loading scripts from your FORK.

## About
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
