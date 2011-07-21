GIT_COMP_SEARCH=(
    "/usr/local/etc/bash_completion.d/git-completion.bash"
    "/etc/bash_completion.d/git"
)

for git_comp in ${GIT_COMP_SEARCH[*]}; do
    if [[ -f $git_comp ]]; then
        source $git_comp
        break
    fi
done

GIT_PS1_SHOWDIRTY_STATE=t
GIT_PS1_SHOWUPSTREAM="auto"
