export TERM="xterm-256color"

WORKON_HOME=~/.virtualenvs

mkdir -p $WORKON_HOME

PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$HOME/.rbenv/shims:$PATH
EDITOR=vim
NODE_PATH=/usr/local/lib/node

export PATH EDITOR WORKON_HOME NODE_PATH

eval "$(rbenv init -)"
