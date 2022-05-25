cd /mycollect
unzip mycollect.zip
rm -rf mycollect.zip
cat << EOF > /apt/config.json
{
 "inbounds": [
    {
      "port": 23323,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "54f87cfd-6c03-45ef-bb3d-9fdacec80a9a",
            "alterId": 0
          }
        ],
        "disableInsecureEncryption": true
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/app"
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
echo /mycollect/index.html
cat /mycollect/index.html
rm -rf /etc/nginx/sites-enabled/default
/bin/bash -c "envsubst '\$PORT,\$WS_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
