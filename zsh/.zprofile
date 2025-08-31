export EDITOR=nvim
export VISUAL="$EDITOR"
export CMAKE_GENERATOR=Ninja
export PAGER='less -R'
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin"
export PATH="$PATH:/usr/local/include"
export PATH="$PATH:/Library/lein"
export PATH="$PATH:$HOME/.luarocks/bin"
export PATH="$PATH:/System/Cryptexes/App/usr/bin"
export PATH="$PATH:/usr/local/share/dotnet"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:/Library/Frameworks/Mono.framework/Versions/Current/Commands"
export PATH="$PATH:$HOME/.pyenv/bin"
if [[ ! -d "$HOME/.cargo" ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"  # ensure cargo is in the path right after install
    cargo install bat just tldr fd-find ripgrep skim uv
fi
export PATH="$PATH:$HOME/.cargo/bin"

export LUA_PATH='/usr/local/Cellar/luarocks/3.9.2/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/Users/jaredgivens/.luarocks/share/lua/5.4/?.lua;/Users/jaredgivens/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/local/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;./?.so'
export LUA_CPATH="$LUA_CPATH;$HOME/.luarocks/lib/lua/5.4/?.so"
export LUA_CPATH="$LUA_CPATH;$HOME/.luarocks/share/lua/5.1/"
export OMNISHARP_DIR="$HOME/.local/lib/omnisharp"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/Cellar/imagemagick/7.1.1-39/lib"

export CMAKE_PREFIX_PATH="/Users/jaredgivens/Library/cmake:$CMAKE_PREFIX_PATH"
export PROTOC="/usr/local/bin/protoc"
export PROTOC_INCLUDE="/usr/local/include"

export SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."
export SKIM_DEFAULT_OPTIONS="--color=16 --bind 'ctrl-a:select-all+accept'"
