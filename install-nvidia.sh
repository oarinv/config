#!/bin/bash

set -e

echo "🔧 正在添加 contrib 和 non-free 软件源..."

# 备份现有 sources.list
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# 重写 sources.list
cat <<EOF > /etc/apt/sources.list
deb http://ftp.cn.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src http://ftp.cn.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware

deb http://ftp.cn.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src http://ftp.cn.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
EOF

echo "✅ 软件源已更新，开始刷新包列表..."
apt update

echo "📦 正在安装内核头文件、DKMS 和 NVIDIA 驱动..."
apt install -y linux-headers-$(uname -r) build-essential dkms nvidia-driver

echo "🚫 屏蔽开源 nouveau 驱动..."
cat <<EOF > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF

update-initramfs -u

echo "✅ 所有步骤完成。请重启系统以应用 NVIDIA 驱动。"

echo "🔁 是否现在重启？[Y/n]"
read answer
if [[ "$answer" =~ ^[Yy]$ || -z "$answer" ]]; then
    reboot
else
    echo "⏳ 请稍后手动执行：sudo reboot"
fi
