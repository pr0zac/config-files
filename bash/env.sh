WORKON_HOME=~/.virtualenvs

mkdir -p $WORKON_HOME

PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
EDITOR=vim

NODE_PATH=/usr/local/lib/node

[[ -s "/Users/zac/.rvm/scripts/rvm" ]] && source "/Users/zac/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH EDITOR WORKON_HOME NODE_PATH
