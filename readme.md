# debian安装所需软件

```bash
sudo apt update
sudo apt upgrade
sudo apt install -y git ffmpeg bash-completion vim curl unzip wget yt-dlp ssh clang build-essential hx
```


# 安装rust
``` bash 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install pkg-config libssl-dev
```

# 安装数据库
```bash
sudo apt install postgresql postgresql-contrib -y
```



