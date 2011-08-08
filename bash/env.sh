export TERM="xterm-256color"

WORKON_HOME=~/.virtualenvs

mkdir -p $WORKON_HOME

PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
EDITOR=vim

NODE_PATH=/usr/local/lib/node

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export PATH EDITOR WORKON_HOME NODE_PATH
