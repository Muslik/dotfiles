echo "1488root1488" | ~/dotfiles/.boss -c 'echo "dmorgil   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'
sudo dseditgroup -o edit -a dmorgil -t user admin
sudo dseditgroup -o edit -a dmorgil -t user wheel
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap heroku/brew
/bin/cat ~/dotfiles/brew.txt | xargs brew install
/bin/cat ~/dotfiles/brewcask.txt | xargs brew cask install
npm install -g browser-sync yarn spaceship-prompt nodemon
pip3 install virtualenv
