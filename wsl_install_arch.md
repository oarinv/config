sl# 在WSL2中安装Arch Linux

本文介绍了在Windows Subsystem for Linux 2 (WSL2) 中安装Arch Linux的步骤。以下是详细的操作说明：

## 步骤1：打包rootfs

1. 在已经安装的Linux系统中执行以下命令，从清华源下载Arch Linux的bootstrap镜像文件：

   ```
   wget https://mirrors.tuna.tsinghua.edu.cn/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.gz
   ```

2. 解压tar文件：

   ```
   tar -xpvf archlinux-bootstrap-x86_64.tar.gz
   ```

3. 重新压缩为archlinux-bootstrap.tar文件：

   ```
   tar -cpvf archlinux-bootstrap.tar -C root.x86_64 .
   ```

4. 将archlinux-bootstrap.tar文件移动到适当的位置（例如D盘）：

   ```
   mv archlinux-bootstrap.tar /mnt/d
   ```

## 步骤2：导入为Arch WSL2发行版

1. 打开Windows PowerShell或命令提示符。

2. 使用以下命令导入archlinux-bootstrap.tar作为Arch WSL2发行版（wsl --import 发行版名称 安装位置  tar文件所在位置）：

   ```
   wsl --import Arch .\  .\archlinux-bootstrap.tar
   ```

## 步骤3：配置pacman

1. 在WSL2中打开终端。

2. 执行以下命令初始化pacman密钥并更新系统：

   ```
   pacman-key --init && pacman-key --populate
   pacman -Sy archlinux-keyring && pacman -Su
   ```

## 步骤4：配置systemd

1. 在WSL2中打开终端。

2. 执行以下命令将systemd配置为WSL的init系统：

   ```
   echo -e "[boot]\nsystemd=true" | sudo tee -a /etc/wsl.conf
   ```

## 步骤5：全局配置（可选）

1. 在Windows上的%user文件夹下创建.wslconfig文件。

2. 根据需要，可以在.wslconfig文件中自定义内核路径：

   ```
   [wsl]
   kernel='path'
   ```

