def="\033[39m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"

echo $green"\nINSTALLING BREW: $def\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# INSTALLING ZSH ANTIGEN PLUGIN MANAGER
echo $green"\nINSTALLING ANTIGEN ZSH PLUGIN MANAGER: $def\n"
curl -L git.io/antigen > ~/dotfiles/zsh/sourced/antigen.zsh

#INSTALLING BREW PLUGINS
echo $green"\nINSTALLING BREW PLUGINS: $def\n"
brew bundle --file BrewFile

brew services start yabai
brew services start skhd
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
sudo yabai --load-sa

#REMOVE OLD CONFIGS
echo $green"\nSETUP CONFIGS: $def\n"
rm -rf ~/.zshrc ~/.zshenv ~/.config/{gitui,ranger,nvim,kitty,yabai,skhd,spacebar}

#SYMLINKS
mkdir -p ~/.config
mkdir -p ~/.config/tmuxinator
ln -s ~/dotfiles/helix ~/.config/helix
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/ranger ~/.config/ranger
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/yabai ~/.config/yabai
ln -s ~/dotfiles/skhd ~/.config/skhd
ln -s ~/dotfiles/spacebar ~/.config/spacebar
ln -s ~/dotfiles/gitui ~/.config/gitui

git config --global core.excludesfile ~/.global_ignore
touch ~/.hushlogin
ssh-add ~/.ssh/id_rsa

echo $yellow"Configuration installed successfully! Enjoy :-) $def\n"
