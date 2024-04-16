set -x LANG en_US.UTF-8
set -U fish_greeting ""

export HOMEBREW_PREFIX="/opt/homebrew"
export CPATH="$HOMEBREW_PREFIX/include:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
export LD_LIBRARY_PATH="$HOMEBREW_PREFIX/opt/llvm/include"
export GPG_TTY=$(tty)
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="$HOME/.local/run"
export XDG_CONFIG_HOME="$HOME/.config"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PNPM_HOME="$XDG_CONFIG_HOME/pnpm"
export GOPATH="$XDG_DATA_HOME"/go
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# lua
export LUA="$HOMEBREW_PREFIX/opt/luajit/bin/luajit"

export NVM_DIR="$XDG_CONFIG_HOME/nvm"

export GRAPHVIZ_DOT="$HOMEBREW_PREFIX/bin/dot"

export BUN_INSTALL="$HOME/.bun"

export PATH="$GOPATH/bin/:$PNPM_HOME:$HOME/development/flutter/bin:$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$HOMEBREW_PREFIX/opt/llvm/bin/:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$HOME/.local/share/cargo/bin:$HOME/.local/share/nvim/mason/bin:$BUN_INSTALL/bin:$PATH"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH:/opt/jack/bin"

alias gcc=gcc-13
alias g++=g++-13
export RUSTC_WRAPPER=$(which sccache)

# bob
export PATH="$PATH:$XDG_DATA_HOME/bob/nvim-bin"

alias py=python3
alias python=python3
alias pip=pip3
export PYTHON=python3

alias lua=luajit

# ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export PATH="$GEM_HOME/bin:$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"
set -gx LDFLAGS "-L$HOMEBREW_PREFIX/opt/ruby/lib -L$HOMEBREW_PREFIX/opt/gettext/lib"
set -gx CPPFLAGS "-I$HOMEBREW_PREFIX/opt/ruby/include -I$HOMEBREW_PREFIX/opt/gettext/include"
set -gx PKG_CONFIG_PATH "$HOMEBREW_PREFIX/opt/ruby/lib/pkgconfig"

function gohere
    mkdir -p "$argv"
    cd "$argv"
    go mod init "github.com/Frank-Mayer/$argv"
    echo "package main" > main.go
    echo "" >> main.go
    echo "import (" >> main.go
    echo "    \"fmt\"" >> main.go
    echo ")" >> main.go
    echo "" >> main.go
    echo "func main() {" >> main.go
    echo "    fmt.Println(\"Hello, World!\")" >> main.go
    echo "}" >> main.go
    go mod tidy
    curl https://raw.githubusercontent.com/github/gitignore/main/Go.gitignore -o .gitignore
    echo "# $argv" > README.md
    git init
end

function csv
    column -s, -t < $argv | less -N -S
end

function branch
    # use $argv to build new branch name (replace spaces with dashes) and store in $branch
    set branch (string replace " " "-" "$argv")

    echo "$(git branch --show-current) -> $branch"

    # create new branch if it doesn't exist
    if not contains (git branch) $branch
        git branch $branch
    end

    # switch to new branch
    git checkout $branch

    # push branch to origin if it doesn't exist
    if not contains (git branch -r) origin/$branch
        git push --set-upstream origin $branch
    else
        git pull
    end
end

alias gtree="git log --oneline --graph --color --all --decorate"

alias vim="nvim"
alias vi="nvim"
export VISUAL=$(which zed)
export EDITOR=$(which nvim)
export GIT_EDITOR=$(which nvim)

if status is-interactive
    # Commands to run in interactive sessions can go here

    alias lg="lazygit"
    zoxide init fish | source
    golangci-lint completion fish | source
    alias cd="z"
    alias ls="list"
    alias l="list -la"
    alias tree="list -t"
    alias grep="rg"
    alias du="dust"
    alias copy="pbcopy"
    alias paste="pbpaste"
end
