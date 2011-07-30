alias irc="ssh irc.dreid.org -t 'screen -dR irssi'"

alias ls="ls --color=auto"

ls >& /dev/null

if [[ $? != 0 ]]; then
    alias ls="ls -GF"
fi