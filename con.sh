cd /mycollect
unzip mycollect.zip
rm -rf mycollect.zip
cat << EOF > /apt/config1.json
{
 "inbounds": [
    {
      "port": 23323,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "$UUID",
            "alterId": 0
          }
        ],
        "disableInsecureEncryption": true
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "$WS_PATH"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF
envsubst '\$UUID,\$WS_PATH' < /apt/config1.json > /apt/config.json
/apt/web -config /apt/config.json &
#echo /mycollect/index.html
#cat /mycollect/index.html
#rm -rf /etc/nginx/sites-enabled/default
#/bin/bash -c "envsubst '\$PORT,\$WS_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
