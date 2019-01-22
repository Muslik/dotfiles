#Installing 42 brew
curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh

#INSTALLING BREW PLUGINS
echo "INSTALLING BREW PLUGINS"
brew install neofetch
brew install neovim
brew install ranger
brew install npm

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

#INSTALLING ITERM2 THEME
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Jellybeans.itermcolors > Jellybeans.itermcolors
open Jellybeans.itermcolors

mkdir -p ~/.config/{nvim,neofetch,ranger}

#SYMLINKS
echo "SYMLINKING FILES"
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/global_ignore ~/
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/rc.conf ~/.config/ranger/rc.conf
ln -s ~/dotfiles/qutebrowser/ ~/.qutebrowser
ln -s ~/dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf
ln -s ~/dotfiles/neofetch/picture ~/.config/neofetch/picture
git config --global core.excludesfile ~/.global_ignore

touch ~/.hushlogin

echo 'set runtimepath+=~/dotfiles/nvim
source ~/dotfiles/nvim/plugins.vim
source ~/dotfiles/nvim/extended.vim
source ~/dotfiles/nvim/init.vim
try
source ~/dotfiles/nvim/my_configs.vim
catch
endtry' > ~/.config/nvim/init.vim

echo "Installed Nvim configuration successfully! Enjoy :-)"

echo "DONE"
