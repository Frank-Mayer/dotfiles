export PATH="/opt/homebrew/bin:/Users/frankmayer/.local/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:/Applications/WezTerm.app/Contents/MacOS:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/homebrew/opt/gettext/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L/opt/homebrew/opt/gettext/lib"
export CPPFLAGS="-I/opt/homebrew/opt/gettext/include"
export LIBRARY_PATH="/usr/local/include/:$LIBRARY_PATH"
export GPG_TTY=$(tty)
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="$HOME/.local/run"
export XDG_CONFIG_HOME="$HOME/.config"
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GOPATH="$XDG_DATA_HOME"/go
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZDOTDIR="$HOME"/.config/zsh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-20.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:/opt/jack/bin:$PATH

export GRAPHVIZ_DOT="/opt/homebrew/bin/dot"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias -g py=python3
alias python=python3
alias pip=pip3
export PYTHON=python3

alias vim="nvim"
alias vi="nvim"
export VISUAL=nvim
export EDITOR="/opt/homebrew/bin/nvim"
export GIT_EDITOR="/opt/homebrew/bin/nvim"

alias lg="lazygit"

eval "$(zoxide init zsh &)"
alias cd="z"

alias ls="exa"
alias l="exa -alh"
alias tree="exa --tree"

alias grep="rg"

alias du="dust"

alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

