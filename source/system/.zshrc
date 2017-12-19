# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my"
#./.wtmpclean.sh
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
#export GEMPATH=$root/.rbenv/versions/2.1.6-github1/bin:$GEMPATH
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
#export LANG="zh_CN.UTF-8"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.

# You may uncomment the following lines if you want `ls' to be colorized:
alias sdn='shutdown'
alias sdrn='shutdown -r now'
alias rbt='reboot'
export TERM="xterm-256color"
#export TERM="vt100"
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias grep='grep --color'

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias clc='clear all'
alias vi='vim'
alias ag='apt-get'
alias agu="apt-get update"
alias agug="apt-get upgrade"
alias agi='apt-get install'
alias agr='apt-get remove'
alias agar='apt-get autoremove'
alias agc="apt-get clean"
alias agac="apt-get autoclean"
alias np='netstat -lnp'
alias npp='netstat -anp'
alias npg='netstat -lnp | grep --color'
alias npgg='netstat -anp | grep --color'
alias nsv='netstat -lnp | grep --color ss-server'
alias nsvv='netstat -anp | grep --color ss-server'
alias nsl='netstat -lnp | grep --color ss-local'
alias nsll='netstat -anp | grep --color ss-local'
alias nssd="netstat -anp | grep --color python"
alias nss="netstat -lnp | grep --color python"
alias fcd='firewall-cmd'
alias fcdla='firewall-cmd --list-all'
alias fcdrd='firewall-cmd --reload'
alias fcdp='firewall-cmd --zone=public'
alias fcdpp='firewall-cmd --permanent --zone=public'
alias fcdd='firewall-cmd --zone=dmz'
alias fcddp='firewall-cmd --permanent --zone=dmz'
alias fcdm='firewall-cmd --zone=myzone'
alias fcdmp='firewall-cmd --zone=myzone --permanent'
alias fcdh='firewall-cmd --help'
alias fcdgs='firewall-cmd --get-services'
alias gpog='git push origin gh-pages'
alias gpom='git push -u origin master'
alias gpoa='git push -u origin alextsui0510-patch-1'
alias gplog='git pull origin gh-pages'
alias gplom='git pull -u origin master'
alias gploa='git pull -u origin alextsui0510-patch-1'
alias mygcm='git commit -m'
alias gcam='git commit -a -m'
alias gcg='git checkout gh-pages'
alias gca1='git checkout alextsui0510-patch-1'
alias gcb1='git checkout blxu-patch-1'
alias gcog='git checkout --orphan gh-pages'
alias gcom='git checkout --orphan master'
alias cleanall="dpkg -l |grep "^rc"|awk '{print $2}' |xargs aptitude -y purge"


