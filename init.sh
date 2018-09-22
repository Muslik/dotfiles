#REMOVE OLD CONFIGS
rm -rf ~/.vim ~/.vimrc ~/.zshrc

#INSTALLING ZSH-SPACESHIP THEME
export ZSH_CUSTOM="$HOME/dotfiles/zsh/zsh-custom"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#INSTALLING SYNTAX HIGHLIGHTING
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#INSTALLING AUTO SUGGESTIONS
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#INSTALLING PURE THEME
mkdir ~/dotfiles/zsh/zsh-custom/themes/pure
curl https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh > ~/dotfiles/zsh/zsh-custom/themes/pure/pure.zsh
curl https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh > ~/dotfiles/zsh/zsh-custom/themes/pure/async.zsh
ln -s ~/dotfiles/zsh/zsh-custom/themes/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
ln -s ~/dotfiles/zsh/zsh-custom/themes/pure/async.zsh /usr/local/share/zsh/site-functions/async

#INSTALLING ITERM2 THEME
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Jellybeans.itermcolors > Jellybeans.itermcolors
open Jellybeans.itermcolors

#SYMLINKS
echo "SYMLINKING FILES"
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/global_ignore ~/
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconig
git dotfiles --global core.excludesfile ~/.global_ignore

touch ~/.hushlogin

echo "DONE"
