# debian安装helix


## 下载最新版本helix
```
wget https://github.com/helix-editor/helix/releases/download/25.07.1/helix-25.07.1-x86_64-linux.tar.xz
tar -xf helix*
rm -rf helix-25.07.1-x86_64-linux.tar.xz
cd helix*
mkdir ~/.config
mkdir ~/.config/helix
sudo mv hx /usr/local/bin
sudo mv runtime/  ~/.config/helix/
```

## 配置runtime
在.bashrc中加入
```
HELIX_RUNTIME=~/.config/helix/runtime
```


