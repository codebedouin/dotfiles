alias ls="ls -FNh --color=auto"
alias less="less -gINS"

if command -v nvim &> /dev/null; then
  alias vim="nvim"
  alias vi="nvim"
fi

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

if command -v bat &> /dev/null; then
  alias cat="bat --paging=never --style=plain"
fi

if command -v btop &> /dev/null; then
  alias top="btop"
  alias htop="btop"
fi

if command -v podman &> /dev/null; then
  alias docker="podman"
fi
