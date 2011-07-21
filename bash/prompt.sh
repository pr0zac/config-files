ALT_HOST_COLOR_BASES=(
    $TXTGRN
    $TXTCYN
    $TXTPUR
    $TXTYLW
    $TXTBLU
    $BLDBLK
    $BLDGRN
    $BLDCYN
    $BLDPUR
    $UNDBLK
    $UNDRED
    $UNDGRN
    $UNDYLW
    $UNDBLU
    $UNDPUR
    $UNDCYN
    $UNDWHT
);

HOST_COLOR=$BLDRED;
USER_COLOR=$TXTBLU;
case $TERM in
    xterm*)
            TITLE_STRING="\033]0;\u@\h:\w \$(__git_ps1 \" (%s)\")\007"
            ;;
    *)
            TITLE_STRING=''
            ;;
esac

if [[ -n "${SSH_CONNECTION}" ]]; then
    hash=$(python -c "print abs(hash(\"${HOSTNAME}\"))")
    base=$(expr ${hash} % ${#ALT_HOST_COLOR_BASES})
    HOST_COLOR="\e[${ALT_HOST_COLOR_BASES[${base}]}"
fi

PS1="\[${TITLE_STRING}${HOST_COLOR}\]\h \[${USER_COLOR}\]\u\[${TXTRST}\]:\W\$(__git_ps1 \" (\[${TXTYLW}\]%s\[${TXTRST}\])\")> "
