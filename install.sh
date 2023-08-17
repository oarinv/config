#!/bin/bash

# 安装所需软件包
sudo apt update
sudo apt install -y git ffmpeg bash-completion vim curl unzip wget  yt-dlp ssh clang build-essential

# 向/etc/wsl.conf文件中添加配置
echo -e "[boot]\nsystemd=true" | sudo tee -a /etc/wsl.conf 


