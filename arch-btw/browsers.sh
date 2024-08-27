#!/bin/bash
echo "Browser Installs for Arch"
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
    echo "Browser Installs for Arch"
    echo
    echo "What do you want to do?"
    echo
    echo "1. Install Firefox Developer Edition"
    echo "2. Install Firefox Stable"
    echo "3. Install Google Chrome"
    echo "4. Run Fastfetch"
    echo "x. Exit Installer"
    echo

    read choice

    case $choice in
        1)
            echo
            echo "Installing Firefox Developer Edition"
            echo

            sudo pacman -S --needed firefox-developer-edition speech-dispatcher --noconfirm
            yay -S --needed firefox-profile-switcher-connector --noconfirm

            firefox-developer-edition -CreateProfile dev-default dev-default
            firefox-developer-edition -CreateProfile dev-backup dev-backup
            cp -rT $RDIR/config-files/dot-files/firefox-profile/. ~/.mozilla/firefox/*.dev-default/
            cp -rT $RDIR/config-files/dot-files/firefox-profile/. ~/.mozilla/firefox/*.dev-backup/

            echo
            echo "Choose Dev profile and launch during next step!"
            firefox-developer-edition -ProfileManager -setDefaultBrowser about:profiles

    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        2)
            echo
            echo "Installing Firefox"
            echo

            sudo pacman -S --needed firefox speech-dispatcher --noconfirm
            yay -S --needed firefox-profile-switcher-connector --noconfirm

            firefox -CreateProfile stable-default stable-default
            firefox -CreateProfile stable-backup stable-backup
            cp -rT $RDIR/config-files/dot-files/firefox-profile/. ~/.mozilla/firefox/*.stable-default/
            cp -rT $RDIR/config-files/dot-files/firefox-profile/. ~/.mozilla/firefox/*.stable-backup/

            echo
            echo "Choose Stable profile and launch during next step!"
            firefox -ProfileManager about:profiles

            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        3)
            echo
            echo "Installing Google Chrome Stable"
            echo

            yay -S --needed google-chrome --noconfirm

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
