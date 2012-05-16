UNVER="$HOME/.zshrc_unversioned"
if [ -e $UNVER ]; then
    source $UNVER 
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
alias ls="ls --color"
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

alias py="rlwrap -r -c -a -O'>>>' -pPurple python"
# ~/.zshrc: 


# alias ls='ls --color=auto'
# #alias dir='dir --color=auto'
# #alias vdir='vdir --color=auto'

# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'

# # some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

# Zsh Options
source /etc/profile
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/xocoatl/.zshrc'
#bindkey -v
autoload -Uz compinit promptinit colors
setopt correctall
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt noclobber
setopt autocd
compinit
promptinit
colors
fortune 2> /dev/null && echo
# # PROMPT SUBTITUTION
export PROMPT=$'%(?..%{\e[41;38m%}%B-%?-%b%{\e[0m%} )%(1j.%{\e[01;33m%}[%j] .)%{\e[01;36m%}%n@%m%{\e[0m%} %{\e[01;32m%}%2~%{\e[0m%} %B%#%b '
export RPROMPT=$'%{\e[01;31m%}[%!]%{\e[0m%}'		# history # on right

# Stuff
eval `dircolors -b`
export BROWSER='firefox'
export MOZ_DISABLE_PANGO='1'
export PAGER='less'
export GREP_COLOR="1;33"
alias -g grep='grep --color=auto'
alias -g ls='ls --color'
alias -g su="su -"
alias -g pacman='pacman-color'
alias -g yaourt='packer'
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

alias pypy="$HOME/opt/pypy-1.8/bin/pypy"
export TERM=$TERM
case $TERM in
    terminator*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac
wtf() { dig +short txt "$*".wp.dg.cx; }
bindkey  '.' insert-last-word
translate(){ firefox "http://translate.google.pl/?q=$1" }
export PYTHONSTARTUP=$HOME/.pythonrc.py
