#! /bin/bash 
echo "
 ___            _    ___  ___  _ _ _ 
| . | _ _  ___ | |_ | . >|_ _|| | | |
|   || '_>/ | '| . || . \ | | | | | |
|_|_||_|  \_|_.|_|_||___/ |_| |__/_/ " 
echo -e "\e[32m 	    V1.1  (alpha)\e[0m"
echo ""
echo "	https://github.com/clonehacks"
echo ""
	if [ "$EUID" -ne 0 ]; then
    	echo ""
    	echo "ARE YOU ROOT??? " 
    	echo ""
    	sleep 2
    	echo "This script requires elevated privileges to run!"
   	echo ""
   	sleep 1
    	echo "the syntax for this script is ---> 'sudo ./ArchBTW.sh'"
    	echo ""
    	sleep 3
    	exit 1
	fi
echo ""

dependencies=("curl" "ufw" "tor" "ruby" "btop" "timeshift" "htop" "iftop" "nmon" "glances" "nmon" "lynis" "ttf-nerd-fonts-symbols-common" "lolcat" "rkhunter")
for dep in "${dependencies[@]}"; do
    if ! pacman -Qi "$dep" &> /dev/null; then
        sudo pacman -S --noconfirm "$dep"
    else
        echo "$dep is already installed."
    fi
done

echo "Dependencies installation complete."

echo ""
animate(){
    local spinner="/-\-|"
    local i 

    for i in $(seq 1 10);do
        printf "\r${spinner:i++%${#spinner}:1} LOADING..." | lolcat
        sleep 0.1
    done

    printf "\r  \n"
}
animate
echo ""
echo " ArchBTW (v1.1) "
sleep 2
echo ""

display_main_menu() {
    echo "                  - - - - - - - - - - - - - - - - - - -"
    echo -e "\e[32m                     ArchBTW (v1.1) <-> MAIN MENU \e[0m"
    echo "                  - - - - - - - - - - - - - - - - - - -"
    echo ""
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " 1. PACKAGE MANAGEMENT                 (update / pacman / octopi / flatpak)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " 2. MONITORING TOOLS                   (btop / glances / iftop / rkhunter)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " 3. ANONYMITY                                    (vpn / tor / ufw / shred)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " 4. MISC                      (cmatrix / timeshift / cron-jobs / hostname)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
}
                                                                                                
        display_submenu1() {
    echo "                         - - - - - - - - - - - - - - - - "
    echo -e "                        \e[32m>      PACKAGE MANAGEMENT   <\e[0m"
    echo "                         - - - - - - - - - - - - - - - - "
    echo ""
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 1.  UPDATE via PACMAN                                     (pacman -Syu)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 2.  FULL UPGRADE via PACMAN                              (pacman -Syyu)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 3.  CLEAR PACKAGE CACHE                               (sudo pacman -Sc)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 4.  SHOW ALL INSTALLED PACKAGES ON YOUR SYSTEM"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 5.  INSTALL THE (GUI) FLATPAK STORE                    (gnome-software)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 6.  INSTALL OCTOPI"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 7.  MAIN MENU"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
}

display_submenu2() {
    echo "                          - - - - - - - - - - -   "
    echo -e "                        \e[32m>   MONITORING TOOLS   <\e[0m"
    echo "                          - - - - - - - - - - -   "
    echo ""
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 1.  BTOP"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 2.  HTOP"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 3.  IFTOP"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 4.  GLANCES"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 5.  NMON"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 6.  AUDIT YOUR SYSTEM FOR VULNERABILITIES                       (lynis)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 7.  CHECK FOR ROOTKITS                                       (rkhunter)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 8.  SEARCH FOR DEVICES ON YOUR NETWORK                     (clonehacks)" 
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 9.  MAIN MENU"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
}

