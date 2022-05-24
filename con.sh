#/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.pb &
#/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json &
/bin/bash -c "envsubst '\$PORT,\$WS_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
