#!/bin/bash
echo "Local Repo Syncing"
echo
echo "Setting Root Directory for Script"
cd ..
RDIR="$(pwd)"
LOCALIP="10.10.30.200"
TSIP="100.124.81.109"
echo $RDIR
echo $LOCALIP
echo $TSIP
echo
cat << "EOF"
                 .88888888:.
                88888888.88888.
              .8888888888888888.
              888888888888888888
              88' _`88'_  `88888
              88 88 88 88  88888
              88_88_::_88_:88888
              88:::,::,:::::8888
              88`:::::::::'`8888
             .88  `::::'    8:88.
            8888            `8:888.
          .8888'             `888888.
         .8888:..  .::.  ...:'8888888:.
        .8888.'     :'     `'::`88:88888
       .8888        '         `.888:8888.
      888:8         .           888:88888
    .888:88        .:           888:88888:
    8888888.       ::           88:888888
    `.::.888.      ::          .88888888
   .::::::.888.    ::         :::`8888'.:.
  ::::::::::.888   '         .::::::::::::
  ::::::::::::.8    '      .:8::::::::::::.
 .::::::::::::::.        .:888:::::::::::::
 :::::::::::::::88:.__..:88888:::::::::::'
  `'.:::::::::::88888888888.88:::::::::'
        `':::_:' -- '' -'-' `':_::::'`


EOF
while true; do
    echo
    echo "Synchronize Repository"
    echo
    echo "How do you want to sync?"
    echo
    echo "1. Over the Local Network"
    echo "2. Over Tailscale"
    echo "3. Permanent mapping w/ alias"
    echo "4. Install Tailscale"
    echo "5. Install Firefox Development Edition"
    echo "6. Run Fastfetch"
    echo "x. Exit Installer"
    echo

    read choice

    case $choice in
        1)
            echo
            echo "Syncing over the local network"
            echo
            
            echo "Creating Folders"
            sudo mkdir -p /mnt/shares/repo-sync
            mkdir ~/all-the-things-local

            echo "Mounting Share"
            sudo mount -t cifs //$LOCALIP/Software-Repo /mnt/shares/repo-sync -o sec=none
            echo
            echo "Don't continue if there are errors!!"
            echo "Press any key to continue..."
            read

            echo "Syncing Files"
            rsync -avh --delete /mnt/shares/repo-sync/ ~/all-the-things-local

            echo "Unmounting Share"
            sudo umount /mnt/shares/repo-sync
            
    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        2)
            echo
            echo "Syncing over the private tailnet network"
            echo
            echo "Install/configure Tailscale prior to running!!"
            echo "Press any key to continue"
            read

            echo "Creating Folders"
            sudo mkdir -p /mnt/shares/repo-sync
            mkdir ~/all-the-things-local

            echo "Mounting Share"
            sudo mount -t cifs //$TSIP/Software-Repo /mnt/shares/repo-sync -o sec=none
            echo
            echo "Don't continue if there are errors!!"
            echo "Press any key to continue..."
            read

            echo "Syncing Files"
            rsync -avh --delete /mnt/shares/repo-sync/ ~/all-the-things-local

            echo "Unmounting Share"
            sudo umount /mnt/shares/repo-sync

    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        3)
            echo
            echo "Mapping the Software-Repo"
            echo
            
            echo "Creating Mount Directories"
            sudo mkdir /mnt/shares /mnt/shares/all-the-things

            echo "Mounting Shared Folder from Server"
            echo "You need to edit fstab. Copy the following text before proceeding."
            echo
            echo "
# Public Shares
# all-the-things
//$LOCALIP/Software-Repo /mnt/shares/all-the-things cifs rw,_netdev,noserverino,sec=none,iocharset=utf8,file_mode=0777,dir_mode=0777
"
            echo
            echo "Press any key to continue into the Nano Editor"
            read

            sudo nano /etc/fstab
            sudo systemctl daemon-reload
            sudo mount -a

            echo "Create Symbolic Link"
            ln -s /mnt/shares/all-the-things ~/
            
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
