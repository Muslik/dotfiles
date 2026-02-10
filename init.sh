#!/bin/bash

OS="$(uname -s)"
DOTFILES="$HOME/dotfiles"

# COMMON SYMLINKS
mkdir -p ~/.config
rm -rf ~/.zshrc ~/.gitconfig ~/.tmux.conf ~/.config/{gitui,nvim,wezterm,yazi}

ln -s "$DOTFILES/zsh/zshrc" ~/.zshrc
ln -s "$DOTFILES/gitconfig" ~/.gitconfig
ln -s "$DOTFILES/tmux.conf" ~/.tmux.conf
ln -s "$DOTFILES/nvim" ~/.config/nvim
ln -s "$DOTFILES/gitui" ~/.config/gitui
ln -s "$DOTFILES/wezterm" ~/.config/wezterm
ln -s "$DOTFILES/yazi" ~/.config/yazi

git config --global core.excludesfile ~/.global_ignore
touch ~/.global_ignore
touch ~/.hushlogin

if [[ "$OS" == "Darwin" ]]; then
    # macOS
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew bundle --file "$DOTFILES/Brewfile"

    git config --global credential.helper osxkeychain

    rm -rf ~/.config/{yabai,skhd}
    ln -s "$DOTFILES/yabai" ~/.config/yabai
    ln -s "$DOTFILES/skhd" ~/.config/skhd

    brew services start yabai
    brew services start skhd
    echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
    sudo yabai --load-sa
    [[ -f ~/.ssh/id_rsa ]] && ssh-add ~/.ssh/id_rsa

elif [[ "$OS" == "Linux" ]]; then
    # Linux — install packages from Pacfile
    PACFILE="$DOTFILES/Pacfile"

    if [[ -f "$PACFILE" ]]; then
        pacman_pkgs=()
        aur_pkgs=()
        npm_pkgs=()
        section=""

        while IFS= read -r line; do
            line="${line%%#*}"       # strip comments
            line="${line// /}"       # strip spaces
            [[ -z "$line" ]] && continue

            case "$line" in
                "[pacman]") section="pacman" ;;
                "[aur]")    section="aur" ;;
                "[npm]")    section="npm" ;;
                *)
                    case "$section" in
                        pacman) pacman_pkgs+=("$line") ;;
                        aur)    aur_pkgs+=("$line") ;;
                        npm)    npm_pkgs+=("$line") ;;
                    esac
                    ;;
            esac
        done < "$PACFILE"

        if [[ ${#pacman_pkgs[@]} -gt 0 ]]; then
            echo "Installing pacman packages..."
            sudo pacman -S --needed --noconfirm "${pacman_pkgs[@]}"
        fi

        if [[ ${#aur_pkgs[@]} -gt 0 ]]; then
            if command -v yay &>/dev/null; then
                echo "Installing AUR packages..."
                yay -S --needed --noconfirm "${aur_pkgs[@]}"
            else
                echo "yay not found, skipping AUR packages: ${aur_pkgs[*]}"
            fi
        fi

        if [[ ${#npm_pkgs[@]} -gt 0 ]]; then
            if command -v npm &>/dev/null; then
                echo "Installing npm global packages..."
                npm install -g "${npm_pkgs[@]}"
            else
                echo "npm not found, skipping npm packages"
            fi
        fi
    fi

    git config --global credential.helper store

    rm -rf ~/.config/{i3,polybar}
    ln -s "$DOTFILES/i3" ~/.config/i3
    ln -s "$DOTFILES/polybar" ~/.config/polybar
fi

echo "Configuration installed successfully!"
