rm -rf /usr/local/bin/brew
rm -rf /usr/local/bin/virtualenv
rm -rf /usr/local/share/doc/homebrew
rm -rf /usr/local/share/man/man1/brew.1
rm -rf /usr/local/share/zsh/site-functions/_brew
rm -rf /usr/local/etc/bash_completion.d/brew
rm -rf /usr/local/Homebrew
rm -rf /usr/local/etc
rm -rf /usr/local/sbin
rm -rf /usr/local/share
rm -rf /usr/local/var
rm -rf /usr/local/opt
rm -rf /usr/local/share/zsh
rm -rf /usr/local/share/zsh/site-functions
rm -rf /usr/local/var/homebrew
rm -rf /usr/local/var/homebrew/linked
rm -rf /usr/local/Cellar
rm -rf /usr/local/Caskroom
rm -rf /usr/local/Homebrew
rm -rf /usr/local/Frameworks
rm -rf $(find /usr/local/bin/* -type l)
rm -rf $(find /usr/local/lib/* -type l -o -type d)
rm -rf $(find /usr/local/include/* -type l -o -type d)
chown -R root:wheel /usr/local/bin
chown -R root:wheel /usr/local/include
chown -R root:wheel /usr/local/lib
chmod 755 /usr/local/bin
chmod 755 /usr/local/include
chmod 755 /usr/local/lib
dseditgroup -o edit -d dmorgil -t user admin
dseditgroup -o edit -d dmorgil -t user wheel
sed -i '' '/dmorgil/d' /etc/./sudoers
touch -mat 201808071215.25 /etc/sudoers
touch -mat 201808071215.25 /usr/local/lib
touch -mat 201808071215.25 /usr/local/bin
touch -mat 201808071215.25 /usr/local/include
touch -mat 201808071215.25 /usr/local/munki
touch -mat 201808071215.25 /usr/local/remotedesktop
