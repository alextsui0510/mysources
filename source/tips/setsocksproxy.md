Set the Mac OS X SOCKS proxy on the command line

a.k.a. what to do when your ISP starts blocking sites :(

Set the SOCKS proxy to local SSH tunnel with zsh

alias cproxy-start='networksetup -setsocksfirewallproxy "插線網路" localhost 1080'
alias pproxy-start='networksetup -setsocksfirewallproxy "插線網路" localhost 8090'
alias nproxy-start='networksetup -setsocksfirewallproxy "插線網路" localhost 8443'
alias proxy-stop='networksetup -setsocksfirewallproxystate "插線網路" off'
