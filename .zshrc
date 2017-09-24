# Path to your oh-my-zsh installation.
export ZSH=/home/pkp/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse-modified"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in dazhann).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting rake)

setopt AUTO_CD

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
#
alias ls='ls --color=auto'
alias l='ls'
alias ..='cd ..'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias c='clear'
alias diff='colordiff'
alias catn='cat -n'
alias t='todo.sh'
alias lock='i3lock -i ~/Downloads/flash.png -t'
alias opend=xdg-open
alias irbd='docker run --rm -it registry.ops.directi.com/slant/$(pwd|rev|cut -d"/" -f1|rev) irb'
alias s='sudo'
alias x='exit'

# Git aliases
alias g='grep'
alias v='vim'
alias gpgp='git pull --rebase && git push'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias vpnconn1='sudo openvpn --config ~/openvpn/endurance1.ovpn'
alias vpnconn2='sudo openvpn --config ~/openvpn/endurance2.ovpn'
alias sprod1='ssh slant1'
alias sprod2='ssh slant2'

alias oath1='oathtool --totp --base32 VWKTP75QZAZFLQSI | xclip -selection c'
alias oath2='oathtool --totp --base32 HS56TLTC2LUMW2A7 | xclip -selection c'


alias dcs='docker-compose start'
alias dcl='docker-compose logs'
alias dcu='docker-compose up -d --force-recreate'
alias dce='docker exec -it'
alias dcp='docker-compose pull'
alias dcr='docker-compose restart'
# alias dcc='docker-compose-clear-logs'
#
alias workers='docker-compose -f /opt/slant/slant-workers.yml'
alias web='docker-compose -f /opt/slant/slant-web.yml'
alias infra='docker-compose -f /opt/slant/infra.yml'

# suffix aliases
alias -s rb=vim
alias -s py=vim
alias -s log="less -MN"


function redo_db() {
      cd ~/slant/slant-models
      bin/slant-models --dropdb --createdb --migrate --config db/database.yml
      bin/slant-models-importer --config db/database.yml
  }

function docker-compose-clear-logs() {
    shortid=`docker ps | grep $1 | awk '{ print $1}'`
    longid=`docker ps -a -q --no-trunc | grep $shortid | head -n 1`
    logfile="/var/lib/docker/containers/$longid/$longid-json.log"
    sudo truncate -s 0 $logfile
    echo "Truncated log file for $1"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
