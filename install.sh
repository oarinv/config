#!/bin/bash

# 安装所需软件包
sudo apt update
sudo apt upgrade
sudo apt install -y git ffmpeg bash-completion vim curl unzip wget  yt-dlp ssh clang build-essential 

# 安装rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo apt install libssl-dev
