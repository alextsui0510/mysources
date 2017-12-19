#!/bin/sh
apt-get update
apt-get upgrade
apt-get install -y python-pip python-M2Crypto openssl

pip install --upgrade pip

apt-get install -y python-setuptools
apt-get install -y libssl-dev gcc swig python-dev autoconf libtool
pip install gevent
pip install --upgrade  M2Crypto


pip install shadowsocks

pip install --upgrade shadowsocks

mkdir /etc/shadowsocks/

cat > /etc/shadowsocks/config.json << EOF
{
"server":"::1",
"server_port":80,
"local_address":"0.0.0.0",
"local_port":443,
"password":"alohalex",
"timeout":600,
"method":"aes-256-cfb"
}
EOF

pip install gfwlist2pac

apt-get install -y Supervisor

cat > /etc/supervisor/conf.d/ss-local.conf << EOF
[program:ss-local]
command=sslocal -c /etc/shadowsocks/config.json
autorestart=true
user=root
EOF

cat > /etc/supervisor/conf.d/ss-server.conf << EOF
[program:ss-server]
command=ssserver -c /etc/shadowsocks/config.json
autorestart=true
user=root
EOF

chmod +x /etc/supervisor/conf.d/ss*


service supervisor start
supervisorctl reload

cat > /etc/ssh/sshd_config << EOF
# Package generated configuration file
# See the sshd_config(5) manpage for details

# What ports, IPs and protocols we listen for
Port 22
# Use these options to restrict which interfaces/protocols sshd will bind to
Port 10322
#ListenAddress ::
#ListenAddress 0.0.0.0
Protocol 2
# HostKeys for protocol version 2
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
#Privilege Separation is turned on for security
UsePrivilegeSeparation yes

# Lifetime and size of ephemeral version 1 server key
KeyRegenerationInterval 3600
ServerKeyBits 1024

# Logging
SyslogFacility AUTH
LogLevel INFO

# Authentication:
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes

RSAAuthentication yes
PubkeyAuthentication yes
#AuthorizedKeysFile	%h/.ssh/authorized_keys

# Don't read the user's ~/.rhosts and ~/.shosts files
IgnoreRhosts yes
# For this to work you will also need host keys in /etc/ssh_known_hosts
RhostsRSAAuthentication no
# similar for protocol version 2
HostbasedAuthentication no
# Uncomment if you don't trust ~/.ssh/known_hosts for RhostsRSAAuthentication
#IgnoreUserKnownHosts yes

# To enable empty passwords, change to yes (NOT RECOMMENDED)
PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no

# Change to no to disable tunnelled clear text passwords
PasswordAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosGetAFSToken no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes

X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
#UseLogin no

#MaxStartups 10:30:60
#Banner /etc/issue.net

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

Subsystem sftp /usr/lib/openssh/sftp-server

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin yes
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM yes
EOF

apt-get install -y firewalld

cat > /etc/firewalld/services/alex.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>Alex's specila service</short>
  <description>The Alex's special service.</description>
  <port protocol="udp" port="1080"/>
  <port protocol="tcp" port="1080"/>
  <port protocol="tcp" port="20"/>
  <port protocol="tcp" port="10322"/>
</service>
EOF

firewall-cmd --zone=public --prmanent --add-interface=eth0
firewall-cmd --zone=public --permanent --remove-service=ssh
firewall-cmd --zone=public --permanent --add-masquerade
firewall-cmd --zone=public --permanent --add-forward-port=port=1080:proto=tcp:toport=443
firewall-cmd --zone=public --permanent --add-forward-port=port=1080:proto=udp:toport=443
firewall-cmd --zone=public --permanent --add-forward-port=port=20:proto=tcp:toport=22
firewall-cmd --reload
exit 0
