def="\033[39m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"

echo $green"\nINSTALLING BREW: $def\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# INSTALLING ZSH ANTIGEN PLUGIN MANAGER
curl -L git.io/antigen > ~/dotfiles/zsh/sourced/antigen.zsh

#INSTALLING BREW PLUGINS
echo $green"\nINSTALLING BREW PLUGINS: $def\n"
brew bundle --file BrewFile

#REMOVE OLD CONFIGS
echo $green"\nSETUP CONFIGS: $def\n"
rm -rf ~/.zshrc ~/.zshenv ~/.config/{alacritty,ranger,nvim,kitty}

#SYMLINKS
echo $magenta"\nSYMLINKING FILES $def\n"
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/alacritty ~/.config/alacritty
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/ranger ~/.config/ranger
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/zshenv ~/.zshenv

git config --global core.excludesfile ~/.global_ignore

touch ~/.hushlogin

npm install -g prompt-pure

echo $yellow"Configuration installed successfully! Enjoy :-) $def\n"
