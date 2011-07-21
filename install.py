#!/usr/bin/env python
import os

def l(target, new):
    target = os.path.abspath(os.path.expanduser(target))
    new = os.path.abspath(os.path.expanduser(new))
    if os.path.exists(new):
        print "{0} exists".format(new)
    else:
        os.symlink(target, new)


if __name__ == '__main__':
    l('dotbashrc', '~/.bashrc')
    l('dotbash_profile', '~/.bash_profile')
    l('.', '~/.bash.d')
    l('dotvimrc', '~/.vimrc')
    l('vim', '~/.vim')
    l('dotscreenrc', '~/.screenrc')
