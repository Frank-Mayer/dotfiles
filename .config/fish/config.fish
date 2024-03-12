set -x LANG en_US.UTF-8
set -U fish_greeting ""

export CPATH="/opt/homebrew/include:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/c++/v1/"
export LDFLAGS="-L/opt/homebrew/opt/gettext/lib"
export CPPFLAGS="-I/opt/homebrew/opt/gettext/include"
export LD_LIBRARY_PATH="/opt/homebrew/opt/llvm/include"
export GPG_TTY=$(tty)
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="$HOME/.local/run"
export XDG_CONFIG_HOME="$HOME/.config"
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export RUSTC_WRAPPER="/opt/homebrew/bin/sccache"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GOPATH="$XDG_DATA_HOME"/go
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

export NVM_DIR="$XDG_CONFIG_HOME/nvm"

export GRAPHVIZ_DOT="/opt/homebrew/bin/dot"

export BUN_INSTALL="$HOME/.bun"

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/opt/llvm/bin/:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/coreutils/libexec/gnubin:/Applications/WezTerm.app/Contents/MacOS:$GOPATH/bin/:/Users/frank/.local/share/cargo/bin:$HOME/.local/share/nvim/mason/bin:$BUN_INSTALL/bin:/Users/frank/Library/Python/3.9/bin:$PATH"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH:/opt/jack/bin"

alias gcc=gcc-13
alias g++=g++-13

# bob
export PATH="$XDG_DATA_HOME/bob/nvim-bin:$PATH"

alias py=python3
alias python=python3
alias pip=pip3
export PYTHON=python3

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
    echo "" >> README.md
    echo "## Install" >> README.md
    echo "" >> README.md
    echo "```bash" >> README.md
    echo "go install github.com/Frank-Mayer/$argv@latest" >> README.md
    echo "```" >> README.md
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
export VISUAL=nvim
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
