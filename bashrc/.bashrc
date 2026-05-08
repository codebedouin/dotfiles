# terminal colors
export CLICOLOR=1
export TERM=xterm-256color

# homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# GNU coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# personal binaries
export PATH="~/bin:$PATH"

# default editor
export EDITOR="nvim"

# bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# aliases
if [ -e $HOME/.bash_aliases ]; then
	source $HOME/.bash_aliases
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GOPATH=$HOME/go

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# postgresql
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# mcat
export MCAT_THEME="catppuccin"

# starship
eval "$(starship init bash)"

# run pokeget
command -v pokeget > /dev/null && pokeget random --hide-name

# zoxide
eval "$(zoxide init bash)"

