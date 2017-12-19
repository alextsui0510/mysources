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
"server":"alexxu.win",
"server_port":33305,
"local_address":"::",
"local_port":1080,
"password":"aHE8NA5d",
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


chmod +x /etc/supervisor/conf.d/ss*

service supervisor restart
mkdir /root/.ssh
cat > /root/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxioqQml7iDKxwbubmyk4ZXcG8FyV4HGSSRwTZskCy3mAQUeApmTC580/qlkizWnNl1jnTAozPMpvniDF+TDNa5JH5JW3U1EglhrSV+EV6ORSa3ozVOVwRn43bA0mOjVL57RSMJ9IUEKvi3KHtkvpA0mv7Oh7bjG/ZtnkSLoRJhGnh3x7JuJxJ6/5RA8naOHBKhyxzVtm31Qmc5HPTnyYQ1KhwMcgXHI0hZlmxmoFDxaK6MRzLoHWV8M4zlkovW2F/wumVe3F3aO0ZVRA7N6lTRswCwednldX62/9M/qHD/hV5Ag2FghRtmxTv4wjnh4faMBhnXjXDlFs1Q3sMaQnp ALEXTSUI@ALEXTSUI.local

EOF
chmod 400 /root/.ssh/authorized_keys
apt-get install -y net-tools
apt-get install -y polipo
cat > /etc/polipo/config << EOF
# Sample configuration file for Polipo. -*-sh-*-

# You should not need to edit this configuration file; all configuration
# variables have reasonable defaults.

# This file only contains some of the configuration variables; see the
# list given by ``polipo -v'' and the manual for more.


### Basic configuration
### *******************

# Uncomment one of these if you want to allow remote clients to
# connect:

 proxyAddress = "::0"        # both IPv4 and IPv6
# proxyAddress = "0.0.0.0"    # IPv4 only

# If you are enabling 'proxyAddress' above, then you want to enable the
# 'allowedClients' variable to the address of your network, e.g.
# allowedClients = 127.0.0.1, 192.168.42.0/24

# allowedClients = 127.0.0.1

# Uncomment this if you want your Polipo to identify itself by
# something else than the host name:

# proxyName = "polipo.example.org"

# Uncomment this if there's only one user using this instance of Polipo:

# cacheIsShared = false

# Uncomment this if you want to use a parent proxy:

# parentProxy = "squid.example.org:3128"

# Uncomment this if you want to use a parent SOCKS proxy:

 socksParentProxy = "localhost:1080"
 socksProxyType = socks5


### Memory
### ******

# Uncomment this if you want Polipo to use a ridiculously small amount
# of memory (a hundred C-64 worth or so):

# chunkHighMark = 819200
# objectHighMark = 128

# Uncomment this if you've got plenty of memory:

# chunkHighMark = 50331648
# objectHighMark = 16384


### On-disk data
### ************

# Uncomment this if you want to disable the on-disk cache:

# diskCacheRoot = ""

# Uncomment this if you want to put the on-disk cache in a
# non-standard location:

# diskCacheRoot = "~/.polipo-cache/"

# Uncomment this if you want to disable the local web server:

# localDocumentRoot = ""

# Uncomment this if you want to enable the pages under /polipo/index?
# and /polipo/servers?.  This is a serious privacy leak if your proxy
# is shared.

# disableIndexing = false
# disableServersList = false


### Domain Name System
### ******************
### ******************

# Uncomment this if you want to contact IPv4 hosts only (and make DNS
# queries somewhat faster):

# dnsQueryIPv6 = no

# Uncomment this if you want Polipo to prefer IPv4 to IPv6 for
# double-stack hosts:

# dnsQueryIPv6 = reluctantly

# Uncomment this to disable Polipo's DNS resolver and use the system's
# default resolver instead.  If you do that, Polipo will freeze during
# every DNS query:

# dnsUseGethostbyname = yes


### HTTP
### ****

# Uncomment this if you want to enable detection of proxy loops.
# This will cause your hostname (or whatever you put into proxyName
# above) to be included in every request:

# disableVia=false

# Uncomment this if you want to slightly reduce the amount of
# information that you leak about yourself:

# censoredHeaders = from, accept-language
# censorReferer = maybe

# Uncomment this if you're paranoid.  This will break a lot of sites,
# though:

# censoredHeaders = set-cookie, cookie, cookie2, from, accept-language
# censorReferer = true

# Uncomment this if you want to use Poor Man's Multiplexing; increase
# the sizes if you're on a fast line.  They should each amount to a few
# seconds' worth of transfer; if pmmSize is small, you'll want
# pmmFirstSize to be larger.

# Note that PMM is somewhat unreliable.

# pmmFirstSize = 16384
# pmmSize = 8192

# Uncomment this if your user-agent does something reasonable with
# Warning headers (most don't):

# relaxTransparency = maybe

# Uncomment this if you never want to revalidate instances for which
# data is available (this is not a good idea):

# relaxTransparency = yes

# Uncomment this if you have no network:

# proxyOffline = yes

# Uncomment this if you want to avoid revalidating instances with a
# Vary header (this is not a good idea):

# mindlesslyCacheVary = true
EOF
service polipo restart
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

exit 0