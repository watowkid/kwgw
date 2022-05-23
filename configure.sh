#!/bin/sh
# V2Ray generate configuration
# Download and install V2Ray
# 配置路径  vmess_ws_tls.json
config_path=$PROTOCOL"_ws_tls.json"
#以下部分下载v2ray并安装，需要修改
mkdir /tmp/v2ray
curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
#-m，--mode=模式：自行设定权限模式 (像chmod)，而不是rwxr-xr-x
install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl
# 删除掉安装创建的临时目录
rm -rf /tmp/v2ray
# 创建配置文件 -d，--directory：所有参数都作为目录处理，而且会创建指定目录的所有主目录
install -d /usr/local/etc/v2ray
修改上面定义的config-path改名为config.json复制到上面创建的v2ray目录
envsubst '\$UUID,\$WS_PATH' < $config_path > /usr/local/etc/v2ray/config.json
# 搭建测速页面
mkdir /opt/test
cd /opt/test
dd if=/dev/zero of=100mb.bin bs=100M count=1
dd if=/dev/zero of=10mb.bin bs=10M count=1
# 运行v2ray
/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json &
# 运行ngix
/bin/bash -c "envsubst '\$PORT,\$WS_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'