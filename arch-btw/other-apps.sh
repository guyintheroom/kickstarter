#!/bin/bash
echo "Other Apps for Arch"
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
    echo "1. Install/Configure Extra Things for Desktops/Laptops"
    echo "2. Install/Configure Video/Audio Editors"
    echo "3. Install/Configure Tailscale"
    echo "4. Install Discord Fat Client"
    echo "5. Install Libreoffice"
    echo "6. Install Syncthing"
    echo "7. Run Fastfetch"
    echo "x. Exit Installer"
    echo

    read choice

    case $choice in
        1)
            echo
            echo "Installing Apps for Desktops/Laptops"
            echo
            
            echo "Installing Multimedia Things"
            sudo pacman -S --needed audacious spotify-launcher yt-dlp vlc --noconfirm
            yay -S --needed cli-visualizer plex-media-player --noconfirm

            echo "Vis Configs"
            mkdir -p ~/.config/vis/colors
            cp -rT $RDIR/config-files/dot-files/vis/config ~/.config/vis/config
            cp -rT $RDIR/config-files/dot-files/vis/colors/. ~/.config/vis/colors/

            echo "Installing Misc apps"
            sudo pacman -S --needed bitwarden --noconfirm
            yay -S --needed drawio-desktop-bin usbimager zoom --noconfirm

            echo "Bluetooth Things"
            sudo pacman -S --needed bluez blueman bluez-utils --noconfirm
            sudo systemctl start bluetooth.service
            sudo systemctl enable bluetooth.service
            
    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        2)
            echo
            echo "Installing Editing Apps"
            echo
            sudo pacman -S --needed pinta krita kdenlive ardour obs-studio flowblade --noconfirm

            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        3)
            echo
            echo "Installing Tailscale"
            echo
            
            echo "Install"
            sudo pacman -S --needed tailscale --noconfirm

            echo "Enabling Service"
            sudo systemctl enable --now tailscaled

            echo "Initial Config"
            sudo tailscale up
            
    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        4)
            echo
            echo "Installing Discord Fat Client"
            echo

            sudo pacman -S --needed discord --noconfirm
            yay -S --needed discord-update-skip-git --noconfirm

    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        5)
            echo
            echo "Installing Libreoffice"
            echo

            sudo pacman -S --needed libreoffice-fresh --noconfirm

            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        6)
            echo
            echo "Installing Syncthing"
            echo

            sudo pacman -S --needed syncthing --noconfirm

            echo "Enabling Service"
            sudo systemctl enable --now syncthing@$USER.service

            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        7)
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
