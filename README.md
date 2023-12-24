# dotfiles

Neovim config: [Frank-Mayer/nvim](https://github.com/Frank-Mayer/nvim)

## My macBook setup steps

### oh my zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Add [`agnoster-light.zsh-theme`](https://github.com/mkolosick/agnoster-light/blob/master/agnoster-light.zsh-theme) to `~/.oh-my-zsh/themes/`

### homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Unix coreutils

```
brew install git
```

```
git config --global core.excludesfile ~/.config/git/.gitignore
```

```
brew unlink gdu
```

```
brew install coreutils
```

```
brew install make
```

```
brew install gpg2 gnupg pinentry-mac
```

```
brew install fd
```

https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e

### Shenanigans

```
brew install fortune
```

```
brew install cowsay
```

```
brew install lolcat
```

### LLDB

Install XCode.

Without installing Xcode, Open terminal, put `lldb` and press return. you will be prompt to the installation.

### Replacements

```
brew install zoxide
```

```
brew install bat
```

```
brew install exa
```

```
brew install ripgrep
```

### Additional applications

```
brew install lazygit
```

```
curl -fsSL https://bun.sh/install | bash
```

```
brew install go
```

```
brew install --cask corretto
```

```
brew install python
```

```
brew install --cask wezterm
```
*Give wezterm all rights in system Settings*

```
brew install viu
```

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

```
brew install neovim
```

```
brew install asciinema && asciinema auth
```

```
brew install protobuf
```

```
pip install protobuf
```

### Other

```
brew install --cask rectangle
```
