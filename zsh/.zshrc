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

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin"
export PATH="$PATH:/.cargo/bin"
export PATH="$PATH:/usr/local/include"
export PATH="$PATH:/Library/lein"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.luarocks/bin"
export PATH="$PATH:/System/Cryptexes/App/usr/bin"
export PATH="$PATH:/usr/local/share/dotnet"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:/Library/Frameworks/Mono.framework/Versions/Current/Commands"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.pyenv/bin"

export LUA_PATH='/usr/local/Cellar/luarocks/3.9.2/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/Users/jaredgivens/.luarocks/share/lua/5.4/?.lua;/Users/jaredgivens/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/local/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;./?.so;/Users/jaredgivens/.luarocks/lib/lua/5.4/?.so'
export LUA_CPATH="$LUACPATH;$HOME/.luarocks/share/lua/5.1/"
export OMNISHARP_DIR="$HOME/.local/lib/omnisharp"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/Cellar/imagemagick/7.1.1-39/lib"

export CMAKE_PREFIX_PATH="/Users/jaredgivens/Library/cmake:$CMAKE_PREFIX_PATH"
export PROTOC="/usr/local/bin/protoc"
export PROTOC_INCLUDE="/usr/local/include"
export ZDOTDIR="$HOME/.config/zsh"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

