# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# load vcs_info
#
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# set prompt
#
autoload colors
colors
case ${UID} in
    0)
	PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
	PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
	SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
	RPROMPT='${vcs_info_msg_0_}'
	;;
    *)
	PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
	PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
	SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
	RPROMPT='${vcs_info_msg_0_}'
	;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd
setopt pushd_ignore_dups

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
# to end of it)
#
bindkey -e

# if you press Ctrl-w, delete the last segment delimited with '/'
#
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
zle -la history-incremental-pattern-search-backward && bindkey "^r" history-incremental-pattern-search-backward
zle -la history-incremental-pattern-search-forward  && bindkey "^S" history-incremental-pattern-search-forward

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-za-z}'

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
    freebsd*|darwin*)
	alias ls="ls -G -w"
	;;
    linux*)
	alias ls="ls --color"
	;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -alsF"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias -g L="| less"
alias -g M="| more"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g N="> /dev/null"
alias -g V="| vim -R -"
alias -g P=" --help | less"

## emacs
#
alias emacs='emacsclient -nw -a ""'
alias e='emacsclient -nw -a ""'
alias emacsd='\emacs --daemon'
alias emacskill='emacsclient -e "(kill-emacs)"'
alias emacsrestart='emacskill && emacsd'

## Git command
#
alias gaa="git add ."
alias gbr="git branch"
alias gbrm="git branch -m"
alias gbrd="git branch -D"
alias gd="git diff"
alias gdc="git diff --cached"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gst="git status && git stash list"
alias gch="git cherry -v"
alias glgg="git logg"
alias glg="git logg | head"
alias gplo="git pull origin"
alias gpso="git push origin"

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
    xterm)
	export TERM=xterm-color
	;;
    kterm)
	export TERM=kterm-color
  # set BackSpace control character
	stty erase
	;;
    cons25)
	unset LANG
	export LSCOLORS=ExFxCxdxBxegedabagacad
	export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
	zstyle ':completion:*' list-colors \
	    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
	;;
esac

# set terminal title including current directory
#
case "${TERM}" in
    kterm*|xterm*)
	precmd() {
	    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
	}
	export LSCOLORS=exfxcxdxbxegedabagacad
	export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
	zstyle ':completion:*' list-colors \
	    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
	;;
esac


## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/shuhei.shogen/.sdkman"
[[ -s "/Users/shuhei.shogen/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/shuhei.shogen/.sdkman/bin/sdkman-init.sh"
