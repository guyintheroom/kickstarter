#!/bin/bash
echo "Desktop Environment Extras"
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
while true; do
    echo
    echo "Arch Master Script"
    echo
    echo "What do you want to do?"
    echo
    echo "1. Customize KDE Plasma"
    echo "2. Customize Gnome Desktop"
    echo "3. Customize XFCE Desktop"
    echo "4. Run Fastfetch"
    echo "x. Exit Installer"
    echo

    read choice

    case $choice in
        1)
            echo
            echo "Customize KDE Plasma"
            echo
        
            echo "Apps"
            sudo pacman -S --needed kwalletmanager spectacle partitionmanager lm_sensors kcalc gwenview ffmpegthumbs --noconfirm
            yay -S --needed konsave --noconfirm

            echo "Wallpapers"
            sudo mkdir /usr/share/wallpapers/archlinux-wallpaper
            sudo cp -rT /usr/share/backgrounds/archlinux /usr/share/wallpapers/archlinux-wallpaper

            echo "Konsave Profile Import"
            konsave -i $RDIR/config-files/konsave/baseline.knsv
            konsave -i $RDIR/config-files/konsave/baseline-stats.knsv

            echo "Apply Konsave Baseline-Stats Profile"
            konsave -a baseline-stats -f
	    
    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        2)
            echo
            echo "Customize Gnome Desktop"
            echo
        
            echo "Google Stuff"
            sudo pacman -S --needed seahorse gnome-online-accounts gvfs-goa gvfs-google --noconfirm

            echo "Apps"
            sudo pacman -S --needed pavucontrol --noconfirm

            echo "Theme Tweaks"
            gsettings set org.gnome.desktop.interface color-scheme prefer-dark

            echo "Nautilus Thumbnail Generation"
            sudo pacman -S --needed ffmpegthumbnailer gst-libav --noconfirm

            echo "Kitty Icon"
            sed -e "s|Icon=.*|Icon=$HOME/.config/kitty/kitty.app.png|" /usr/share/applications/kitty.desktop > ~/.local/share/applications/kitty.desktop

            echo "Gnome Extensions"
            sudo pacman -S --needed gnome-shell-extensions libgtop lm_sensors gnome-tweaks --noconfirm
            yay -S --needed gnome-browser-connector extension-manager adw-gtk3 gnome-icon-theme-symbolic gnome-icon-theme --noconfirm

            echo "ArcMenu Install"
            git clone https://gitlab.com/arcmenu/ArcMenu.git ~/.builds/ArcMenu
            cd ~/.builds/ArcMenu
            make install
            cd
            
            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        3)
            echo
            echo "XFCE Things"
            echo
        
            echo "LightDM Management"
            sudo pacman -S --needed lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm
            yay -S --needed mugshot --noconfirm

            echo "Enable SMB"
            sudo pacman -S --needed gvfs-smb --noconfirm

            echo "Panel Management"
            yay -S --needed xfce4-panel-profiles --noconfirm

            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;

        4)
            echo
            echo "Running Fastfetch"
            echo
            
            fastfetch
            
            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        x)
            echo
            echo "Job Done!  Exiting..."
            echo
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
