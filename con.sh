cat << EOF > /apt/config.json
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
/apt/web -config /apt/config.json &
/bin/bash -c "envsubst '\$PORT,\$WS_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
