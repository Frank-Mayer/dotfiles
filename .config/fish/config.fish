set -x LANG en_US.UTF-8
set -U fish_greeting ""

export HOMEBREW_PREFIX="/opt/homebrew"
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

export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-22.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

alias gcc=gcc-13
alias g++=g++-13
export RUSTC_WRAPPER=$(which sccache) 
export CC="sccache gcc"
export CXX="sccache g++"

export PATH="$XDG_DATA_HOME/bob/nvim-bin:$PATH"

export PYTHON=python3


export GEM_HOME="$XDG_DATA_HOME/gem"
export PATH="$GEM_HOME/bin:$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/ruby/lib -L$HOMEBREW_PREFIX/opt/gettext/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/ruby/include -I$HOMEBREW_PREFIX/opt/gettext/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/ruby/lib/pkgconfig"
export CPATH="$HOMEBREW_PREFIX/include:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"

function mithere
    echo "Copyright $(date +%Y) Frank Mayer" > LICENSE
    echo "" >> LICENSE
    echo "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:" >> LICENSE
    echo "" >> LICENSE
    echo "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software." >> LICENSE
    echo "" >> LICENSE
    echo "THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." >> LICENSE
end

function gohere
    mkdir -p "$argv"
    cd "$argv"
    git init

    go mod init "github.com/tsukinoko-kun/$argv"
    echo "package main" > main.go
    echo "" >> main.go
    echo "import (" >> main.go
    echo "    \"fmt\"" >> main.go
    echo ")" >> main.go
    echo "" >> main.go
    echo "func main() {" >> main.go
    echo "    fmt.Println(\"Hello, World!\")" >> main.go
    echo "}" >> main.go

    curl https://raw.githubusercontent.com/github/gitignore/main/Go.gitignore -o .gitignore

    go mod tidy

    echo "# $argv" > README.md

    mithere
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

export VISUAL=$(which zed)
export EDITOR=$(which nvim)
export GIT_EDITOR=$(which nvim)

if status is-interactive
    # Commands to run in interactive sessions can go here

    alias lg="lazygit"
    zoxide init fish | source
    golangci-lint completion fish | source
    bonsai completion fish | source
    yab completion fish | source
    gut completion fish | source

    function starship_transient_prompt_func
        echo -n (set_color black) $(string replace $HOME '~' "$(pwd -P) ❯")
        echo -n (set_color normal) ''
    end
    function starship_transient_rprompt_func
        echo -n (set_color black) $(date +%H:%M:%S)
    end
    starship init fish | source
    enable_transience
    alias cd="z"
    alias ls="list"
    alias l="list -la"
    alias tree="list -t"
    alias grep="rg"
    alias du="dust"
    alias copy="pbcopy"
    alias paste="pbpaste"
    alias gtree="git log --oneline --graph --color --all --decorate"
    alias vim="nvim"
    alias vi="nvim"
    alias py="python3"
    alias python="python3"
    alias pip="pip3"
    alias lua="luajit"

end
