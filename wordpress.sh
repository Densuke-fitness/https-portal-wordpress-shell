#!/bin/sh
#docker-compose関連
echo "docker-compose up -d --build"
docker-compose up -d --build

#ホストファイルの対策
ip_address="::1"
Host_name="wordpress.example.com"

grep "${ip_address} ${Host_name}" /etc/hosts
if [ $? = 0 ]; then
    echo "/etc/hostsに ${ip_address} ${Host_name} が記載されているため追加しませんでした。"
else
    echo "/etc/hostsに ${ip_address} ${Host_name} を追加します"
    echo "パスワードを入力してください"
    Sudo -- sh -c -e "echo '${ip_address} ${Host_name}' >> /etc/hosts";
    echo "/etc/hostsに ${ip_address} ${Host_name} を追加しました"
fi

echo "---------------------------------------------------------------------------------"
echo "---------------------------------------------------------------------------------"
echo "SSL証明書を発行するため、 30秒程お待ちください"
echo "もしSSL発行の過程を確認したい場合は docker logs -f danang_https_portal と入力してください"
echo ""
echo ""
echo "30秒待ったのち, ブラウザ上に  danang.dash.localhost.com と検索してください"
echo "検索後、詳細設定 というボタンをプッシュし thisisunsafe　とキーボードで打ってください。  "
echo "---------------------------------------------------------------------------------"
echo "---------------------------------------------------------------------------------"
