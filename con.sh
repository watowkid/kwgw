install -m 755 /apt/v2ray /usr/local/bin/v2ray
install -m 755 /apt/v2ctl /usr/local/bin/v2ctl
install -d /usr/local/etc/v2ray
/usr/local/bin/v2ctl config /usr/local/etc/v2ray/config.json > /usr/local/etc/v2ray/config.pb
rm -rf /apt
mkdir /opt/test
cd /opt/test
dd if=/dev/zero of=100mb.bin bs=100M count=1
dd if=/dev/zero of=10mb.bin bs=10M count=1
/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.pb &
#/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json &
/bin/bash -c "envsubst '\$PORT,\$WS_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
