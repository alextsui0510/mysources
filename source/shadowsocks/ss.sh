#!/bin/sh
apt-get -y update
apt-get -y upgrade
apt-get install -y git wget zsh python-pip python-M2Crypto openssl


pip install --upgrade pip

pip install shadowsocks

pip install --upgrade shadowsocks

mkdir /etc/shadowsocks/

cat > /etc/shadowsocks/config.json << EOF
{
"server":"::",
"server_port":8388,
"local_address":"::",
"local_port":1080,
"password":"alohalex",
"timeout":600,
"method":"rc4-md5"
}
EOF


apt-get install -y supervisor

cat > /etc/supervisor/conf.d/sslocal.conf << EOF
[program:sslocal]
command=sslocal -c /etc/shadowsocks/config.json
autorestart=true
user=root
EOF
cat > /etc/supervisor/conf.d/ssserver.conf << EOF
[program:ssserver]
command=ssserver -c /etc/shadowsocks/config.json
autorestart=true
user=root
EOF

chmod +x /etc/supervisor/conf.d/ss*

service supervisor restart

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

exit 0
