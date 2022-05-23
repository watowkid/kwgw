echo '{
{
 "inbounds": [
    {
      "port": 23323,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "",
            "alterId": 0
          }
        ],
        "disableInsecureEncryption": true
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": ""
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
}' > heroku.json
