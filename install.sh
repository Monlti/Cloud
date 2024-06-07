# 检查是否存在alist文件，如果不存在则进行下载和解压
if [ ! -f "alist" ]; then
    # 删除当前目录下名为 alist-linux-musl-amd64.tar.gz 的文件，如果存在的话。
    rm alist-linux-musl-amd64.tar.gz

    # 从 GitHub 下载 alist 的最新版本。
    wget https://github.com/alist-org/alist/releases/latest/download/alist-linux-musl-amd64.tar.gz

    # 解压刚才下载的 tar.gz 文件。
    tar -zxvf alist-linux-musl-amd64.tar.gz

    # 再次删除压缩包，因为我们已经解压提取了需要的文件。
    rm alist-linux-musl-amd64.tar.gz

    # 给 alist 文件添加执行权限。
    chmod +x alist
fi

# 检查是否存在Dockerfile文件，如果不存在则创建
if [ ! -f "Dockerfile" ]; then
    # 创建一个新的 Dockerfile 文件，并写入 'FROM scratch'。
    echo FROM scratch > Dockerfile

    # 向 Dockerfile 文件添加 'ADD ./' 命令，这会把当前目录下的所有文件和文件夹添加到 Docker 镜像的根目录。
    echo ADD ./ / >> Dockerfile

    # 向 Dockerfile 文件添加 'EXPOSE 5244' 命令，这是告诉 Docker 这个镜像会在运行时监听 5244 端口。
    echo EXPOSE 5244 >> Dockerfile

    # 向 Dockerfile 文件添加 'CMD ["/alist","server","--no-prefix"]' 命令，这是 Docker 容器默认执行的命令。
    echo CMD [\"/alist\",\"server\",\"--no-prefix\"] >> Dockerfile
fi

# 执行 alist 文件的 admin 命令。
./alist admin

# 执行 alist 文件的 server 命令，启动 alist 服务器。
./alist server