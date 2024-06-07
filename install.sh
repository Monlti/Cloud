rm alist-linux-musl-amd64.tar.gz # 删除当前目录下名为 alist-linux-musl-amd64.tar.gz 的文件，如果存在的话。

wget https://github.com/alist-org/alist/releases/latest/download/alist-linux-musl-amd64.tar.gz # 从 GitHub 下载 alist 的最新版本。

tar -zxvf alist-linux-musl-amd64.tar.gz # 解压刚才下载的 tar.gz 文件。

rm alist-linux-musl-amd64.tar.gz # 再次删除压缩包，因为我们已经解压提取了需要的文件。

chmod +x alist # 给 alist 文件添加执行权限。

echo FROM scratch > Dockerfile # 创建一个新的 Dockerfile 文件，并写入 'FROM scratch'。

echo ADD ./ / >> Dockerfile # 向 Dockerfile 文件添加 'ADD ./' 命令，这会把当前目录下的所有文件和文件夹添加到 Docker 镜像的根目录。

echo EXPOSE 5244 >> Dockerfile # 向 Dockerfile 文件添加 'EXPOSE 5244' 命令，这是告诉 Docker 这个镜像会在运行时监听 5244 端口。

echo CMD [\"/alist\",\"server\",\"--no-prefix\"] >> Dockerfile # 向 Dockerfile 文件添加 'CMD ["/alist","server","--no-prefix"]' 命令，这是 Docker 容器默认执行的命令。

./alist admin # 执行 alist 文件的 admin 命令。

./alist server # 执行 alist 文件的 server 命令，启动 alist 服务器。