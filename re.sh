# 首先，找到alist程序的进程ID
pid=$(ps aux | grep -v grep | grep alist | awk '{print $2}')

# 如果没有找到进程ID，说明alist程序没有运行
if [ -z "$pid" ]; then
    echo "alist程序没有运行"
    exit 1
fi

# 然后，使用kill命令重启alist程序
echo "重启alist程序，进程ID: $pid"
kill $pid

# 检查alist程序是否已经重启
while [ -e /proc/$pid ]; do
    sleep 1
done

echo "alist程序已成功重启"
