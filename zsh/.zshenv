alias cmake='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
alias tmux='tmux -f $HOME/.config/dotfiles/tmux/tmux.conf'
alias ls='ls --color=auto'
#alias nix-shell='nix-shell --command PS1=\"\n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\]\" zsh'
if [[ -f ./fn.sh ]]; then
  . ./fn.sh
fi
if [[ -f ~/fn.sh ]]; then
  . ~/fn.sh
fi
