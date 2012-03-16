HOSTNAMEHASH=`echo "${HOSTNAME}SALT" | tail -c15 | md5sum | cut -f1 -d" "`
if [ "$HOSTNAMEHASH" = "255314a4383db9089eeb9fea4d783f64" ]; then
    source .zshrc_work
fi

#TODO: check if X is running (DISPLAY env variable?)
export EDITOR="gvim --remote-silent"
bindkey -e

alias grep="grep --color"
alias pypy="${HOME}/opt/pypy/pypy-1.8/bin/pypy"
function e() {
    if [ "$#" != "0" ]; then
        gvim --remote-silent $*
    else
        gvim
    fi 
}
