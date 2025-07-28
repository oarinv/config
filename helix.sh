#!/bin/bash

# 确保脚本始终在用户主目录下执行
echo "正在切换到用户主目录 (~)..."
cd ~
echo "当前目录: $(pwd)"

# 定义 Helix 版本和文件名，方便管理
HELIX_VERSION="25.07.1"
HELIX_ARCHIVE="helix-${HELIX_VERSION}-x86_64-linux.tar.xz"
HELIX_DIR="helix-${HELIX_VERSION}-x86_64-linux" # 解压后的目录名

echo "正在下载最新版本的Helix (${HELIX_VERSION})..."
wget "https://github.com/helix-editor/helix/releases/download/${HELIX_VERSION}/${HELIX_ARCHIVE}"

echo "正在解压文件..."
tar -xf "${HELIX_ARCHIVE}"

echo "正在清理下载的压缩包..."
rm -rf "${HELIX_ARCHIVE}"

echo "正在进入解压后的目录..."
cd "${HELIX_DIR}"

echo "正在创建Helix配置目录..."
mkdir -p ~/.config/helix

echo "正在将hx可执行文件移动到/usr/local/bin..."
sudo mv hx /usr/local/bin

echo "正在将runtime目录移动到Helix配置目录..."
sudo mv runtime/ ~/.config/helix/

# 返回主目录，以便清理解压后的安装目录
cd ~

echo "正在清理解压后的安装目录 (${HELIX_DIR})..."
rm -rf "${HELIX_DIR}"

echo "正在配置HELIX_RUNTIME环境变量..."
echo 'export HELIX_RUNTIME="$HOME/.config/helix/runtime"' >> ~/.bashrc

echo "请运行 'source ~/.bashrc' 或重新启动终端以使配置生效。"
echo "Helix安装完成！您现在可以通过在终端中输入 'hx' 来启动Helix编辑器。"
