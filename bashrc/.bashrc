eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/bin:$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH:$HOMEBREW_PREFIX/opt/postgresql@17/bin"

export EDITOR="nvim"
export MCAT_THEME="catppuccin"

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

[[ -r "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"

command -v fzf >/dev/null && eval "$(fzf --bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

eval "$(direnv hook bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
