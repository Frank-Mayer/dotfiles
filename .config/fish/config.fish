set -x LANG en_US.UTF-8
set -U fish_greeting ""

export CPATH="/opt/homebrew/include:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/c++/v1/"
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
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PATH="/Users/frank/.local/share/cargo/bin:$PATH"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GOPATH="$XDG_DATA_HOME"/go
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

export GRAPHVIZ_DOT="/opt/homebrew/bin/dot"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/coreutils/libexec/gnubin:/Applications/WezTerm.app/Contents/MacOS:$GOPATH/bin/:$PATH"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH:/opt/jack/bin"

alias gcc=gcc-13
alias g++=g++-13

# bob
export PATH="$XDG_DATA_HOME/bob/nvim-bin:$PATH"

# ensure link from /usr/local/include/ to /opt/homebrew/Cellar/gcc/13.2.0/include/c++/13/
# ln -s /opt/homebrew/Cellar/gcc/13.2.0/include /usr/local/include
# ensure link from /usr/local/lib/ to /opt/homebrew/Cellar/gcc/13.2.0/lib/gcc/13/
# ln -s /opt/homebrew/Cellar/gcc/13.2.0/lib/gcc /usr/local/lib
# ~/.R/Makevars

alias py=python3
alias python=python3
alias pip=pip3
export PYTHON=python3

function gohere
    mkdir -p "$argv"
    cd "$argv"
    go mod init "github.com/Frank-Mayer/$argv"
    mkdir -p "cmd/$argv"
    echo "package main" > "cmd/$argv/main.go"
    echo "" >> "cmd/$argv/main.go"
    echo "import (" >> "cmd/$argv/main.go"
    echo "    \"fmt\"" >> "cmd/$argv/main.go"
    echo ")" >> "cmd/$argv/main.go"
    echo "" >> "cmd/$argv/main.go"
    echo "func main() {" >> "cmd/$argv/main.go"
    echo "    fmt.Println(\"Hello, World!\")" >> "cmd/$argv/main.go"
    echo "}" >> "cmd/$argv/main.go"
    go mod tidy
    curl https://raw.githubusercontent.com/github/gitignore/main/Go.gitignore -o .gitignore
    echo "# $argv" > README.md
    echo "" >> README.md
    echo "## Install" >> README.md
    echo "" >> README.md
    echo "```bash" >> README.md
    echo "go install github.com/Frank-Mayer/$argv/cmd/$argv" >> README.md
    echo "```" >> README.md
    git init
end

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
    alias ls="exa"
    alias l="exa -alh"
    alias tree="exa --tree"
    alias grep="rg"
    alias du="dust"
    alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
    alias copy="pbcopy"
    alias paste="pbpaste"

    function starship_transient_prompt_func
        echo -n (set_color black white) '❯ '
    end
    starship init fish | source
    enable_transience
end
