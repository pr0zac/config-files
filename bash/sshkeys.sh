/usr/bin/ssh-add -l >& /dev/null

if [[ $? != 0 ]]; then
    echo
    pad "-" 70
    echo
    ssh-add
    ssh_ret=$?
    echo
    pad "-" 70
    echo
    pad " " 64
    if [[ $ssh_ret != 0 ]]; then
        false
    else
        true
    fi
fi
