# debian安装helix
下载最新版本helix

解压
`tar -xf helix*``
`cd helix*`

移动文件
`sudo mv hx /usr/local/bin`
`sudo mv runtime/  ~/.config/helix/` 

## 配置runtime
在.bashrc中加入
`HELIX_RUNTIME=~/.config/helix/runtime`