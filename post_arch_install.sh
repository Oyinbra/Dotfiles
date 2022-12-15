# POST ARCH INSTALL SCRIPT

#sudo pacman -S zsh git wget curl neofetch && chsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k



cd
#git clone https://github.com/Oyinbra/.dotfiles.git

ln -sf ~/.dotfiles/zshrc/.zshrc ~/
ln -sf ~/.dotfiles/powerlevel10k/.p10k.zsh ~/
ln -sf ~/.dotfiles/zsh_aliases/.zsh_aliases ~/
ln -sf ~/.dotfiles/konsole/.local/share/konsole/oyinbra.profile ~/.local/share/konsole
ln -sf ~/.dotfiles/latte-dock/.config/lattedockrc ~/.config/
ln -sf ~/.dotfiles/latte-dock/.config/latte ~/.config
ln -sf ~/.dotfiles/fonts/.fonts ~/
ln -sf ~/.dotfiles/git/.gitignore_global ~/
ln -sf ~/.dotfiles/icons/.icons ~/
ln -sf ~/.dotfiles/neofetch-source/.neofetch-config2.conf ~/
ln -sf ~/.dotfiles/themes/.themes ~/
# Enable color in nano editor for user
ln -sf ~/.dotfiles/aurorae ~/.local/share/
source ~/.zshrc


# Arcolinux Mirror
sudo ln -sf ~/.dotfiles/pacman-mirrior/etc/pacman.d/arcolinux-mirrorlist /etc/pacman.d/

sudo cp -r /home/oyinbra/.oh-my-zsh /root

sudo ln -sf /home/oyinbra/.dotfiles/zsh_aliases/.zsh_aliases /root/

sudo ln -sf /home/oyinbra/.dotfiles/powerlevel10k-root/.p10k.zsh /root/
sudo ln -sf /home/oyinbra/.dotfiles/neofetch-source/.neofetch-config2.conf /root
sudo ln -sf /home/oyinbra/.dotfiles/neofetch-ascii/usr/bin/neofetch /usr/bin
sudo ln -sf /home/oyinbra/.dotfiles/zshrc/.zshrc /root
# Enable color in nano editor for root user
sudo ln -sf /home/oyinbra/.dotfiles/nano/.nanorc /root
ln -sf ~/.dotfiles/nano/.nanorc ~/

pacman.u obs-studio-28.1.2-2-x86_64.pkg.tar.zst brave-bin-1_1.45.133-1-x86_64.pkg.tar.zst pycharm-community-edition-2022.2.4-1-x86_64.pkg.tar.zst android-studio-2021.3.1.17-1-x86_64.pkg.tar.zst discord-0.0.21-2-x86_64.pkg.tar.zst uget-2.2.3-6-x86_64.pkg.tar.zst fluent-reader-bin-1.1.3-1-x86_64.pkg.tar.zst mailspring-1.10.7-1-x86_64.pkg.tar.zst bitwarden-2022.11.0-1-x86_64.pkg.tar.zst motrix-bin-1.6.11-1.1-x86_64.pkg.tar.zst visual-studio-code-bin-1.73.1-2-x86_64.pkg.tar.zst freedownloadmanager-6.18.1.4920-1-x86_64.pkg.tar.zst google-chrome-108.0.5359.71-1-x86_64.pkg.tar.zst notion-app-enhanced-2.0.18-1.1-x86_64.pkg.tar.zst timeshift-bin-22.11.1-1-x86_64.pkg.tar.zst timeshift-autosnap-0.9-1-any.pkg.tar.zst kdeconnect-22.12.0-1-x86_64.pkg.tar.zst rust-1_1.65.0-1-x86_64.pkg.tar.zst paru-1.11.1-1-x86_64.pkg.tar.zst duf-0.8.1-2-x86_64.pkg.tar.zst btop-1.2.13-1-x86_64.pkg.tar.zst telegram-desktop-4.4.1-3-x86_64.pkg.tar.zst



# Pictures Restore
#cd ~/Pictures
#git clone https://github.com/Oyinbra/Pictures.git
#cd Pictures
#cp -r Screenshots Wallpaper ~/Pictures
#cd ..
#rm -rf Pictures