display_submenu3() {
    echo "                              - - - - - - - - - "
    echo -e "                            \e[32m>   ANONYMITY   <\e[0m"
    echo "                              - - - - - - - - -"
    echo ""
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 1.  CHECK YOUR PUBLIC IP ADDRESS                          (ifconfig.me)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 2.  DOWNLOAD FREE ANONYMOUS VPN                            (riseup-vpn)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 3.  PASSWORD GENERATOR                                     (clonehacks)"                                  
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 4.  ENABLE TOR"                              
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 5.  DOWNLOAD SECURE WEB-BROWSER                         (brave browser)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 6.  DOWNLOAD THE TOR BROWSER"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 7.  DOWNLOAD BLEACHBIT"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 8.  SECURE FILE DELETION                         (shred -vzon --remove)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 9.  FIREWALL PORT STATUS                         (ufw check open ports)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 10. MAIN MENU"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
}

display_submenu4() {
    echo "                              - - - - -  "
    echo -e "                            \e[32m>   MISC   <\e[0m"
    echo "                              - - - - -  "
    echo ""
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 1.  8-BIT BINARY TO DECIMAL CALCULATOR                     (clonehacks)"          
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 2.  SUBNET CALCULATOR                                      (clonehacks)"           
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 3.  CREATE A NEW CRON-JOB"                              
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 4.  SNAPSHOT YOUR SYSTEM                                    (timeshift)"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 5.  CHANGE YOUR HOSTNAME"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 6.  CMATRIX                                  (enter the rainbow matrix)"                         
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
    echo " > 7.  MAIN MENU"
    echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
}                                                        
                                                                                     
# Main program
while true; do
    clear  # Clear the screen for better readability

    # Display the main menu
    display_main_menu

    # Read user input
    echo ""
    read -p " ENTER WHICH MENU YOU WANT TO ENTER (1-4) : " choice_main

    case $choice_main in

        1)
            # package management
            while true; do
                clear
                display_submenu1
                        echo ""
    read -p " SELECT THE TASK YOU WANT TO DO (1-7) : " choice

                case $choice in
                    1)
                        echo ""
                        echo "YOU CHOSE :   UPDATE via PACMAN "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -Syu
                        ;;
                    2)
                        echo ""
                        echo "YOU CHOSE :   UPGRADE via PACMAN "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -Syu
                        ;;
                    3)  
                        echo ""
                        echo "YOU CHOSE :   CLEAR PACKAGE CACHE "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -Scc --noconfirm
                        echo ""
                        echo "Cache cleanup complete!"
                        ;;
                
                    4)
                        echo ""
                        echo "YOU CHOSE :   SHOW ALL INSTALLED PACKAGES "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -Q
                        ;;
                    5)
                        echo ""
                        echo "YOU CHOSE :  INSTALL FLATPAK "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -S flatpak
                        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
                        echo ""
                        echo "flatpak has been installed on your system, via the 'software' application"
			sleep 1
                        ;;
                    6)
                        echo ""
                        echo "YOU CHOSE :  INSTALL OCTOPI "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -S octopi                         
                        echo ""
                        echo "octopi has been installed on your system"
                        ;;

		    7)
                        break  # Go back to the main menu
                        ;;
                    *)
                        echo "Invalid option. Try again."
                        ;;
                esac
                echo ""
                read -p "Press Enter to continue..."
                echo ""
            done
            ;;

        2)
            # monitoring tools
            while true; do
                clear
                display_submenu2
                        echo ""
    read -p " SELECT THE TOOL YOU WANT TO USE (1-9) : " choice

                case $choice in
                    1)
                        echo ""
                        echo "YOU CHOSE :   BTOP "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        btop
                        ;;
                    2)
                        echo ""
                        echo "YOU CHOSE :   HTOP "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        htop
                        ;;
                    3)
                        
                        echo ""
                        echo "YOU CHOSE :   IFTOP "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        iftop
                        ;;
                    4)
                        echo ""
                        echo "YOU CHOSE :   GLANCES "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        glances
                        ;;
                    5)
                        echo ""
                        echo "YOU CHOSE :   NMON "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        nmon
                        ;;
                    6)
                        echo ""
                        echo "YOU CHOSE :   LYNIS SYSTEM AUDIT " 
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        lynis audit system -q
                        ;;
                    7)
                        echo ""
                        echo "YOU CHOSE :   RKHUNTER "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        rkhunter --checkall --sk --quiet  
                        ;;

                    8)
                        echo ""
                        echo "YOU CHOSE :   PING FOR DEVICES ON YOUR NETWORK "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        echo "Let me see if i find any devices on the local network that respond a ping request"
            sleep 4            
                        clear
                        echo ""
                        animate(){
                        local spinner="/-\|"
                        local i 

                            for i in $(seq 1 10);do
                            printf "\r${spinner:i++%${#spinner}:1} LOADING..." | lolcat
                            sleep 0.1
                        done

                        printf "\r  \n"
                        }
                        animate
