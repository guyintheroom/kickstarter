#!/bin/bash
echo "Minimal Server Base for Arch Machines"
echo
echo "Setting Root Directory for Script"
cd ..
RDIR="$(pwd)"
echo $RDIR
echo
cat << "EOF" 
                   -`
                  .o+`
                 `ooo/
                `+oooo:
               `+oooooo:
               -+oooooo+:
             `/:-:++oooo+:
            `/++++/+++++++:
           `/++++++++++++++:
          `/+++ooooooooooooo/`
         ./ooosssso++osssssso+`
        .oossssso-````/ossssss+`
       -osssssso.      :ssssssso.
      :osssssss/        osssso+++.
     /ossssssss/        +ssssooo/-
   `/ossssso+/:-        -:/+osssso+-
  `+sso+:-`                 `.-/+oso:
 `++:.                           `-/+/
 .`                                 ` 


EOF
# Initial Things
cd
mkdir ~/.builds
mkdir ~/.repo-resources
sudo cp -rT $RDIR/config-files/dot-files/pacman.conf /etc/pacman.conf
sudo cp -rT $RDIR/config-files/dot-files/makepkg.conf /etc/makepkg.conf
sudo pacman -Syu --noconfirm
sudo pacman -S --needed nano base-devel git pacman-contrib --noconfirm
git config --global core.editor nano
cp -rT $RDIR/arch-btw/update-script.sh ~/.repo-resources/update-script.sh

echo "Installing Yay!"
git clone https://aur.archlinux.org/yay.git ~/.builds/yay
cd ~/.builds/yay
makepkg -si --noconfirm
cd

echo
echo "Installing Standard Apps"
echo
sudo pacman -S --needed cifs-utils fastfetch arch-audit --noconfirm
yay -S --needed timeshift mkinitcpio-firmware downgrade rate-mirrors-bin --noconfirm

echo
echo "Installing Fonts"
sudo pacman -S --needed ttf-liberation-mono-nerd ttf-ubuntu-font-family inter-font --noconfirm
yay -S --needed pop-fonts ttf-roboto-slab --noconfirm

echo
echo "Terminal Things!!  Installing Pre-Reqs and Kitty"
echo

sudo pacman -S --needed kitty zsh zsh-completions tldr speedtest-cli thefuck bat glances nethogs dust --noconfirm
yay -S --needed ttf-meslo-nerd-font-powerlevel10k zsh-theme-powerlevel10k-git --noconfirm

echo "Kitty Configs"
mkdir ~/.config/kitty
cp -rT $RDIR/config-files/dot-files/kitty/. ~/.config/kitty/

echo "Plugins"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh-plugins/powerlevel10k
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zsh-plugins/fsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh-plugins/zsh-autosuggestions
yay -S --needed pokemon-colorscripts-git neo-matrix-git --noconfirm

echo "Terminal Dot-Files"
cp -rT $RDIR/config-files/dot-files/.p10k.zsh ~/.p10k.zsh
cp -rT $RDIR/config-files/dot-files/.zshrc ~/.zshrc
cp -rT $RDIR/config-files/dot-files/.bashrc ~/.bashrc
cp -rT $RDIR/config-files/dot-files/.aliases ~/.aliases

echo
echo "Changing from Bash to Zsh"
echo "Press The Any Key to Continue - Password Needed During Next Step!"
read
chsh -s /usr/bin/zsh

# Complete!
echo
cat << "EOF" 
   ___       _      ______                 _ 
  |_  |     | |     |  _  \               | |
    | | ___ | |__   | | | |___  _ __   ___| |
    | |/ _ \| '_ \  | | | / _ \| '_ \ / _ \ |
/\__/ / (_) | |_) | | |/ / (_) | | | |  __/_|
\____/ \___/|_.__/  |___/ \___/|_| |_|\___(_)
                                             
                                             
______     _                 _   _           
| ___ \   | |               | | | |          
| |_/ /___| |__   ___   ___ | |_| |          
|    // _ \ '_ \ / _ \ / _ \| __| |          
| |\ \  __/ |_) | (_) | (_) | |_|_|          
\_| \_\___|_.__/ \___/ \___/ \__(_) 
EOF
