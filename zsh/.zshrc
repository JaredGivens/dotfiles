# enable colors 
autoload -U colors && colors
# ls colors
export CLICOLOR=1
export LS_COLORS='di=01;34:ex=01;32:ln=01;36:*.tar=01;31'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# set History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt autocd nomatch menucomplete interactive_comments
zle_highlight=('paste:none')
# basic auto complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# vim mode
bindkey -v
export KEYTIMEOUT=1
# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*%f'
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:git*' formats '%F{green}󰘬 %b%f%c%u '
zstyle ':vcs_info:git*' actionformats '%F{green}󰘬 %b%f(%F{yellow}%a%f)%c%u '
precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT='%B%F{blue}%1~%f ${vcs_info_msg_0_}$ %b'
# plugins
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
export EDITOR=nvim
export CMAKE_GENERATOR=Ninja
alias ls="ls --color=auto"