# <clonehacks> ruby script added     
ruby<<EOF
#!/usr/bin/env ruby

require 'socket'

def reachable?(ip)
    system("ping -c 1 -W 1 #{ip} > /dev/null 2>&1")
end

def local_ip_addresses
    Socket.ip_address_list.select { |addr| addr.ipv4? && !addr.ipv4_loopback?}.map(&:ip_address)
end

def check_active_devices
    puts "- - - - - - - - - - - - - - - - - - - - - - - - - -"
    puts "Checking for active devices on the local network..."
    puts "- - - - - - - - - - - - - - - - - - - - - - - - - -"
    puts ""
    local_ip_addresses.each do |ip|
        if reachable?(ip)
            puts ""
            puts "Device found with the following IP address : #{ip}"
            puts ""
        end
    end
end

check_active_devices
puts ""
EOF
                        ;;
                    9)
                        break  # Go back to the main menu
                        ;;
                    *)
                        echo "Invalid option. Try again."
                        ;;
                esac
                        echo ""
                read -p "Press Enter to continue..."
                        echo ""
            done
            ;;

    3)
            # Anonymous section
            while true; do
                clear
                display_submenu3
                 read -p " SELECT WHICH OPTION YOU WANT (1-10) : " choice

                case $choice in
# <clonehacks> ifconfig script added 
                    1)
                        echo ""
                        echo "YOU CHOSE :   CHECK YOUR PUBLIC IP ADDRESS "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        public_ip=$(curl -s ifconfig.me)
                        echo "YOUR PUBLIC IP ADDRESS IS : $public_ip"
                        echo ""
                        ;;
                    2)
                        echo ""
                        echo "YOU CHOSE :   TO ENABLE RISEUP-VPN  "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -S riseup-vpn
                        echo ""
                        ;;
                    3)
# <clonehacks> password gen script added 
                        echo ""
                        echo "YOU CHOSE :   GENERATE A RANDOM PASSWORD  "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        generate_password() {
                        characters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_"
# Define password length (you can change this value)
    password_length=12
    password=$(tr -dc "$characters" < /dev/urandom | head -c "$password_length")
    echo "$password"
}

generated_password=$(generate_password)
                        echo ""
animate(){
    local spinner="/-\|"
    local i 

    for i in $(seq 1 10);do
        printf "\r${spinner:i++%${#spinner}:1} YOUR PASSWORD IS BEING GENERATED. . ." | lolcat
        sleep 0.1
    done

    printf "\r  \n"
}

