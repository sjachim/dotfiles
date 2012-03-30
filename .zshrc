if [ -e .zshrc_unversioned ]; then
    source .zshrc_unversioned
fi

export HISTSIZE=2000
export HISTFILE="$HOME/.zsh/zsh_history"
export SAVEHIST=$HISTSIZE #this line is required to save the file

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
if [ "$TERM" = "terminator" ]; then
   export TERMCAP=~/.termcap
else
    unset TERMCAP
fi
export TERM=$TERM
case $TERM in
    terminator*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac
