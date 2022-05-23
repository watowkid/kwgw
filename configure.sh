config_path=$PROTOCOL"_ws_tls.json"
install -m 755 /apt/v2ray /usr/local/bin/v2ray
install -m 755 /apt/v2ctl /usr/local/bin/v2ctl
转换config文件的模式，取消依赖 v2ctl 
install -d /usr/local/etc/v2ray
/usr/local/bin/v2ctl config /apt/config.json > /usr/local/etc/v2ray/config.pb
# 搭建测速页面
mkdir /opt/test
cd /opt/test
dd if=/dev/zero of=100mb.bin bs=100M count=1
dd if=/dev/zero of=10mb.bin bs=10M count=1
# 运行v2ray
/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.pb &
# 运行ngix
nginx -g 'daemon off;'