animate
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        echo "YOUR RANDOMLY GENERATED PASSWORD :                   $generated_password"
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        ;;
                    4)
                        echo ""
                        echo "YOU CHOSE :   ENABLE TOR  "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        systemctl start tor
                        echo ""
                        echo "TOR IS NOW ENABLED (use 'sudo systemctl stop tor' to stop using tor)"
			sleep 1
                        ;;
                    5)
                        echo ""
                        echo "YOU CHOSE :   DOWNLOAD BRAVE  "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -S brave-bin
                        echo ""
                        ;;
                    6)
                        echo ""
                        echo "YOU CHOSE :   DOWNLOAD TOR-BROWSER  "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -S tor-browser
                        echo ""
                        ;;
                    7)
                        echo ""
                        echo "YOU CHOSE :   DOWNLOAD BLEACHBIT  "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        pacman -S bleachbit
                        echo ""
                        ;;
                    8)
                        echo ""
                        echo "YOU CHOSE :   FILE SHREDDER  "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
                        echo "PLEASE NOTE THIS WILL ERASE & OVERWITE THE FILE WITH ZEROS & ONES (100 times) BEFORE DELETING IT"
                        echo ""
                        echo "MAKE SURE YOU WANT THIS FILE DESTORYED, EVEN FORENSIC TOOLS WONT BE ABLE TO RESTORE IT"
                        echo ""
                sleep 5
                        read -p "ENTER THE 'PATH/TO/FILE'YOU WANT SHREDDED : " file_location
                        if [ -e "$file_location" ]; then
                            #shred the file
                            shred -vzun 100 --remove "$file_location"
                            echo ""
                            echo "YOUR FILE HAS SUCCESSFULLY BEEN SHREDDED!"
                        else
                            echo "FILE NOT FOUND! CHECK THE PATH & FILE NAME IS CORRECT"
                            echo "EXAMPLE : /var/log/lastlog"
                        fi
                        echo ""
                        ;;
                    9)
# <clonehacks> script using the ufw data to show open ports on the system 
                        echo ""
                        echo "YOU CHOSE :   UFW PORT-SCAN "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
                        echo ""
check_open_ports() {
                        echo "LET ME RUN A QUICK SCAN"
                        echo ""
                        sleep 1
                        ufw enable
                        echo ""
                        sleep 2
                        clear
animate(){
    local spinner="/-\|"
    local i 

    for i in $(seq 1 10);do
        printf "\r${spinner:i++%${#spinner}:1} CHECKING FOR OPEN PORTS via UFW..." | lolcat
        sleep 0.1
    done

    printf "\r  \n"
}

animate
        ufw_status=$(sudo ufw status numbered)
        open_ports=$(echo "$ufw_status" | grep ALLOW | awk '{print $NF}' | cut -d '/' -f 1)
    if [ -z "$open_ports" ];then
                     echo ""
                     echo "NO OPEN PORTS FOUND!"
                     echo ""
    else 
                     echo ""
                     echo "OPEN PORTS:$open_ports"
                     echo ""
    
    fi
}
check_open_ports
                        ;;

                    10)
                        break  # Go back to the main menu
                        ;;

                
                    *)
                        echo "Invalid option. Try again."
                        ;;

                esac
                echo ""
                read -p "Press Enter to continue..."
                echo ""
            done
            ;;


  4)
            # Misc menu
            while true; do
                clear
                display_submenu4
                read -p " SELECT WHICH OPTION YOU WANT (1-7) : " choice
                case $choice in
                    1)
                        echo ""
                        echo "YOU CHOSE :   BINARY TO DECIMAL CALCULATOR "
                        echo ""
                        echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
# clonehacks binary to decimal calculator script added                      
                        echo ""
                        echo "THIS IS A 8-BIT CALCULATOR ONLY (ATM)"
                        echo ""
			sleep 2
                        echo "Example = '10101010'"
			sleep 1                        
			echo ""
                        clear 
binary8_to_decimal() {
  binary=$1
  if [[ ${#binary} -eq 8 && $binary =~ ^[01]+$ ]]; then
    decimal=$((2#${binary}))
    echo "$decimal"
  else
    echo "Invalid 8-bit binary input. Please enter an 8-bit binary number (0s and 1s only e.g.. 10101100)."
  fi
}

read -p "Enter an 8-bit binary number: " binary8_input

decimal_result=$(binary8_to_decimal "$binary8_input")
echo "Decimal equivalent: $decimal_result"
                  ;;
                    2)
                        echo "YOU CHOSE :   SUBNET CALCULATOR "

# Function to calculate subnet 
calculate_subnet() {
    local ip="$1"
    local subnet_mask="$2"

    IFS='.' read -r -a ip_parts <<< "$ip"
    IFS='.' read -r -a mask_parts <<< "$subnet_mask"

# Calculate network address
    network_address=""
    for ((i=0; i<4; i++)); do
        network_address+="$((ip_parts[i] & mask_parts[i]))"
        [ $i -lt 3 ] && network_address+="."
    done

# Calculate broadcast address
    broadcast_address=""
    for ((i=0; i<4; i++)); do
        broadcast_address+="$((ip_parts[i] | (255 - mask_parts[i])))"
        [ $i -lt 3 ] && broadcast_address+="."
    done

# Calculate usable host range
    host_range_start=$(( (ip_parts[3] & mask_parts[3]) + 1 ))
    host_range_end=$(( (ip_parts[3] | (255 - mask_parts[3])) - 1 ))

    echo "Network Address: $network_address"
    echo "Broadcast Address: $broadcast_address"
    echo "Usable Host Range: $network_address$host_range_start - $network_address$host_range_end"
}

# Input IP address and subnet mask
read -p "Enter IP Address: " ip_address
read -p "Enter Subnet Mask: " subnet_mask

# Validate input
if [[ ! $ip_address =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ || ! $subnet_mask =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid input. Please enter valid IP address and subnet mask."
    exit 1
fi

# Calculate and display subnet details
calculate_subnet "$ip_address" "$subnet_mask"

                        ;;
                    3) echo "YOU CHOSE :   CREATE NEW CRONJOB "

# Function to add a new cron job
add_cron_job() {
    local command="$1"
    local schedule="$2"
    local description="$3"


    if [ -n "$description" ]; then
        (crontab -l; echo "$schedule $command # $description") | crontab -
    else
        (crontab -l; echo "$schedule $command") | crontab -
    fi

    echo "Cron job added successfully."
}


read -p "Enter the command to be executed: " command
read -p "Enter the schedule in cron format (e.g., '* * * * *' for every minute): " schedule
read -p "Enter an optional description for the cron job (press Enter to skip): " description


if [ -z "$command" ] || [ -z "$schedule" ]; then
    echo "Invalid input. Command and schedule are required."
    exit 1
fi

add_cron_job "$command" "$schedule" "$description"
;;	            
			4) echo "YOU CHOSE :   TIMESHIFT "
			   timeshift --create

# Check the status of the snapshot creation
status=$?
if [ $status -eq 0 ]; then
    echo "Timeshift snapshot created successfully."
else
    echo "Error creating Timeshift snapshot. Exit code: $status"
fi
;;			
			5) echo "YOU CHOSE :   CHANGE HOSTNAME "
    echo "this script lets you check and change your hostname with ease..."
    sleep 2
    echo "without the need to modify hostname files"
    sleep 2
while true; do
    echo ""
    echo "Hostname Options :"
    echo "------------------"
    echo "1. Check Hostname"
    echo ""
    echo "2. Change Hostname"
    echo ""
    echo "3. Exit"
    echo ""
    read -p "Enter your choice (1-3): " choice

    case $choice in
        1)
            echo "You selected Check Hostname"
            hostnamectl status
	    sleep 3
            ;;
        2)
            echo "You selected Change Hostname"
            echo "Enter the new Hostname : "
		read user_input 
# checking user input field #
if [ -n "$user_input" ]; then
	echo "Changing your Hostname to your new Hostname : $user_input"
	eval "$user_input"
else
	echo "No input detected. Existing."
fi
            ;;
        3)
            echo "Exiting the script..."
	    echo ""
	    exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 3."
            ;;
    esac

done
;;
		6) echo "YOU CHOSE :   CMATRIX"
		 	cmatrix -Bs | lolcat
			;;
                7)   
			break  # Go back to the main menu
                        ;;
                    *)
                        echo "Invalid option. Try again."
                        ;;
                esac
			echo ""
                read -p "Press Enter to continue..."
            done
;;
        *)
            echo "Invalid option. Try again."
            ;;
    esac
    echo ""
    read -p "PRESS ANY BUTTON TO RETURN TO THE PREVIOUS MENU..."
    echo ""
done










