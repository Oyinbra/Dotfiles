echo "
#############################################################################
#############################################################################
##                                                                         ##
##                        POST ARCH INSTALL SCRIPT                         ##
##                                                                         ##
#############################################################################
#############################################################################"

# ##############################################
# ################## ARCH Pure  ###############
# ##############################################

echo Cloning zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# ##############################################
# #################### ARCH ####################
# ##############################################

ln -sf ~/.dotfiles/zshrc/.zshrc ~/
ln -sf ~/.dotfiles/powerlevel10k/.p10k.zsh ~/
ln -sf ~/.dotfiles/zsh_aliases/.zsh_aliases ~/

ln -sf ~/.dotfiles/latte-dock/.config/lattedockrc ~/.config/
ln -sf ~/.dotfiles/latte-dock/.config/latte ~/.config
ln -sf ~/.dotfiles/fonts/.fonts ~/
ln -sf ~/.dotfiles/git/.gitignore_global ~/
ln -sf ~/.dotfiles/icons/.icons ~/
ln -sf ~/.dotfiles/neofetch-source/.neofetch-config2.conf ~/
ln -sf ~/.dotfiles/themes/.themes ~/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/alacritty/.config/alacritty ~/.config
ln -sf ~/.dotfiles/aurorae ~/.local/share/
ln -sf ~/.dotfiles/home/.nanorc ~/

# CONFIGURATIONS
ln -sf ~/.dotfiles/.config/obs-studio ~/.config
ln -sf ~/.dotfiles/.config/fluent-reader ~/.config
ln -sf ~/.dotfiles/.config/VirtualBox ~/.config
ln -sf ~/.dotfiles/.config/nvim ~/.config

# LOCAL SHARE
ln -sf ~/.dotfiles/.local/share/color-schemes ~/.local/share
ln -sf ~/.dotfiles/.local/share/icons ~/.local/share
ln -sf ~/.dotfiles/.local/share/plasma ~/.local/share
# Remove konsole folder
mv ~/.local/share/konsole ~/.local/share/konsole.bak
ln -sf ~/.dotfiles/.local/share/konsole/ ~/.local/share/

# SDDM Themes
sudo ln -sf ~/.dotfiles/usr/share/sddm/themes/Ocean /usr/share/sddm/themes/

echo "
#############################################################################
#############################################################################
##                                                                         ##
##                     OH-MY-ZSH ROOT INSTALLATION                         ##
##                                                                         ##
#############################################################################
#############################################################################"

# Copy oh=my=zsh to root
sudo cp -r /home/$USER/.oh-my-zsh /root
sudo ln -sf /home/$USER/.dotfiles/powerlevel10k-root/.p10k.zsh /root/
sudo ln -sf /home/$USER/.dotfiles/neofetch-source/.neofetch-config2.conf /root
sudo ln -sf /home/$USER/.dotfiles/neofetch-ascii/usr/bin/neofetch /usr/bin
sudo ln -sf /home/$USER/.dotfiles/zshrc/.zshrc /root

# Enable color in nano editor for root user (Comment for Manjaro)
# sudo ln -sf /home/$USER/.dotfiles/home/.nanorc /root
# ln -sf ~/.dotfiles/nano/.nanorc ~/
sudo ln -sf /home/$USER/.dotfiles/.config/nvim /root/.config
sudo ln -sf /home/$USER/.dotfiles/zsh_aliases/.zsh_aliases /root/

echo "
#############################################################################
#############################################################################
##                                                                         ##
##                            PARU CONFIGURATION                           ##
##                                                                         ##
#############################################################################
#############################################################################"

sudo ln -sf /home/$USER/.dotfiles/etc/paru.conf /etc/


sudo ln -sf /home/$USER/.env /root

echo Refresh zshrc
source ~/.zshrc

echo "DONE"