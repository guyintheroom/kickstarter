#!/bin/bash
# Master Script for Updating Arch Linux
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
    echo "Arch Update Script"
    echo
    echo "What do you want to do?"
    echo
    echo "1. Update Arch w/ Snapshot"
    echo "2. Update Arch"
    echo "3. Read Latest Pacman News"
    echo "4. Pacman/Yay Cleanup"
    echo "5. Run Fastfetch"
    echo "x. Exit Installer"
    echo

    read choice

    case $choice in
        1)
            echo
            echo "Update Arch w/ Snapshot"
            echo
            
            echo "Creating Snapshot"
            sudo timeshift --create --comments Normal-Update
            
            echo "Running Yay"
            yay
            
            echo "Updating Flatpak"
            flatpak update
            
            echo
            echo "Package Summary"
            yay -Ps
            
    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        2)
            echo
            echo "Update Arch"
            echo
            
            echo "Running Yay"
            yay
            
            echo "Updating Flatpak"
            flatpak update
            
            echo "Summary"
            yay -Ps
            
    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        3)
            echo
            echo "Fetching and Showing Latest News"
            echo
            echo "Updating Feed"
            yay -S --needed pacnews --noconfirm
            echo "Showing News"
            pacnews
            ;;
        4)
            echo
            echo "Pacman/Yay Cleanup"
            echo
            echo "Pre-Summary"
            yay -Ps
            echo "Press any key to continue!"
            read
            
            echo "Cleaning Pacman Cache (Keeping 1 Previous Version)"
            sudo paccache -rk1
	    
            echo "Cleaning Yay Cache"
            yay -Sca

            echo "Removing Orphaned Packages"
            yay -Rns $(yay -Qtdq)

            echo "Post-Summary"
            yay -Ps

            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        5)
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
