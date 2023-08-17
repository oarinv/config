# WSL2  安装 ArchLinux 
打包 rootfs
ArchLinux 的镜像仓储中，会保存一份 archlinux-bootstrap-x86_64.tar.gz 文件，是当前最新版本的 bootstrap tar镜像。我们可以通过 tar/bsdtar 命令将其转换为 WSL 所需的 rootfs 文件。

在已有的 WSL2 发行版中，执行下述命令

```
w get https://mirrors.tuna.tsinghua.edu.cn/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.gz
https://wiki.archlinux.org/title/Full_system_backup_with_tar
tar -xpvf archlinux-bootstrap-x86_64.tar.gz
# 重新压缩为archlinux-bootstrap.tar文件
tar -cpvf archlinux-bootstrap.tar -C root.x86_64 .
# 移动archlinux-bootstrap.tar到D盘
mv archlinux-bootstrap.tar /mnt/d
```

在windwos中导入 archlinux-bootstrap.tar 为 Arch WSL2发行版
wsl --import Arch .\  .\archlinux-bootstrap.tar

# 配置 pacman

```
pacman-key --init && pacman-key --populate
pacman -Sy archlinux-keyring && pacman -Su
```

# 配置 systemd
```
echo -e "[boot]\nsystemd=true" | sudo tee -a /etc/wsl.conf
```