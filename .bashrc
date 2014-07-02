#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='vim'
#PS1='[\u@\h \W]\$ '
PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\];)\"; 
else echo \"\[\033[01;31m\];(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo 
'\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w 
\$\[\033[00m\] "

pcp(){
    rsync -ah --progress "$1" "$2"
}

export PAGER=most
export EDITOR=vim

RNDNUM=$[($RANDOM % 853) + 1]
echo $RNDNUM
SEDCMD="sed -n "$RNDNUM,$RNDNUM"p /home/pkp/timepass/c-faq.com/urls.txt"
EXECCMD=`eval $SEDCMD`
eval $EXECCMD
