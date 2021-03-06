def="\033[39m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"

#INSTALLING BREW PLUGINS
echo $green"\nINSTALLING BREW PLUGINS $def\n"
cat brew.txt | xargs brew install

# Installing brew plugins from Brewfile
#brew bundle

#REMOVE OLD CONFIGS
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.config/nvim/init.vim ~/.config/ranger/rc.conf

#INSTALLING ZSH-SPACESHIP THEME
export ZSH_CUSTOM="$HOME/dotfiles/zsh/zsh-custom"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#INSTALLING SYNTAX HIGHLIGHTING
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#INSTALLING AUTO SUGGESTIONS
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.config/{nvim,ranger,alacritty}

#SYMLINKS
echo $magenta"\nSYMLINKING FILES $def\n"
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/zshenv ~/.zshenv
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/dotfiles/rc.conf ~/.config/ranger/rc.conf
git config --global core.excludesfile ~/.global_ignore

touch ~/.hushlogin

npm install -g prompt-pure
npm install -g browser-sync

echo 'set runtimepath+=~/dotfiles/nvim
source ~/dotfiles/nvim/plugins.vim
source ~/dotfiles/nvim/extended.vim
source ~/dotfiles/nvim/init.vim
try
source ~/dotfiles/nvim/my_configs.vim
catch
endtry' > ~/.config/nvim/init.vim

echo $yellow"Configuration installed successfully! Enjoy :-) $def\n"

echo $red"Now do: vim ~/.zshrc and change top variables to yours $def\n"

echo "DONE"
