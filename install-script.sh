#!/bin/bash

# Variables
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LINE_BREAK="-------------------------------------------------"
DIVIDER="- - - - - - - - - - - - - - - - - - - - - - - - -"
ERROR="Error: "
KOHYA_SIZE=8464258703 # Default install sizes for later use
CUDA_SIZE=5234919743
A1111_SIZE=0
FORGE_SIZE=0
COMFY_SIZE=0

# Check if system is Ubuntu based, otherwise it won't work
printf "Install script for Stable diffusion Generating/Training | Created by TheElevatedOne"
printf "\n$LINE_BREAK\n"

if ! grep -q "Ubuntu" <<< "$(uname -a)]"
then
    printf "$ERROR Distribution not based on Ubuntu,\n        Script cannot continue.\n"
    exit 1
fi

# Basic update & Installation of python, libgl1 (which is required in WebUIs),
# google-perftools for TCMalloc, zip and unzip for basic workflow

printf "Updating system"
sudo apt update && sudo apt upgrade -y

printf "\n$LINE_BREAK\n"
printf "Installing required packages"
sudo apt install -y python3 python3-pip python3-venv python3-tk libgl1 google-perftools zip unzip

# Get which software to be installed

printf "\n$LINE_BREAK\n"
read -p "Install WebUI (default = no) [Y/n]: " webui_bool
if [ "${webui_bool^^}" = "Y" ]
then
    printf "$DIVIDER\n"
    read -p "Install A1111 (1) or Forge (2) [1|2; Type number or Just press ENTER for None]: " WEBUI
fi

printf "$LINE_BREAK\n"
read -p "Install ComfyUI (default = no) [Y/n]: " comfy_bool

printf "$LINE_BREAK\n"
read -p "Install Kohya_SS (default = no) [Y/n]: " kohya_bool



