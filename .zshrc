HOSTNAMEHASH=`echo "${HOSTNAME}SALT" | tail -c15 | md5sum | cut -f1 -d" "`
if [ "$HOSTNAMEHASH" = "255314a4383db9089eeb9fea4d783f64" ]; then
    source .zshrc_work
fi

if [ -n "$DISPLAY" ]; then
    export EDITOR="gvim --remote-wait-silent"
else
    export EDITOR="vim"
fi
export VISUAL=$EDITOR
bindkey -e
bindkey "[3~" .delete-char
bindkey "[1~" beginning-of-line
bindkey "[4~" end-of-line
alias grep="grep --color"
alias pypy="${HOME}/opt/pypy/pypy-1.8/bin/pypy"
function e() {
    if [ "$#" != "0" ]; then
        RUNNING_GVIM_SERVER=`gvim --serverlist | head -n1`;
        if [ -n "$RUNNING_GVIM_SERVER" ]; then
            gvim --remote $*
        else
            gvim $*
        fi
    else
        gvim
    fi 
}
