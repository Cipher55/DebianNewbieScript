#!/bin/bash

#     ________                     __      __          ________    _          
#    / ____/ /_  ____  _________  / /___ _/ /____     / ____/ /_  (_)___      
#   / /   / __ \/ __ \/ ___/ __ \/ / __ `/ __/ _ \   / /   / __ \/ / __ \     
#  / /___/ / / / /_/ / /__/ /_/ / / /_/ / /_/  __/  / /___/ / / / / /_/ /     
#  \____/_/ /_/\____/\___/\____/_/\__,_/\__/\___/   \____/_/ /_/_/ .___/      
#     ______                            __  _                   /_/           
#    / ____/___  ____ ___  ____  __  __/ /_(_)___  ____ _                     
#   / /   / __ \/ __ `__ \/ __ \/ / / / __/ / __ \/ __ `/                     
#  / /___/ /_/ / / / / / / /_/ / /_/ / /_/ / / / / /_/ /                      
#  \____/\____/_/ /_/ /_/ .___/\__,_/\__/_/_/ /_/\__, /                       
#                      /_/                      /____/  


# Debian Newbie Script v0.3.3 beta
# This script is designed to rice and optimize a Debian install, and install new, better components on first run. 
# This script is designed for the latest stable release, Debian GNU/Linux 8.* Jessie. This includes i386 bit 
# packages, to ensure it works on both 32 and 64 bit systems. All apt packages will obviously be tailored
# to the system. I am currently trying to figure out how to make an auto-update script to insure that the user is
# using the latest version.

# This script is designed for users of the Daily "Friendly Linux Thread" on 4chan's technology board, /g/. 
# (https://boards.4chan.org/g/flt) 

# This script adds a number of privacy features. It also removes all other Desktop Environments, and installs a 
# light-weight one called LXDE, which is much like the older Windows' Interface, so is good for newbies.

# YOU MUST RUN THIS SCRIPT BY DOING 
# su -m -p -c ./newbie.sh
# OTHERWISE, THE SCRIPT WILL FAIL, AND QUITE POSSIBLY BREAK YOUR COMPUTER

# I have tried my very best to only include Free/Libre software. If you see any package in here that is not,
# CONTACT ME IMEDIETLY. chocolatechip@derpymail.org is my email, and my PGP key is available at 
# https://choco.neocities.org/pgp
# Please email all bug reports to the same address.
# You can also contact me on #Chocolate_Chip on the network irc.canternet.org (please use the SSL Port 6697.)


#################
# Start echo(s) #
#################
clear
echo "
Copyright (c) 2015
 ██████╗██╗  ██╗ ██████╗  ██████╗ ██████╗ ██╗      █████╗ ████████╗███████╗    
██╔════╝██║  ██║██╔═══██╗██╔════╝██╔═══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝    
██║     ███████║██║   ██║██║     ██║   ██║██║     ███████║   ██║   █████╗      
██║     ██╔══██║██║   ██║██║     ██║   ██║██║     ██╔══██║   ██║   ██╔══╝      
╚██████╗██║  ██║╚██████╔╝╚██████╗╚██████╔╝███████╗██║  ██║   ██║   ███████╗    
 ╚═════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝    
 ██████╗██╗  ██╗██╗██████╗                                                     
██╔════╝██║  ██║██║██╔══██╗                                                    
██║     ███████║██║██████╔╝                                                    
██║     ██╔══██║██║██╔═══╝                                                     
╚██████╗██║  ██║██║██║                                                         
 ╚═════╝╚═╝  ╚═╝╚═╝╚═╝                                                         
 ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗   ██╗████████╗██╗███╗   ██╗ ██████╗    
██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║   ██║╚══██╔══╝██║████╗  ██║██╔════╝    
██║     ██║   ██║██╔████╔██║██████╔╝██║   ██║   ██║   ██║██╔██╗ ██║██║  ███╗   
██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║   ██║   ██║   ██║██║╚██╗██║██║   ██║   
╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ╚██████╔╝   ██║   ██║██║ ╚████║╚██████╔╝   
 ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝      ╚═════╝    ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
" 
echo " 
                                 Scripts for
   ▄██████▄  ███▄▄▄▄   ███    █▄  
  ███    ███ ███▀▀▀██▄ ███    ███ 
  ███    █▀  ███   ███ ███    ███ 
 ▄███        ███   ███ ███    ███ 
▀▀███ ████▄  ███   ███ ███    ███ 
  ███    ███ ███   ███ ███    ███ 
  ███    ███ ███   ███ ███    ███ 
  ████████▀   ▀█   █▀  ████████  
                                    .________.___    .______  .________.___.__  
                                    |    ___/|   |   :      \ |    ___/:   |  \ 
                                    |___    \|   |   |   .   ||___    \|   :   |
                                    |       /|   |/\ |   :   ||       /|   .   |
                                    |__:___/ |   /  \|___|   ||__:___/ |___|   |
                                       :     |______/    |___|   :         |___| 
 __    ____  _  _  __  __  _  _ 
(  )  (_  _)( \( )(  )(  )( \/ )
 )(__  _)(_  )  (  )(__)(  )  ( 
(____)(____)(_)\_)(______)(_/\_)
(and that is the RIGHT WAY of saying it!)
"
echo "To continue, type c. To quit, type q [C/q]"
read -rn1 ans

if [ "${ans:0:1}" = "C" ] || [ "${ans:0:1}" = "c" ]; then
  echo " "
  echo "Continuing..."
  sleep 1
  clear
fi

if [ "${ans:0:1}" = "Q" ] || [ "${ans:0:1}" = "q" ]; then
  clear
  echo "Ok then..."
  echo "                                              
                                   =????==                                      
                                   ?????????=                                   
                                   ???????????=                                 
                               ??? ?????????????=                               
                         ??IIIIII????????????????=                              
                       ??IIIIIIIIIII??????????=???=                             
                     ?IIIIIIIIIIIIIIIII?==?????=???=                            
                    ?IIIIIIIIIIIIIIIIIII??=????=????                            
                   ?IIIIIIIIIIIIIIIIIIIII????.?=????=                           
          =????=  ?IIIIIIIIIIIIIIIIIIIIIII?..?.?????=                           
          ????????=?IIIIIIII??????????. ???? ..?????=                           
          ??????????=?IIII???????????.      .,..?????                           
          ???????????????III?????????.     7  .+.???                            
          ?????????????????..?????????       ...+.?=                            
          =???????????........?????????    +.  ..+??                            
          =???=????.??.7 .++   ?????????   ?.....+.??                           
           =???=??????   ..+.  ??????????   +...?.????                          
            ????==....... ..+  ?????????????  ...????=                          
             ???????..~..=.~.  ?????=??????????=?????=                          
              =??????.?....?   ????=????????==???????=                          
               ==????.?+~+.    ?????==????=??????????=                          
                 ===??.        ????????==???????????=                ?==        
                ?IIII=.        ??????=?????????????=?             =??????=      
                ?IIIII=?.     ????==??????????????==??==        =?????????=     
                ?IIIIII=?????????????????????????==?????=     =????????????=    
                 ?IIIIII=???????????????????????=?????????   =??????????????    
                 ?IIIIIIII====???????????????==????????????==???????????????=   
                  II?IIII=???????=????????=?????????????????=????????????????   
          ??      ?I? ?I??????????====????????????=??????????????????????????   
       ????????=   ??  ????????????????????????????=?????????????????????===    
      =????=?????=   ?=?????????????????????????????=??????????????????=        
     =?????????????? =???????????????????????????????=???????????????=          
    =?????=?????????=??????????????=??????????????????==???????????=            
    ?????????????????=???????????==???????????????????? =????????=              
   ??????????????????=??????????=I=????????????????????=   =???=                
   ???=????????????????????????=III=?????????????????????                       
    ?=?????????????????????????IIII=????????????????????=                       
       ?=???????????????????=IIIIII??????????????????????                       
          =????????????????=?IIIIIII?????????????????????=                      
            =?????????????= ?IIIIIII=????????????????????=                      
              ==?????????=  ??IIIIII=?????????????????????                      
                 =??????=  ?? IIIIII=?????????????????????=                     
                              II?III??????????????????????=                     
                             ?II??III??????????????????????                     
                             ?I? ?II???????????????????????                     
                           ??I?  ?II=??????????????????????=    
"
  echo " "
  echo "Thank you for choosing Chocolate Chip Computing for your new GNU/Linux Experience!"
  sleep 3
  clear
  exit 1
fi


##################
# License Script #
##################
echo "
Debian Newbie Script v0.3.3 beta  Copyright (C) 2015  Chocolate Chip Computing
This program comes with ABSOLUTELY NO WARRANTY; for details type d.
This is free software, and you are welcome to redistribute it
under certain conditions; type c to continue, or d for details, [C/d]
"
read -rn1 ans

if [ "${ans:0:1}" = "D" ] || [ "${ans:0:1}" = "d" ]; then
  echo "
    Debian Newbie Script v0.3.3 beta: A script to optimize a fresh install for Debian Newbies
    Copyright (C) 2015 Chocolate Chip Computing

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    The programmer is available to contact via the IRC channel #Chocolate_Chip
    on the network irc.canternet.org. The programmer can also be contacted
    via email. The email address is chocolatechip@derpymail.org.
"
  echo " "
  sleep 10
  echo "Now continuing..."
  sleep 2
fi

if [ "${ans:0:1}" = "C" ] || [ "${ans:0:1}" = "c" ]; then
  clear
  echo "
    Very well. The license terms can be viewed at
    https://gnu.org/licenses
"
  echo "Now Continuing..."
fi

clear
echo "Now continuing..."

####################
# Confirm Script 1 #
####################
clear
echo " "
echo "The script is starting."
echo " "
if [ "$(whoami)" != "root" ]; then
  echo " "
  echo "Uh oh!"
  echo " "
  echo "You ether did the command wrong, or did not do it at all."
  echo " "
  echo "Please run as root by doing su -m -p -c ./newbie.sh and entering your root password" 
  echo "you chose at install."
  exit 1
fi
echo " "
echo " "
echo "You are running as Root! Thanks!"
sleep 1
clear

####################
# Confirm Script 2 #
####################
echo "Here is a needed disclaimer:"
echo " "
echo "Please remember this is a beta version. This means it has the potential to break your system"
echo " "
echo "You will have to MANUALLY UNDO any changes from this point on!"
echo " "
echo "YOU MUST HAVE A CONSTANT, DECENT ENOUGH INTERNET CONNECTION FOR THIS SCRIPT!!!"
echo "IF NOT, APT-GET WILL TIME OUT AND PORTIONS OF THIS SCRIPT WILL FAIL!!!"
echo " "
echo "YOU MUST ALSO HAVE THIS SCRIPT RUNNING UNDER THE COMMAND"
echo "su -m -p -c"
echo "ANY OTHER COMMAND WILL BREAK IT. IF YOU ENCOUNTER AN ERROR WITH THIS, PREFORM"
echo "su -m -p"
echo "THEN PREFORM THE SCRIPT. IT MUST HAVE THOSE ARGS, -m -p!"
echo " "
echo "YOU MUST ALSO HAVE THIS RUNNING IN A VIRTUAL CONSOLE. IF YOU DO NOT"
echo "YOU WILL BE UNABLE TO RUN THIS SCRIPT PROPERLY. ABORT THIS SCRIPT NOW"
echo "AND PRESS CTRL + ALT + F1 TO SWITCH TO A VIRTUAL CONSOLE!"
echo " "
echo "This will also take a very long time to finish."
echo "Continue? [Y/n]?"
read -rn1 ans

if [ "${ans:0:1}" = "Y" ] || [ "${ans:0:1}" = "y" ]; then
  echo " "
  echo "Now continuing..."
  sleep 1
  clear
fi

if [ "${ans:0:1}" = "N" ] || [ "${ans:0:1}" = "n" ]; then
  clear
  echo " "
  echo "Exiting..."
  sleep 1
  clear
  echo "Thank you for choosing Chocolate Chip Computing for your new GNU/Linux Experience!"
  sleep 1
  clear
  exit 1
fi

######################
# Last begin echo(s) #
######################
clear
echo "This begins the automated portion of this script. If you wish to quit, preform:"
echo "su -c killall newbie.sh"
echo "In a separate terminal. You will have to manually undo anything past this point."
echo " "
echo "Some packages may require additional verification. Please do not go to far away"
echo "From your terminal"
echo " "

##########################################################
# All steps are alphabetical unless order is a necessity #
##########################################################

#################
# Prerequisites #
#################
echo "
# These are your Debian source files. Whenever changing them, preform apt-get update
# or aptitude update. To use non-free packages, add the words contrib non-free to the
# ends of these lines. It is highly recommended that you DO NOT USE NON-FREE PACKAGES.
# These non-free packages contradict the entire GNU Philosophy and are only included for 
# the sake of users who wish to use them. Please do not.

# The MAIN Debian Repo
deb ftp://ftp.debian.org/debian/ jessie main
deb-src ftp://ftp.debian.org/debian/ jessie main

# Debian updates (previously known as Volatile)
deb ftp://ftp.debian.org/debian/ jessie-updates main
deb-src ftp://ftp.debian.org/debian/ jessie-updates main

" > /etc/apt/sources.list

####################
# Begin Automation #
####################
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

####################
# remove other DEs #
####################
apt-get remove --purge -y gnome.
apt-get remove --purge -y kde.
apt-get remove --purge -y xfce.
apt-get remove --purge -y cinnamon.
apt-get remove --purge -y mate.

###########################
# install needed packages #
###########################
apt-get install -y firmware-linux-free
apt-get install -y tar
apt-get install -y zip
apt-get install -y gzip
apt-get install -y git
apt-get install -y apt-transport-http
apt-get install -y apt-transport-https
apt-get install -y aptitude
apt-get install -y build-essential
apt-get install -y sudo
apt-get install -y wget
apt-get install -y ntp
apt-get install -y htop

##################################################################
# Change ftp to http now that apt-transport-http(s) is installed #
##################################################################
echo "
# These are your Debian source files. Whenever changing them, preform apt-get update
# or aptitude update. To use non-free packages, add the words contrib non-free to the
# ends of these lines. It is highly recommended that you DO NOT USE NON-FREE PACKAGES.
# These non-free packages contradict the entire GNU Philosophy and are only included for 
# the sake of users who wish to use them. Please do not.

# The MAIN Debian Repo
deb http://httpredir.debian.org/debian/ jessie main
deb-src http://httpredir.debian.org/debian/ jessie main

# Debian security updates
deb http://security.debian.org/ jessie/updates main
deb-src http://security.debian.org/ jessie/updates main

# Debian updates (previously known as Volatile)
deb http://httpredir.debian.org/debian/ jessie-updates main
deb-src http://httpredir.debian.org/debian/ jessie-updates main


" > /etc/apt/sources.list

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

###########################
# more essential packages #
###########################
apt-get install -y alsa-base
apt-get install -y alsa-base-udeb
apt-get install -y alsa-tools
apt-get install -y alsa-utils
apt-get install -y alsa-utils-udeb
apt-get install -y alsa-tools-gui
apt-get install -y alsamixergui
apt-get install -y pulseaudio
apt-get install -y pavumeter
apt-get install -y pavucontrol
apt-get install -y paprefs
apt-get install -y paman
apt-get install -y telnet
apt-get install -y ssh

####################################################
# install LXDE, remove some bloat, personalization #
####################################################
apt-get install -y --no-install-recommends lxde-core
apt-get install -y --no-install-recommends lxde
apt-get install -y --no-install-recommends lxde-common
apt-get install -y --no-install-recommends task-lxde-desktop 
apt-get install -y lxde-settings-daemon 
apt-get install -y lxde-icon-theme
apt-get install -y lightdm
apt-get remove --purge -y wicd
apt-get install -y alsamixergui
apt-get install -y evince-gtk
apt-get install -y evolution
apt-get install -y gpicview
apt-get install -y iceweasel
apt-get install -y lxpolkit
apt-get install -y menu-xdg
apt-get install -y lxsession
apt-get install -y lxtask
apt-get install -y lxterminal
apt-get install -y lxpanel
apt-get install -y lxappearance
apt-get install -y pcmanfm
apt-get install -y usermode
apt-get install -y xserver-xorg
apt-get install -y xscreensaver
apt-get install -y network-manager
apt-get install -y --no-install-recommends xarchiver
apt-get install -y gtk-chtheme
apt-get install -y gtk-qt-engine
apt-get install -y gtk-smooth-themes
apt-get install -y gtk-theme-config
apt-get install -y gtk-theme-switch
apt-get install -y gtk2-engines
apt-get install -y gtk2-engines-aurora
apt-get install -y gtk2-engines-cleanice
apt-get install -y gtk2-engines-magicchicken
apt-get install -y gtk2-engines-moblin
apt-get install -y gtk2-engines-murrine
apt-get install -y gtk2-engines-nodoka
apt-get install -y gtk2-engines-oxygen
apt-get install -y gtk2-engines-pixbuf
apt-get install -y gtk2-engines-qtcurve
apt-get install -y gtk2-engines-udeb
apt-get install -y gtk2-engines-ubuntulooks
apt-get install -y gtk2-engines-wonderland
apt-get install -y gtk3-engines-oxygen
apt-get install -y clearlooks-phenix-theme
apt-get install -y hunspell-en-us
apt-get install -y hyphen-en-us

####################################
# Add some good, everyday programs #
####################################
apt-get install -y --no-install-recommends aspell
apt-get install -y aspell-en
apt-get install -y gimp
apt-get install -y --no-install-recommends openjdk-7-jdk
apt-get install -y --no-install-recommends openjdk-7-jre
apt-get install -y icedtea-plugin
apt-get install -y leafpad
apt-get install -y libreoffice
apt-get install -y libreoffice-gtk
apt-get install -y nano
apt-get install -y gtk-redshift
apt-get install -y redshift
apt-get install -y screenfetch
apt-get install -y shutter
apt-get install -y deluge
apt-get install -y synaptic
##########################################################################
# Gnash is wget due to it not being in the repo for jessie. Adding the   #
# backported repo would cause too many problems for a n00b               #
##########################################################################
wget http://httpredir.debian.org/debian/pool/main/g/gnash/gnash_0.8.11~git20150419-1~bpo8+1_i386.deb -O /tmp/gnash.deb
wget http://httpredir.debian.org/debian/pool/main/g/gnash/gnash-common_0.8.11~git20150419-1~bpo8+1_i386.deb -O /tmp/gnash-common.deb
##########################################
# This is the Gnash plugin for Iceweasel #
##########################################
wget http://httpredir.debian.org/debian/pool/main/g/gnash/browser-plugin-gnash_0.8.11~git20150419-1~bpo8+1_i386.deb -O /tmp/gnash-plugin.deb
dpkg -i /tmp/gnash.deb
dpkg -i /tmp/gnash-common.deb
dpkg -i /tmp/gnash-plugin.deb
apt-get -f -y install
rm /tmp/gnash.deb
rm /tmp/gnash-common.deb
rm /tmp/gnash-plugin.deb

##################################################
# Cursor Packages                                #
# THESE ARE A DEPENDENCY FURTHER IN THE SCRIPT   #
##################################################
apt-get install -y --no-install-recommends dmz-cursor-theme
apt-get install -y --no-install-recommends x-cursor-theme

######################
# Some privacy tools #
######################
apt-get install -y bleachbit
apt-get install -y gnupg
apt-get install -y keepass2

########################################
# TOR v. 5.0.2 Anonizer Network script #
########################################
apt-get install -y tor
wget https://www.torproject.org/dist/torbrowser/5.0.2/tor-browser-linux32-5.0.2_en-US.tar.xz -O /tmp/tor.tar.xz
tar xvf /tmp/tor.tar.xz -C /opt/tor
rm /tmp/tor.tar.xz
mkdir "$HOME/Desktop/anon"
echo "
                                        .?:..++.                  
77777777777777777777777777777          .:.7,~77                     
77777777777777777777777777777         ?.I:I7:                    
77777777777777777777777777777         III77                     
77777777777777777777777777777         7I77I
77777777777777777777777777777         777+
77777777777777777777777777777      N8~7I:
77777777777777777777777777777      ,..,DM
77777777777777777777777777777       M.:7M                       77777777
         77777777777               ID.:Z$M                   77777777777
         77777777777             :M+.,=777M:                777777777777
         77777777777           ,M8,.,,:.M77$MN             7777777777777
         77777777777        NM,....=.,..M7777MM           77777777777777
         77777777777       =M:....,Z..:M..M77777MN       777777777777777
         77777777777      D8....,N,...~.Z.:7777778M      777777777777777
         77777777777     DN....M.....I~,...87777778M     77777777777
         77777777777     M,..Z,.....O.:,.~,M7777777M?    7777777777
         77777777777    MO..+.....7...:,.,+M7777777$M    7777777777
         77777777777    M,..,...$....,~.8.NM77777777M    7777777777
         77777777777    M,.....M....,$,..,8M77777777M    7777777777
         77777777777    ZM..........M.:..NMM7777777ZM    7777777777
         77777777777     M..$,.,......:M,MNM7777777M     7777777777
         77777777777     ,M..M.M...$..:M.+.M777777MD     7777777777
         77777777777      ,M.,M.$..,..:M.7NZ77777MO      7777777777
         77777777777        MN.D,Z..M.:7M~M7777$M        7777777777
         77777777777          NM+Z~8.MNMMM$7$MM.         7777777777
         77777777777            ?MMMMMMMMM$.             7777777777
                             
                                                              
___________.__             ________         .__               
\__    ___/|  |__   ____   \_____  \   ____ |__| ____   ____  
  |    |   |  |  \_/ __ \   /   |   \ /    \|  |/  _ \ /    \
  |    |   |   Y  \  ___/  /    |    \   |  \  (  <_> )   |  \
  |____|   |___|  /\___  > \_______  /___|  /__|\____/|___|  /
                \/     \/          \/     \/               \/ 
__________               __                                   
\______   \ ____  __ ___/  |_  ___________                    
 |       _//  _ \|  |  \   __\/ __ \_  __ \                   
 |    |   (  <_> )  |  /|  | \  ___/|  | \/                   
 |____|_  /\____/|____/ |__|  \___  >__|                      
        \/                        \/                         

This is the Tor Browser. The Tor browser uses a system of relays named The Onion Network Router. It is designed to 
anonize users. Through an elaborate system, it takes your browser session, routs it through Russia, routes that 
through Germany, roughts that through Scandanavia, routes that back through Russia, and then to the end result. 

Using tor, there are a number of websits that can only be accessed through an extention called .onion.
.onion is like .com, but can only be viewed through the tor network. The Tor goals are to allow countries with
government censorship (like North Korea) to access blocked sites. It also is designed to aid in Governemnt Srevalance systems
to not find browser traffic. 

Tor has been in the news (where they refer to it as the Deep Web) for hosting many illegal activities, such as the now-defunct 
Silk Road Black Market. Just because Tor hosts illegal things does not make it illegal itself. The same could be said for the 
regular W3.

Just because tor is secure does not mean it is unpenertable. There are a number of guidelines that the Tor devs suggest.

* Do not log into accounts bearing your real name while on Tor

* Do not Torrent through the Tor network

* Do not have a connection open before starting the Tor relay

* Do not use email front-ends in the tor browser (i.e. Do not use Gmail from gmail.com)

* Do not frequently visit sites you visit normally. Switch it up

* Whenever possible, use .onion addresses. If a service (such as 8ch.net or duckduckgo) has an 
  .onion service, use that instead

* Do not install additional add-ons to the Tor Browser

I hope you use this, and I hope you use this properly!

To configure it, simply double click the tor icon, wait a few moments, and it will open.
If you wish to remove tor, preform the commands:

apt-get remove --purge tor
rm -r -f /opt/tor

  Copyright (C)  2015  Chocolate Chip Computing.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.

" > "$HOME/Desktop/anon/tor"

##############
# I2P Script #
##############
echo "deb http://deb.i2p2.no/ jessie main
deb-src http://deb.i2p2.no/ jessie main" > /etc/apt/sources.list.d/i2p.list
wget https://geti2p.net/_static/i2p-debian-repo.key.asc -O /tmp/i2p.key.asc
apt-key add /tmp/i2p.key.asc
rm /tmp/i2p.key.asc
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -y --force-yes i2p
apt-get install -y --force-yes i2p-keyring
echo "
._____________________ 
|   \_____  \______   \
|   |/  ____/|     ___/
|   /       \|    |    
|___\_______ \____|    
            \/         

The I2P Network is much like tor, only it is a different, less secure (imho)
network and runs on Java.

Use this as an alternative to tor if you wish. If you want to remove, preform:

rm /etc/apt/sources.list.d/i2p.list
apt-get remove --purge ip2 ip2-keyring

To use this, preform the command

i2prouter

That should start it! You are now connected to the i2p network. You can configure
your settings using the web browser window that pops up.

For more information, see: https://geti2p.net/en/download/Debian#Post-install_work

  Copyright (C)  2015  Chocolate Chip Computing.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.
" > "$HOME/Desktop/anon/i2p"

#######################
# Communication tools #
#######################
apt-get install -y evolution
#####################################################################################
# Hexchat instead of weechat or irissi or IRCii because a GUI is easiest for a n00b #
#####################################################################################
apt-get install -y hexchat

###############
# Media tools #
###############
apt-get install -y vlc
apt-get install -y lame
#####################################################
# DO NOT REMOVE SOX OR VORBIS-TOOLS FROM THIS LIST. #
# IT IS A DEPENDENCY FURTHER IN THE SCRIPT          #
#####################################################
apt-get install -y sox
apt-get install -y vorbis-tools

##########################################################
# remove some other packages that (may) come pre-bundled #
##########################################################
apt-get remove --purge -y clipit
apt-get remove --purge -y dillo
apt-get remove --purge -y konqureor
apt-get remove --purge -y kmail
apt-get remove --purge -y konsole
apt-get remove --purge -y deluge
apt-get remove --purge -y vim
apt-get remove --purge -y vim-common

########################################
# qTox, the skype replacement's script #
########################################
echo "deb https://pkg.tox.chat/debian nightly release" > /etc/apt/sources.list.d/tox.list
wget https://pkg.tox.chat/debian/pkg.gpg.key -O /tmp/pkg.gpg.key
apt-key add /tmp/pkg.gpg.key
rm /tmp/pkg.gpg.key
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -y --force-yes qtox
mkdir /usr/share/icons/qTox
wget https://wiki.tox.chat/lib/tpl/vector/user/logo.png -O /usr/share/icons/qTox/qTox.png
echo "
 
                       MMMM                                     
                  MMMMMMMMMMMMMMM                                 
                MMMMMMMMMMMMMMMMMMM                               
              MMMMMMMMMMMMMMMMMMMMMM                              
             MMMMMM             MMMMM                            
           MMMMMM                MMMMM                          
          MMMMMM                  MMMMM                           
          MMMMM                    MMMMM                         
          MMMMM                    MMMMM                          
          MMMMM                     MMMM                         
          MMMMM                     MMMM                          
          MMMMMM                   MMMMM                          
          MMMMMMM                 MMMMMM                          
          NMMMMMMM               MMMMMMM                          
          MMMMMMMMM            MMMMMMMMM                          
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                 
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMMM      MMMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMM        MMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMM          MMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMM          MMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMM        MMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMMMM    MMMMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMMMN        MMMMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMM            MMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMM            MMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMM            MMMMMMMMMMMMMMMMMMM                
MMMMMMMMMMMMMMMMMM            MMMMMMMMMMMMMMMMMMM    ______               
MMMMMMMMMMMMMMMMMM            MMMMMMMMMMMMMMMMMMM   /_  __/___  _  __              
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    / / / __ \| |/_/          
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM   / / / /_/ />  <              
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  /_/  \____/_/|_|              
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                
                 
Tox is an experimental replacement to Skype. Using an encrypted 
end to end P2P network, with a decentralized system, Tox provides
safe, encrypted messages back and forth. Tox can be integrated with
Tor as well, for more security.

The Tox service itself has many implimentations. Of these are qTox
(which this script installs), uTox, a lighter-weight qTox, and Toxic,
a terminal-based implimentation.

Because Tox is decentralized, a random key is generated for each user.
This key is completly random, and is hard to remember. To aid in this,
the Tox People have provided a service. At toxme.io, you can enter your
Tox ID and have it assigned to an email-looking address. For example:

My Tox ID is B28EEFF6E84E2A360FF62233F390CF6E994FC71CC3ECFD8F9AA799CA66A97B3C38B0ECAC24EF

Using the Toxme.io service, my Tox ID is: chocolate_chip@toxme.io

Simple, right? Anyone can send you a friend request if they have your ID. 
Tox is just like Skype with the excweption it runs fast, it is not malware,
it is not spyware, and it is actually useable. 

A problem that exists because it is decentralized, however, is that you need
to back up your tox database. If for whatever reason you need to reinstall your 
system, or need to do whatever, there is no way to get back your account (unless
you still have your toxme.io password. Then you can change the Tox ID assosiated
with your account and then boom! You are done.

A friend of mine, under the online alias Candy Gumdrop (fellow furry/brony) 
is a co-developer of uTox. Boy, is he mad that I use qTox. I feel that I should
include some of his points to be fair. 

Reasons to choose uTox over qTox:

* Lightweight and memory efficient

* Tab completion

* QT-type style themes

Now, reasons to choose qTox over uTox:

* More features

* Better (at the current time) integration to the tox network

* Slightly improved UI

The choice is yours. You can apt-get utox.

To remove qtox, and replace it with utox, prefom the command
sudo apt-get remove --purge qtox
sudo apt-get install utox

To remove tox completly, preform
sudo rm /etc/apt/sources.list.d/tox.list
sudo apt-get remove --purge qtox utox toxic

  Copyright (C)  2015  Chocolate Chip Computing.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.

" > "$HOME/Desktop/anon/Tox"


################
# Shutter Docs #
################
mkdir "$HOME/Desktop/tools"
echo "
Shutter is a tool much like Snipping Tool for Windows Vista and later. Using shutter, you can easily make screenshots.

Simply open shutter, click selection, select, and press enter. You have now taken a screenshot. The default save place is
inside ~/Pictures/. To change this, go to Edit>Prefrences> Find Save, and change the settings as you wish. 

Just like the Snipping tool in Windows, you can edit the screenshots using a built in editor with an easy to use interface.

  Copyright (C)  2015  Chocolate Chip Computing.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.
" > "$HOME/Dekstop/tools/Shutter"

###################
# Redshift script #
###################
echo "
██████╗ ███████╗██████╗ ███████╗██╗  ██╗██╗███████╗████████╗
██╔══██╗██╔════╝██╔══██╗██╔════╝██║  ██║██║██╔════╝╚══██╔══╝
██████╔╝█████╗  ██║  ██║███████╗███████║██║█████╗     ██║   
██╔══██╗██╔══╝  ██║  ██║╚════██║██╔══██║██║██╔══╝     ██║   
██║  ██║███████╗██████╔╝███████║██║  ██║██║██║        ██║   
╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝ 

These are instructions for using Redshift. Redshift is a software program that allows the computer monitor to adjust its colors
based on the time of day it is. Redshift has been said to help eye strain and to aid in people going to sleep on time!

To start, you must make a config file. My own configuration is:

; Global settings for redshift
[redshift]
; Set the day and night screen temperatures
temp-day=5700
temp-night=2900

; Enable/Disable a smooth transition between day and night
; 0 will cause a direct change from day to night screen temperature.
; 1 will gradually increase or decrease the screen temperature.
transition=1

; Set the screen brightness. Default is 1.0.
;brightness=0.9
; It is also possible to use different settings for day and night
; since version 1.8.
;brightness-day=0.7
;brightness-night=0.4
; Set the screen gamma (for all colors, or each color channel
; individually)
gamma=0.8
;gamma=0.8:0.7:0.8
; This can also be set individually for day and night since
; version 1.10.
;gamma-day=0.8:0.7:0.8
;gamma-night=0.6

; Set the location-provider: geoclue, geoclue2, manual
; type 'redshift -l list' to see possible values.
; The location provider settings are in a different section.
location-provider=manual

; Set the adjustment-method: 'randr', 'vidmode'
; type 'redshift -m list' to see all possible values.
; 'randr' is the preferred method, 'vidmode' is an older API.
; but works in some cases when 'randr' does not.
; The adjustment method settings are in a different section.
adjustment-method=vidmode

; Configuration of the location-provider:
; type 'redshift -l PROVIDER:help' to see the settings.
; ex: 'redshift -l manual:help'
; Keep in mind that longitudes west of Greenwich (e.g. the Americas)
; are negative numbers.
[manual]
lat=[omited]
lon=[omited]

; Configuration of the adjustment-method
; type 'redshift -m METHOD:help' to see the settings.
; ex: 'redshift -m randr:help'
; In this example, randr is configured to adjust screen 1.
; Note that the numbering starts from 0, so this is actually the
; second screen. If this option is not specified, Redshift will try
; to adjust _all_ screens.
[randr]
screen=1


You don't need to use this exactly as it is here, though. You notice that it asks for latitude and longitudes. What it needs is a decimal 
number for your zip code. You can easily find this information on the internet. What I suggest you do is make a folder in ~/.config called 
Redshift. Then make a file called Redshift.conf. Paste the above example configuration into the new file, and then save. Now, to make 
redshift use this file, import using the command:

redshift -c ~/.config/Redshift/Redshift.conf

Now whenever redshift starts, it will use that configuration! To remove redshift, do 

sudo apt-get remove –purge redshift gtk-redshift

And remove it from ~/.config/xsession/LXDE/autostart file.

  Copyright (C)  2015  Chocolate Chip Computing.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.
" > "$HOME/Desktop/tools/Redshift"


#################
# MASTER README #
#################
echo "
 ██████╗██╗  ██╗ ██████╗  ██████╗ ██████╗ ██╗      █████╗ ████████╗███████╗    
██╔════╝██║  ██║██╔═══██╗██╔════╝██╔═══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝    
██║     ███████║██║   ██║██║     ██║   ██║██║     ███████║   ██║   █████╗      
██║     ██╔══██║██║   ██║██║     ██║   ██║██║     ██╔══██║   ██║   ██╔══╝      
╚██████╗██║  ██║╚██████╔╝╚██████╗╚██████╔╝███████╗██║  ██║   ██║   ███████╗    
 ╚═════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝    
 ██████╗██╗  ██╗██╗██████╗                                                     
██╔════╝██║  ██║██║██╔══██╗                                                    
██║     ███████║██║██████╔╝                                                    
██║     ██╔══██║██║██╔═══╝                                                     
╚██████╗██║  ██║██║██║                                                         
 ╚═════╝╚═╝  ╚═╝╚═╝╚═╝                                                         
 ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗   ██╗████████╗██╗███╗   ██╗ ██████╗    
██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║   ██║╚══██╔══╝██║████╗  ██║██╔════╝    
██║     ██║   ██║██╔████╔██║██████╔╝██║   ██║   ██║   ██║██╔██╗ ██║██║  ███╗   
██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║   ██║   ██║   ██║██║╚██╗██║██║   ██║   
╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ╚██████╔╝   ██║   ██║██║ ╚████║╚██████╔╝   
 ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝      ╚═════╝    ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                                  

______         _          _           _        _ _  
| ___ \       | |        (_)         | |      | | | 
| |_/ /__  ___| |_ ______ _ _ __  ___| |_ __ _| | | 
|  __/ _ \/ __| __|______| |  _ \/ __| __/ _  | | | 
| | | (_) \__ \ |_       | | | | \__ \ || (_| | | | 
_________/|___/\__|  _   |_|_| |_|___/\__\__,_|_|_| 
| ___ \             | |               _             
| |_/ /___  __ _  __| | _ __ ___  ___(_)            
|    // _ \/ _  |/ _  |  _   _  \/ _ \              
| |\ \  __/ (_| | (_| | | | | | |  __/_             
\_| \_\___|\__,_|\__,_|_| |_| |_|\___(_)            
                                                    
                                                   
If you are reading this, you have successfully installed my script! Good job!

Make sure to delete these extra files and folders after you are finished with them. 
You will need to find documentation for all the things this has installed. 
If you do not want a package that this script has installed, preform the command 

sudo apt-get remove --purge [packageName]. 

Periodically preform the commands 

sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

I have added LXDE to this script as I use it myself, it is much like the old Windows interface, 
and it is just good for beginners, in my humble opinion. You can pick another one once you know what you are doing, I guess.

To configure your network, use the command nmtui. This is the network-manager terminal interface.

I have included a large number of wallpapers for you to choose from. If you want to remove the current 
wallpaper, then do:

sudo rm $HOME/Pictures/.wallpapers/4Chin.png

I suggest putting all backgrounds in this folder. To remove more wallpapers, do

sudo rm -f $HOME/Pictures/.wallpaper/[wallpaper name here]

I do not know who to credit for the wallpaper except for the LAIN, clip-clop, the 2 GNU ones, and Vinyl. 

Credit goes to http://fauux.neocities.org/, Pokehidden, https://gnu.org/graphics and
https://absentparachute.deviantart.com/art/Vinyl-Scratch-Dj-PoN-3-Wallpaper-288095937

http://gnu.org/graphics is also where a large number of ASCII art in the script came from. The rest
came from an ASCII Art generator. I do not remember where Mario came from.

Soon, I will be writing more documentation for all the packages I installed, made for the point of view of n00bs.

I have not included non-free/propitiatory packages in here for a reason. That reason is that they are evil. Find out why at:

https://gnu.org/philosophy

If you see any non-free/propitiatory packages in this script, contact me immediately at the email address

chocolatechip@derpymail.org

Please send all bug reports (and any questions) there as well. A PGP key can be found at:

https://choco.neocities.org/pgp

I can also be contacted at the IRC channel #Chocolate_Chip at irc.canternet.org (SSL Port 6697)
(HINT: Use the hexchat package this script installs)
(Other Hint: Try copying irc://irc.canternet.org:+6697/Chocolate_Chip into Iceweasel.)

No matter what, avoid skype and facebook:
https://stallman.org/skype.html

https://stallman.org/facebook.html

And always refer to your OS as GNU/Linux unless referring to the kernel itself!

Thanks again for using my script! If you like it, how about giving me some COMPLETLY OPTIONAL donations?

Bitcoin: 1H3gZJnZbraG6Nsg8QodB9CUBEPhjhrVUt
PayPal: Coming Soon
Cash Donations: P.O. Box comming soon

  Copyright (C)  2015  Chocolate Chip Computing.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.
" > "$HOME/Desktop/README"

############
# GPG Doc  #
############
echo "
   _______   ____  ____________                                            
  / ____/ | / / / / / ____/ __ \                                           
 / / __/  |/ / / / / / __/ /_/ /                                           
/ /_/ / /|  / /_/ / /_/ / ____/                                            
\______/ |_/\__________/_/            ____    _ __                         
   /   |     / ____/_______  ___    _/_/ /   (_) /_  ________              
  / /| |    / /_  / ___/ _ \/ _ \ _/_// /   / / __ \/ ___/ _ \             
 / ___ |   / __/ / /  /  __/  __//_/ / /___/ / /_/ / /  /  __/             
/_/ ____  __________  \________/_/  /_____/_/_.___/_/   \____  _           
   / __ \/ ____/ __ \   / ____/___  ____________  ______  / /_(_)___  ____ 
  / /_/ / / __/ /_/ /  / __/ / __ \/ ___/ ___/ / / / __ \/ __/ / __ \/ __ \
 / ____/ /_/ / ____/  / /___/ / / / /__/ /  / /_/ / /_/ / /_/ / /_/ / / / /
/_/_________/_/_ __  /_____/_/ /_/\___/_/   \__, / .___/\__/_/\____/_/ /_/ 
  / ___/__  __(_) /____                    /____/_/                        
  \__ \/ / / / / __/ _ \                                                   
 ___/ / /_/ / / /_/  __/                                                   
/____/\__,_/_/\__/\___/                                                                                                                    
                                                                                                                      

This is the documentation for GPG. GPG (full name GNUPG) is a free/Libre version of the PGP encryption
algorithm. Commonly used for email, it can also be used to encrypt files. 

To use PGP, you must first create a key. To do this, preform the command

gpg --gen-key

This will begin the process. It is recommended you make your key the maximum amount of characters the program allows. 
It will ask you a few questions that you should answer honestly. There is little to no point not to. An example:

Expire: 3m
Full name: Dustin M. Shappee
email: chocolatechip@derpymail.org
comment: Chocolate D. Chip
pass-phrase: [secret pass-phrase here]

Using this, I have configured a key to be valid for 3 months, to be registered as my real name (and my online alias) and have configured a 
secret password (I recommend getting one from http://securepasswordgenerator.com).

The signature looks something like this:

Dustin M. Shappee (ChocolateChip@derpymail.org) <chocolatechip@derpymail.org>
PUB: 246810 SIG: 1357911 created: 09-10-15 NextCheck: 11-10-15

After you enter this information, will generate the key. It might seem odd that it asks you to move the mouse and type random keys, 
but it is all for the sake of generating random numbers for your key.

Now, after that has finished, to export your key, preform the command

gpg --armor --output pubkey.txt --export [Your Name]

(the --armor part is pretty important because it is what converts your key to text) Then give your friends your key so they know it is yours.

Now, open Evolution. Evolution needs little configuring for PGP.  (but you will need to configure it to use your email, obviously.)
Preform the command:

gpg --list-sigs

Find the one you just made, copy the SEC (Secret) key, and add it to edit > Preferences > (your account) > edit > Security > Open PGP Key ID.

Paste the PUB key there. Select the three options below it. It works better if you add 0x to the key. For example, A832111 would become 
0xA83211.

Then, start composing an email for the account you made an email to. Go to the settings and select PGP Sign. This will make your message 
signed with your PGP Signature. Make the recipient one of your friends. Have him preform the same steps to get a PGP key. Send him a message
 with your signature signed. Then have him send you a message signed. Then, once you get his signature, import it using 

gpg --import
[paste pgp key]
then press ctrl + D

Now, go back to your email, and select PGP Encrypt and PGP Sign. Send another email to your friend. This will arrive to him encrypted. 
Now have him reply to the message with another encrypted message. Congratulations, you have sent a PGP Encrypted message. 

Some tips:
Encrypt whenever possible. If you only encrypt certain things, the surveillance programs will take extra notice to the ones you are 
encrypting.

Don't automatically trust something just because it has been PGP Signed/Encrypted. Anyone can make a PGP key. People can also make 
fraudulent keys using your email address. That is why it is important to make your keys expire in a short amount of time, and also post your 
keys to a site your friends can trust.

Thank you for reading this tutorial. 

Don't be a Hillary. Use PGP.

    Copyright (C)  2015  Chocolate Chip Computing
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.

" > "$HOME/Desktop/anon/GPG"

#######################
# Iceweasel downloads #
#######################
mkdir "$HOME/Desktop/iceweasel-plugins"

echo "
 ###                                                         
  #   ####  ###### #    # ######   ##    ####  ###### #      
  #  #    # #      #    # #       #  #  #      #      #      
  #  #      #####  #    # #####  #    #  ####  #####  #      
  #  #      #      # ## # #      ######      # #      #      
  #  #    # #      ##  ## #      #    # #    # #      #      
 ###  ####  ###### #    # ###### #    #  ####  ###### ######

              __                                 ______ _           __          
     /\      / _|                               |  ____(_)         / _|         
    /  \    | |_ _ __ ___  ___ ______ ___ _ __  | |__   _ _ __ ___| |_ _____  __
   / /\ \   |  _|  __/ _ \/ _ \______/ _ \  __| |  __| | |  __/ _ \  _/ _ \ \/ /
  / ____ \  | | | | |  __/  __/     |  __/ |    | |    | | | |  __/ || (_) >  < 
 /_/    \_\ |_| |_|  \___|\___|      \___|_|    |_|    |_|_|  \___|_| \___/_/\_\

Iceweasel is a Debian fork of Firefox. While not an exact clone, it keeps true and up
to date on the Official Firefox code. Iceweasel removes a number of features in the 
official Firefox, for the better. It removes DRM, many Phone-Home features, and some 
other needless features. Iceweasel is fast as well.

Contained in this folder are for your Iceweasel installation. Please add them using 
the add-on menu. The plugin called Shumway is an optional replacment for the gnash 
browser plugin that this script provides. I highly suggest you do not use it. It is
very broken, not yet good for n00bs, laggy, etc. However, once the plugin is fixed, 
I suggest using it over gnash. Both are only for swf files. These are not for other 
flash formats, such as flv. Also, I suggest using https://github.com/CrisBRM/user.js

Once you become a more advance user, I suggest switching over to GNU Icecat. Icecat
is another firefox fork made by the GNU Foundation themselves. Be forewarned: it is
kinda slow, and buggy. Iceweasel is just fine for a n00b. 

There are no major differences in useability for Iceweasel and any other browsers
you have most likley used, with the exception it is possibly faster, it is not yet
at the same HTML5 support level as Google Chrome, and does not have full Adobe Flash
support (though Flash is kill, evil, and created a downfall of the internet circa 
2001.)

I hope you enjoy Iceweasel, and the plugins I have provided you. Please do not use
Google Chrome or Chromium. It is a botnet. (Botnet is /g/ slang for Spyware. It is seldom
used under its origional definition now.)

    Copyright (C)  2015  Chocolate Chip Computing
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.
" > "$HOME/Desktop/iceweasel-plugins/README"

wget https://mozilla.github.io/shumway/extension/firefox/shumway.xpi -O "$HOME/Desktop/iceweasel-plugins/shumway.xpi"
wget https://addons.mozilla.org/firefox/downloads/latest/6623/addon-6623-latest.xpi -O "$HOME/Desktop/iceweasel-plugins/privacy.xpi"
wget https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi -O "$HOME/Desktop/iceweasel-plugins/uBlock-Origin.xpi"
wget https://mega.nz/meganz.xpi -O "$HOME/Desktop/iceweasel-plugins/mega.xpi"
apt-get install -y xul-ext-https-finder
apt-get install -y xul-ext-https-everywhere

#########################
# LXDE startup modifier #
#########################
mkdir "$HOME/Desktop/startup"
mkdir "$HOME/Music/.startup"
wget http://www.windows93.net/c/sys/boot/boot.ogg -O "$HOME/Music/.startup/startup.ogg"

#####################################################################################################
# The reason that an amixer command is in this file is because an odd error occurred where when     #
# I started my computer, sound would be muted. Feel free to remove it if you wish. I do not know if # 
# it is just due to my hardware, or something else. This command fixes it for me though.            #
#####################################################################################################

echo "
@amixer sset Master unmute
@play -t ogg -v 0.40 ~/Music/.startup/startup.ogg
@redshift-gtk
@qtox
@lxpanel --profile LXDE
@pcmanfm --desktop --profile LXDE
@xscreensaver -no-splash" > "$HOME/.config/lxsession/LXDE/autostart"

##################
# Startup Readme #
##################
echo "
 /$$       /$$   /$$ /$$$$$$$  /$$$$$$$$
| $$      | $$  / $$| $$__  $$| $$_____/
| $$      |  $$/ $$/| $$  \ $$| $$      
| $$       \  $$$$/ | $$  | $$| $$$$$   
| $$        >$$  $$ | $$  | $$| $$__/   
| $$       /$$/\  $$| $$  | $$| $$      
| $$$$$$$$| $$  \ $$| $$$$$$$/| $$$$$$$$
|________/|__/  |__/|_______/ |________/

 _____ _             _                
/  ___| |           | |               
\  --.| |_ __ _ _ __| |_ _   _ _ __   
  --. \ __/ _  |  __| __| | | |  _ \  
/\__/ / || (_| | |  | |_| |_| | |_) | 
\____/ \__\__,___|   \__|\__,_| .__/  
              (_)     | |     | |     
 ___  ___ _ __ _ _ __ | |_ ___|_|     
/ __|/ __|  __| |  _ \| __/ __|        
\__ \ (__| |  | | |_) | |_\__ \       
|___/\___|_|  |_| .__/ \__|___/       
                | |                   
                |_|                  

If you don't like the startup sound I added, delete it using

sudo rm -r -f ~/Music/.startup

and remove it from your ~/.config/lxsession/LXDE/auotstart file.

THe startup sound, if you can't identify it for whatever reason (which 
I would personally find odd) is the origional startup sound to the 
Sony Playstation (tm) Game system. 

NOTE: I AM NOT AFFILIATED WITH THE WINDOWS 93 JOKE SITE. The startup sound
came from them. You should check them out though. Pretty cool. There is a 
v2 version now in beta that allows you to use it as an actual computer inteface,
with local saved files.

I also added a few more things to the ~/.config/lxsession/LXDE/auotstart file. If
you want to remove any program from starting up, go there. The @ means any thing 
that can be run with a simple comamnd. Anything else that can't be run using a simple 
comamnd is a bit more dificult. You shouldn't add anything there that can not be run as
a simple command. It would be to hard for a n00b.

  Copyright (C)  2015  Chocolate Chip Computing.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is avalible at http://gnu.org/licences.

" > "$HOME/Desktop/startup/README"

#############################################
# Make desktop defaults, design, background #
#############################################
echo "[Session]
window_manager=openbox-lxde
windows_manager/command=openbox
windows_manager/session=LXDE
disable_autostart=no
polkit/command=lxpolkit
clipboard/command=lxclipboard
xsettings_manager/command=build-in
proxy_manager/command=build-in
keyring/command=ssh-agent
quit_manager/command=lxsession-logout
quit_manager/image=/usr/share/lxde/images/logout-banner.png
quit_manager/layout=top
lock_manager/command=lxlock
terminal_manager/command=lxterminal
launcher_manager/command=lxpanelctl
webbrowser/command=iceweasel
video_player/command=/usr/bin/vlc
audio_player/command=/usr/bin/vlc
image_display/command=gpicview
bittorent/command=deluge
tasks/command=lxtask
document/command=libreoffice
text_editor/command=leafpad
im1/command=srg
file_manager/command=pcmanfm
network_gui/command=nmtui
im2/autostart=true

[GTK]
sNet/ThemeName=Clearlooks
sNet/IconThemeName=nuoveXT2
sGtk/FontName=Sans 10
iGtk/ToolbarStyle=3
iGtk/ButtonImages=1
iGtk/MenuImages=1
iGtk/CursorThemeSize=18
iXft/Antialias=1
iXft/Hinting=1
sXft/HintStyle=hintfull
sXft/RGBA=rgb
iNet/EnableEventSounds=1
iNet/EnableInputFeedbackSounds=1
sGtk/ColorScheme=
iGtk/ToolbarIconSize=3
sGtk/CursorThemeName=Adwaita

[Mouse]
AccFactor=20
AccThreshold=13
LeftHanded=0

[Keyboard]
Delay=357
Interval=25
Beep=1

[State]
guess_default=true

[Dbus]
lxde=true

[Environment]
menu_prefix=lxde-" > "$HOME/.config/lxsession/LXDE/desktop.conf"

echo "[special_cases]
synaptic=synaptic-pkexec
soffice.bin=libreoffice
x-terminal-emulator=lxterminal" > "$HOME/.config/lxpanel/launchtaskbar.cfg"

echo "
# lxpanel <profile> config file. Manually editing is not recommended.
# Use preference dialog in lxpanel to adjust config when you can.

Global {
  edge=bottom
  allign=center
  margin=0
  widthtype=percent
  width=100
  height=28
  transparent=1
  tintcolor=#c900ff
  alpha=60
  setdocktype=0
  setpartialstrut=1
  usefontcolor=1
  fontcolor=#ffffff
  background=0
  backgroundfile=/usr/share/lxpanel/images/background.png
  iconsize=23
}
Plugin {
  type=space
  Config {
    Size=3
  }
}
Plugin {
  type=menu
  Config {
    image=/usr/share/lxde/images/lxde-icon.png
    system {
    }
    separator {
    }
    item {
      command=run
    }
    separator {
    }
    item {
      image=gnome-logout
      command=logout
    }
  }
}
Plugin {
  type=launchbar
  Config {
    Button {
      id=pcmanfm.desktop
    }
    Button {
      id=menu://applications/Internet/iceweasel.desktop
    }
    Button {
      id=menu://applications/System/lxterminal.desktop
    }
    Button {
      id=menu://applications/Accessories/shutter.desktop
    }
  }
}
Plugin {
  type=space
  Config {
    Size=4
  }
}
Plugin {
  type=wincmd
  Config {
    Button1=iconify
    Button2=shade
  }
}
Plugin {
  type=space
  Config {
    Size=4
  }
}
Plugin {
  type=pager
  Config {
  }
}
Plugin {
  type=taskbar
  Config {
    tooltips=1
    IconsOnly=0
    AcceptSkipPager=1
    ShowIconified=1
    ShowMapped=1
    ShowAllDesks=0
    UseMouseWheel=1
    UseUrgencyHint=1
    FlatButton=0
    MaxTaskWidth=150
    spacing=1
    SameMonitorOnly=1
    GroupedTasks=1
  }
  expand=1
}
Plugin {
  type=space
  Config {
    Size=2
  }
  expand=1
}
Plugin {
  type=volumealsa
  Config {
  }
}
Plugin {
  type=cpu
  Config {
  }
}
Plugin {
  type=tray
  Config {
  }
}
Plugin {
  type=dclock
  Config {
    ClockFmt=%r
    TooltipFmt=%A %x
    BoldFont=0
    IconOnly=0
    CenterText=0
  }
}
Plugin {
  type=launchbar
  Config {
    Button {
      id=lxde-screenlock.desktop
    }
    Button {
      id=lxde-logout.desktop
    }
  }
}
 " > "$HOME/.config/lxpanel/LXDE/panels/panel"

#################
# Desktop Icons #
#################

###########
# Hexchat #
###########
echo "[Desktop Entry]
Name=HexChat
Name[en_GB]=HexChat
GenericName=IRC Client
GenericName[en_GB]=IRC Client
Exec=hexchat %U
Icon=hexchat
Terminal=false
Type=Application
Categories=GTK;Network;IRCClient;
StartupNotify=true
X-GNOME-UsesNotifications=true
MimeType=x-scheme-handler/irc;x-scheme-handler/ircs;
Actions=SafeMode;

[Desktop Action SafeMode]
Name=Open Safe Mode
Name[en_GB]=Open Safe Mode
Exec=hexchat --no-auto --no-plugins" > "$HOME/Desktop/hexchat.desktop"

###########
# Keepass #
###########
echo "[Desktop Entry]
Name=KeePass2
GenericName=Password manager
Exec=keepass2
Icon=keepass2
Terminal=false
Type=Application
StartupNotify=false
Categories=Utility;
MimeType=application/x-keepass2;" > "$HOME/Desktop/Keepass.desktop"

#############
# Iceweasel #
#############
echo "
[Desktop Entry]
Encoding=UTF-8
Name=Iceweasel
Comment=Browse the World Wide Web
GenericName=Web Browser
X-GNOME-FullName=Iceweasel Web Browser
Exec=iceweasel %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=iceweasel
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Iceweasel
StartupNotify=true" > "$HOME/Desktop/Iceweasel.desktop"

#######
# VLC #
#######
echo "[Desktop Entry]
Version=1.0
Name=VLC media player
GenericName=Media player
Comment=Read, capture, broadcast your multimedia streams
Exec=/usr/bin/vlc --started-from-file %U
TryExec=/usr/bin/vlc
Icon=vlc
Terminal=false
Type=Application" > "$HOME/Desktop/vlc.desktop"

########
# qtox #
########
echo '[Desktop Entry]
Name=qTox
GenericName=Tox
Exec=qtox
Icon=/usr/share/icons/qTox/qTox.png
Terminal=false
Type=Application
StartupNotify=false' > "$HOME/Desktop/qTox.desktop"

#######
# Tor #
#######
echo '[Desktop Entry]
Name=Tor
GenericName=Tor, the Onion Browser
Exec=/opt/tor/tor-browser_en-US/Browser/start-tor-browser.desktop
Icon=/opt/tor/tor-browser_en-US/Browser/browser/icons/mozicon128.png
Terminal=false
Type=Application
StartupNotify=false' > "$HOME/Desktop/tor.desktop"

#############
# Evolution #
#############
echo '[Desktop Entry]
Name=Evolution
GenericName=Groupware Suite
X-GNOME-FullName=Evolution Mail and Calendar
Comment=Manage your email, contacts and schedule
Exec=evolution %U
Icon=evolution
Terminal=false
Type=Application
Categories=GNOME;GTK;Office;Email;Calendar;ContactManagement;X-Red-Hat-Base;
StartupNotify=true
MimeType=text/calendar;text/x-vcard;text/directory;application/mbox;message/rfc822;x-scheme-handler/mailto;
' > "$HOME/Desktop/evolution.desktop"

######################
# Desktop background #
######################
mkdir "$HOME/Pictures/.wallpaper"
wget https://choco.neocities.org/Pics/background1.jpg -O "$HOME/Pictures/.wallpaper/Blue Ripple.jpg"
wget https://choco.neocities.org/Pics/background2.jpg -O "$HOME/Pictures/.wallpaper/4Chin1.jpg"
wget https://choco.neocities.org/Pics/background3.jpg -O "$HOME/Pictures/.wallpaper/4Chin2.jpg"
wget https://choco.neocities.org/Pics/background4.jpg -O "$HOME/Pictures/.wallpaper/Vinyl.jpg"
wget https://choco.neocities.org/Pics/background5.png -O "$HOME/Pictures/.wallpaper/LAIN.png"
wget https://choco.neocities.org/Pics/background6.jpeg -O "$HOME/Pictures/.wallpaper/Oh Noes.jpeg"
wget https://choco.neocities.org/Pics/background7.jpg -O "$HOME/Pictures/.wallpaper/Dino.jpg"
wget http://www.pokehidden.net/banned_from_equestria_daily/wallpaper.jpg -O "$HOME/Pictures/.wallpaper/Clip Clop.jpg"
wget https://gnu.org/graphics/gnu-linux-color-wallpaper.png -O "$HOME/Pictures/.wallpaper/GNU+Linux.png"
wget https://gnu.org/graphics/gnuemacsref.png -O "$HOME/Pictures/.wallpaper/Emacs.png"

echo "
[*]
wallpaper_mode=stretch
wallpaper_common=1
wallpaper=$HOME/Pictures/.wallpaper/4Chin2.jpg
desktop_bg=#000000
desktop_fg=#ffffff
desktop_shadow=#000000
desktop_font=Sans 12
show_wm_menu=0
sort=mtime;ascending;
show_documents=1
show_trash=1
show_mounts=0

[trash:///]
x=1349
y=791" > "$HOME/.config/pcmanfm/LXDE/desktop-items-0.conf"

###############
# Final steps #
###############
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get -f -y install
apt-get autoremove --purge -y
apt-get autoclean
usermod -aG sudo "$USER"
dpkg-reconfigure ntp
amixer sset Master unmute
alsactl store
update-menus
#####################################################################
# Keep this in please!                                              #
# Sometimes when LightDM is installed, that file becomes corrupted. #
#####################################################################
mv "$HOME/.Xauthority" "$HOME/.Xauthority.old"

#######
# End #
#######
clear
echo " "
echo "The script has finished"
echo " "
echo "Please check the new desktop folders for additional information"
echo " "
echo "Thank you for choosing Chocolate Chip Computing for your new GNU/Linux Experience!"
echo " "
echo "This script has been created by Chocolate Chip"
echo "http://choco.neocities.org"
echo "On GNU Social under the name @duchocolatepony@quitter.se"
echo " "
echo "Support the FSF by saying Free/Libre instead of Open Source!"
echo "And always say GNU/Linux when referring to the OS and not the Linux kernel!"
echo " "
echo "You may now safely restart your computer"
echo " "
echo "
▒▒▒▒▒▒▒▒▒▄▄▄▄▒▒▒▒▒▒▒    _________          _______ _________     
▒▒▒▒▒▒▄▀▀▓▓▓▀█▒▒▒▒▒▒    \__   __/|\     /|(  ___  )\__   __/ 
▒▒▒▒▄▀▓▓▄██████▄▒▒▒▒       ) (   | )   ( || (   ) |   ) ( 
▒▒▒▄█▄█▀░░▄░▄░█▀▒▒▒▒       | |   | (___) || (___) |   | |
▒▒▄▀░██▄░░▀░▀░▀▄▒▒▒▒       | |   |  ___  ||  ___  |   | |              
▒▒▀▄░░▀░▄█▄▄░░▄█▄▒▒▒       | |   | (   ) || (   ) |   | |  
▒▒▒▒▀█▄▄░░▀▀▀█▀▒▒▒▒▒       | |   | )   ( || )   ( |   | |  
▒▒▒▄▀▓▓▓▀██▀▀█▄▀▀▄▒▒       )_(   |/     \||/     \|   )_(    
▒▒█▓▓▄▀▀▀▄█▄▓▓▀█░█▒▒
▒▒▀▄█░░░░░█▀▀▄▄▀█▒▒▒     _______ __________________ _______  
▒▒▒▄▀▀▄▄▄██▄▄█▀▓▓█▒▒    (  ___  )\__   __/\__   __/(  ___  ) 
▒▒█▀▓█████████▓▓▓█▒▒    | (   ) |   ) (      ) (   | (   ) |  
▒▒█▓▓██▀▀▀▒▒▒▀▄▄█▀▒▒    | |   | |   | |      | |   | (___) |
▒▒▒▀▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    | |   | |   | |      | |   |  ___  | 
                        | |   | |   | |      | |   | (   ) |
                        | (___) |   | |      | |   | )   ( | 
                        (_______)   )_(      )_(   |/     \| 

                         ______   _______   __________________ _ 
                        (  __  \ (  ___  )  \__   __/\__   __/( )
                        | (  \  )| (   ) |     ) (      ) (   | |
                        | |   ) || |   | |     | |      | |   | |
                        | |   | || |   | |     | |      | |   | |
                        | |   ) || |   | |     | |      | |   (_)   
                        | (__/  )| (___) |  ___) (___   | |    _ 
                        (______/ (_______)  \_______/   )_(   (_)"

echo "Press r to restart, or press q if you wish to exit"
echo "this script and preform more commands. [R/q]"
read -rn1 ans

if [ "${ans:0:1}" = "R" ] || [ "${ans:0:1}" = "r" ]; then
  sleep 1
  clear

  echo "        ]Pf767676[1;37m▄]Pf9e9e9e[1;37m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄]P7808080[47m]Pfffffff[1;37m▄▄]P7949494[47m▄]P7a8a8a8[47m▄▄▄]Pfdadada[1;37m▄]P7949494[47m]Pfe4e4e4[1;37m▄]P76c6c6c[47m]Pfffffff[1;37m▄]P7767676[47m▄]P7c6c6c6[47m]Pfdadada[1;37m▄[49m]Pf4e4e4e[1;37m▄]Pfe4e4e4[1;37m▄[39m                        ]Pfc6c6c6[1;37m▄]Pf808080[1;37m▄]P7d7d7d7[47m ]P7a8a8a8[47m]Pfffffff[1;37m▄]P7949494[47m▄▄▄▄]P79e9e9e[47m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄[49m]Pfbcbcbc[1;37m▄]Pf8a8a8a[1;37m▄]Pfbcbcbc[1;37m▄[39m        ]P7aaaaaa]Pfffffff[0m
       ]Pf262626[1;37m▄]P7767676[47m]Pfeeeeee[1;37m▄]P79e9e9e[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7b2b2b2[47m▀]P7e4e4e4[47m]Pf262626[1;37m▄]P7eeeeee[47m▄]P7bcbcbc[47m]Pf4e4e4e[1;37m▄]P7000000[47m]Pf878787[1;37m▄]Pfbcbcbc[1;37m▄]P7767676[47m▄]P7000000[47m]Pfc6c6c6[1;37m▄]P71c1c1c[47m]Pfffffff[1;37m▄]P7000000[47m]Pfe4e4e4[1;37m▄]Pfd7d7d7[1;37m▄]P7080808[47m]Pfffffff[1;37m▄]P7767676[47m]Pfeeeeee[1;37m▄]P7ffffff[47m]Pfa8a8a8[1;37m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄]P7808080[47m]Pfffffff[1;37m▄]P7eeeeee[47m]Pfbcbcbc[1;37m▄[49m]Pfb2b2b2[1;37m▄]Pf4e4e4e[1;37m▄[39m                ]Pf808080[1;37m▄]Pf949494[1;37m▄]Pfa8a8a8[1;37m▄]P7767676[47m]Pfffffff[1;37m▄]P7eeeeee[47m]Pfb2b2b2[1;37m▄]Pf949494[1;37m▄]P7bcbcbc[47m]Pfdadada[1;37m▄]P7a8a8a8[47m]Pf585858[1;37m▄]P7262626[47m]Pfd0d0d0[1;37m▄]P7949494[47m]Pfa8a8a8[1;37m▄]P7d0d0d0[47m]Pf444444[1;37m▄]P7b2b2b2[47m]Pf3a3a3a[1;37m▄]P79e9e9e[47m]Pf4e4e4e[1;37m▄]P7ffffff[47m]Pf3a3a3a[1;37m▄]Pf767676[1;37m▄]Pf5f5f5f[1;37m▄]Pfeeeeee[1;37m▀]Pf767676[1;37m▀]P7d7d7d7[47m]Pfbcbcbc[1;37m▄[49m]Pf949494[1;37m▄[39m     ]P7aaaaaa]Pfffffff[0m
     ]Pf626262[1;37m▄]P76c6c6c[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7afafaf[47m▀]Pf4e4e4e[1;37m▄]P7a8a8a8[47m]Pf585858[1;37m▄]P73a3a3a[47m]Pf303030[1;37m▄]P75f5f5f[47m]Pfe4e4e4[1;37m▄]P7949494[47m]Pfffffff[1;37m▄]P7878787[47m▄]P7949494[47m▀]P7626262[47m▀]P7eeeeee[47m]Pfb2b2b2[1;37m▄[49m]Pfbcbcbc[1;37m▀]Pf9e9e9e[1;37m▀]Pf949494[1;37m▀]Pfafafaf[1;37m▀]P7d0d0d0[47m]Pfc6c6c6[1;37m▄]P7eeeeee[47m]Pf9e9e9e[1;37m▄]P7ffffff[47m]Pf808080[1;37m▄▄]Pf949494[1;37m▄]P7eeeeee[47m]Pfb2b2b2[1;37m▄[49m]Pf8a8a8a[1;37m▀[39m                 ]Pf8a8a8a[1;37m▀]P7ffffff[47m]Pf949494[1;37m▄]Pfa8a8a8[1;37m▄▄]Pf9e9e9e[1;37m▄▄]Pf949494[1;37m▄]Pfafafaf[1;37m▄]P7e4e4e4[47m]Pfd7d7d7[1;37m▄▄]P7ffffff[47m]Pfb2b2b2[1;37m▄]Pf767676[1;37m▄]Pfb2b2b2[1;37m▄]Pf000000[1;37m▀▀]P74e4e4e[47m]Pf8a8a8a[1;37m▄]Pfafafaf[1;37m▀]P7e4e4e4[47m]Pf303030[1;37m▄]P7ffffff[47m]Pf9e9e9e[1;37m▄]Pfd7d7d7[1;37m▀]P7808080[47m▄[49m]Pf9e9e9e[1;37m▄[39m   ]P7aaaaaa]Pfffffff[0m
   ]Pf949494[1;37m▄]P7262626[47m]Pfeeeeee[1;37m▄]P7ffffff[47m ]Pfd0d0d0[1;37m▄]P7c6c6c6[47m]Pf3a3a3a[1;37m▄]P7262626[47m]Pf585858[1;37m▄]P75f5f5f[47m]Pf000000[1;37m▄]P7080808[47m]Pfffffff[1;37m▄]P7a8a8a8[47m▄]P7808080[47m▀[49m]Pfb2b2b2[1;37m▀]Pf767676[1;37m▀[39m                                            ]Pf767676[1;37m▀]P7eeeeee[47m]Pf878787[1;37m▄]P7e4e4e4[47m ]P7000000[47m]Pfffffff[1;37m▄]P7585858[47m]Pf9e9e9e[1;37m▄]Pf080808[1;37m▀]P7e4e4e4[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfdadada[1;37m▄]Pfafafaf[1;37m▀]P7dadada[47m]Pf4e4e4e[1;37m▄[39m[49m  ]P7aaaaaa]Pfffffff[0m
  ]Pf9e9e9e[1;37m▄]P7878787[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]P7bcbcbc[47m]Pf626262[1;37m▄]P7585858[47m ]Pf3a3a3a[1;37m▄]P74e4e4e[47m]Pfe4e4e4[1;37m▄]P7ffffff[47m ]P7b2b2b2[47m]Pf8a8a8a[1;37m▄[39m[49m              ]Pf8a8a8a[1;37m▄]Pfb2b2b2[1;37m▄]P7c6c6c6[47m]Pfe4e4e4[1;37m▄]P7afafaf[47m]Pfffffff[1;37m▄]P7a8a8a8[47m▄▄]P7b2b2b2[47m]Pfeeeeee[1;37m▄]P7bcbcbc[47m▀[49m]Pf5f5f5f[1;37m▄]Pfdadada[1;37m▄[39m     ]Pfa8a8a8[1;37m▄]Pf9e9e9e[1;37m▄]P7d0d0d0[47m]Pfeeeeee[1;37m▄]P7a8a8a8[47m]Pfffffff[1;37m▄]P7b2b2b2[47m▄]P7c6c6c6[47m]Pfeeeeee[1;37m▄[49m]Pfbcbcbc[1;37m▄]Pf9e9e9e[1;37m▄[39m            ]Pf808080[1;37m▀]P7ffffff[47m▄]Pfbcbcbc[1;37m▀]P7585858[47m]Pf4e4e4e[1;37m▄▀]P7c6c6c6[47m]Pf808080[1;37m▄]P7ffffff[47m ]Pfeeeeee[1;37m▀]P7a8a8a8[47m]Pf808080[1;37m▄[39m[49m ]P7aaaaaa]Pfffffff[0m
  ]P7767676[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m  ]P79e9e9e[47m]Pfd7d7d7[1;37m▄]P7585858[47m]Pf444444[1;37m▄]Pf4e4e4e[1;37m▀]P7bcbcbc[47m]Pf767676[1;37m▄]P7ffffff[47m ]P7878787[47m]Pf9e9e9e[1;37m▄[39m[49m            ]Pfbcbcbc[1;37m▄]P7c6c6c6[47m ]P79e9e9e[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7dadada[47m▀]P78a8a8a[47m▀]P7000000[47m▀]P7eeeeee[47m]Pf3a3a3a[1;37m▄]P7e4e4e4[47m▄]P7eeeeee[47m]Pf262626[1;37m▄]P7ffffff[47m]Pf000000[1;37m▄]Pfafafaf[1;37m▄]Pfc6c6c6[1;37m▀]P78a8a8a[47m]Pfeeeeee[1;37m▄[49m]Pf4e4e4e[1;37m▄]Pfe4e4e4[1;37m▄]Pf303030[1;37m▄]P76c6c6c[47m]Pf808080[1;37m▄]P7eeeeee[47m]Pfd0d0d0[1;37m▄]P7ffffff[47m▄]Pf000000[1;37m▄]P7eeeeee[47m]Pf303030[1;37m▄]Pf3a3a3a[1;37m▄]P7ffffff[47m]Pf000000[1;37m▄]Pf9e9e9e[1;37m▄ ]Pfd0d0d0[1;37m▀[49m]Pfeeeeee[1;37m▄[39m           ]Pfc6c6c6[1;37m▀]P7eeeeee[47m]Pfa8a8a8[1;37m▄]P7e4e4e4[47m]Pfb2b2b2[1;37m▄]P7444444[47m]Pf585858[1;37m▄]P74e4e4e[47m]Pf303030[1;37m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄]P7ffffff[47m ]Pfd0d0d0[1;37m▀[49m]Pfa8a8a8[1;37m▄]P7aaaaaa]Pfffffff[0m
 ]P7c6c6c6[47m]Pfa8a8a8[1;37m▄]P7e4e4e4[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7d7d7d7[47m▀]P7bcbcbc[47m]Pf1c1c1c[1;37m▄]P74e4e4e[47m]Pf585858[1;37m▄▀]P7a8a8a8[47m]Pfffffff[1;37m▄]P7bcbcbc[47m]Pf808080[1;37m▄[39m[49m            ]P7c6c6c6[47m]Pf9e9e9e[1;37m▄]Pfffffff[1;37m▄]P7e4e4e4[47m▀]P7000000[47m▀]P7767676[47m]Pf585858[1;37m▄]P73a3a3a[47m▄]P7585858[47m        ]Pfffffff[1;37m▀]P7e4e4e4[47m▀]P7444444[47m▄]P7808080[47m▄]P7878787[47m]Pfdadada[1;37m▄]P7b2b2b2[47m]Pf9e9e9e[1;37m▄]P71c1c1c[47m]Pfffffff[1;37m▄]P7b2b2b2[47m]Pf3a3a3a[1;37m▄]P7bcbcbc[47m▀]P75f5f5f[47m▄]P7585858[47m  ]Pf000000[1;37m▀]P7bcbcbc[47m]Pf444444[1;37m▄]P7ffffff[47m]Pf878787[1;37m▄]Pfe4e4e4[1;37m▀[49m]Pfd0d0d0[1;37m▄[39m          ]P7afafaf[47m ]P7dadada[47m]Pfffffff[1;37m▄]P73a3a3a[47m]Pf808080[1;37m▄]P7444444[47m]Pf585858[1;37m▄]P7d7d7d7[47m]Pf000000[1;37m▄]P7ffffff[47m  ]P79e9e9e[47m ]P7aaaaaa]Pfffffff[0m
 ]P7a8a8a8[47m ]P7ffffff[47m   ]P76c6c6c[47m]Pf9e9e9e[1;37m▄]P7585858[47m]Pf4e4e4e[1;37m▄]Pf303030[1;37m▀]P7ffffff[47m]Pfbcbcbc[1;37m▄]P7949494[47m [39m[49m          ]Pf585858[1;37m▄]P7767676[47m]Pfffffff[1;37m▄]P7eeeeee[47m▀]P7dadada[47m]Pf000000[1;37m▄]P75f5f5f[47m▀]Pf585858[1;37m▄]P7585858[47m           ]P76c6c6c[47m]Pf878787[1;37m▄]P7ffffff[47m   ]P7808080[47m]Pf949494[1;37m▄]P7ffffff[47m  ]P7262626[47m]Pfd0d0d0[1;37m▄]P7a8a8a8[47m]Pf949494[1;37m▄]P7585858[47m]Pf444444[1;37m▄   ]Pf4e4e4e[1;37m▀]P78a8a8a[47m]Pf444444[1;37m▄]P7ffffff[47m]Pfbcbcbc[1;37m▄]Pf8a8a8a[1;37m▀[49m]Pf767676[1;37m▄[39m        ]P7a8a8a8[47m ]P7ffffff[47m]Pfe4e4e4[1;37m▄]P73a3a3a[47m ]P74e4e4e[47m ]P7bcbcbc[47m]Pf9e9e9e[1;37m▄]P7ffffff[47m  ]P7949494[47m▀]P7aaaaaa]Pfffffff[0m
 ]P7a8a8a8[47m]Pfafafaf[1;37m▄]P7ffffff[47m  ]Pfdadada[1;37m▀]Pf000000[1;37m▀]P75f5f5f[47m]Pf262626[1;37m▄]P7303030[47m]Pf585858[1;37m▄]P7ffffff[47m]Pfdadada[1;37m▄]P7808080[47m]Pfa8a8a8[1;37m▄[39m[49m        ]Pf303030[1;37m▄]P73a3a3a[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7444444[47m▀]P7000000[47m]Pf585858[1;37m▄]P75f5f5f[47m▄]P7585858[47m   ]P74e4e4e[47m▀]P7262626[47m▀]P7000000[47m▀]P7303030[47m▀]P7080808[47m▀]P73a3a3a[47m▀]P7000000[47m▀]P7808080[47m▀]P73a3a3a[47m]Pfe4e4e4[1;37m▄]P7000000[47m]Pfffffff[1;37m▄]P7444444[47m]Pfb2b2b2[1;37m▄]P7ffffff[47m   ]Pfd7d7d7[1;37m▀]P7e4e4e4[47m]Pfeeeeee[1;37m▄]Pfffffff[1;37m▀]P7bcbcbc[47m ]P7a8a8a8[47m ]Pf4e4e4e[1;37m▀]P7585858[47m ▄]Pf444444[1;37m▄  ]Pf000000[1;37m▀]P7eeeeee[47m]Pf444444[1;37m▄]P7ffffff[47m ]P79e9e9e[47m]Pfd0d0d0[1;37m▄[49m]Pfdadada[1;37m▄[39m      ]P7949494[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m]Pfc6c6c6[1;37m▄]P7767676[47m]Pf3a3a3a[1;37m▄]P7585858[47m]Pf303030[1;37m▄]P7878787[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]P7949494[47m ]P7aaaaaa]Pfffffff[0m
 ]Pfc6c6c6[1;37m▀]P7eeeeee[47m▄]P7ffffff[47m ]Pfe4e4e4[1;37m▄]P75f5f5f[47m]Pfb2b2b2[1;37m▄]P7585858[47m]Pf6c6c6c[1;37m▄ ]P74e4e4e[47m]Pf8a8a8a[1;37m▄]P7ffffff[47m ]P7767676[47m]Pfbcbcbc[1;37m▄[49m▄[39m    ]Pf585858[1;37m▄]P7eeeeee[47m▀]Pfffffff[1;37m▄]P76c6c6c[47m▀]P7626262[47m]Pf585858[1;37m▄]P7000000[47m▀]P79e9e9e[47m▀]P73a3a3a[47m]Pfeeeeee[1;37m▄]P7000000[47m]Pfffffff[1;37m▄▄]P7878787[47m▄]P7c6c6c6[47m▄]P7eeeeee[47m▄]P7ffffff[47m  ]P7b2b2b2[47m▀]P7e4e4e4[47m▄]P7ffffff[47m     ]Pf6c6c6c[1;37m▀]Pf949494[1;37m▄▄]Pfe4e4e4[1;37m▄]P7c6c6c6[47m]Pfa8a8a8[1;37m▄]P7d7d7d7[47m]Pfffffff[1;37m▄]P7ffffff[47m   ]P7a8a8a8[47m]Pfbcbcbc[1;37m▄]Pfeeeeee[1;37m▄]P7d7d7d7[47m]Pfffffff[1;37m▄]P7afafaf[47m▄]P7444444[47m▄]P74e4e4e[47m]Pfc6c6c6[1;37m▄]P7585858[47m]Pf000000[1;37m▄]Pf6c6c6c[1;37m▀]P7ffffff[47m]Pf8a8a8a[1;37m▄]Pfa8a8a8[1;37m▀]P7eeeeee[47m]Pf9e9e9e[1;37m▄[49m]Pfe4e4e4[1;37m▄[39m   ]Pf808080[1;37m▄]P7e4e4e4[47m]Pfffffff[1;37m▄]P7b2b2b2[47m]Pfc6c6c6[1;37m▄]P7585858[47m]Pf4e4e4e[1;37m▄]Pf808080[1;37m▄]P7000000[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]P78a8a8a[47m]Pf808080[1;37m▄]P7aaaaaa]Pfffffff[0m
  ]P79e9e9e[47m]Pf6c6c6c[1;37m▄]P7ffffff[47m  ]Pfb2b2b2[1;37m▄]P73a3a3a[47m]Pf808080[1;37m▄]P7585858[47m ]Pf767676[1;37m▀]P7c6c6c6[47m]Pf3a3a3a[1;37m▄]Pfffffff[1;37m▀]P7bcbcbc[47m▄]P7808080[47m▄]P7d0d0d0[47m]Pfd7d7d7[1;37m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄]P7444444[47m]Pfffffff[1;37m▄]P7bcbcbc[47m▀]P7000000[47m▀]P7585858[47m]Pf3a3a3a[1;37m▄]P74e4e4e[47m]Pfafafaf[1;37m▄]P76c6c6c[47m]Pfffffff[1;37m▄]P7eeeeee[47m▄]P7ffffff[47m     ]P7c6c6c6[47m▀]P7dadada[47m]Pf808080[1;37m▄]P7d0d0d0[47m]Pf9e9e9e[1;37m▄]P7262626[47m]Pf585858[1;37m▄]P7000000[47m]Pf949494[1;37m▄]P7ffffff[47m    ]Pfb2b2b2[1;37m▀]P7c6c6c6[47m]Pfa8a8a8[1;37m▄]P7d7d7d7[47m]Pf767676[1;37m▄]P7ffffff[47m  ]P7d7d7d7[47m]Pfeeeeee[1;37m▄]P7afafaf[47m]Pfa8a8a8[1;37m▄]P79e9e9e[47m▀]P7ffffff[47m ▄]P7d7d7d7[47m]Pf000000[1;37m▄]P7eeeeee[47m]Pfb2b2b2[1;37m▄]P76c6c6c[47m]Pfffffff[1;37m▄]P7808080[47m▀]P7ffffff[47m   ]Pfdadada[1;37m▀]P7080808[47m]Pfafafaf[1;37m▄]P74e4e4e[47m ]P7808080[47m]Pf585858[1;37m▄]P7ffffff[47m]Pf262626[1;37m▄]P7d0d0d0[47m]Pfbcbcbc[1;37m▄]P7878787[47m]Pfffffff[1;37m▄]P7a8a8a8[47m▄]P79e9e9e[47m▄]P7ffffff[47m ]P7767676[47m]Pf000000[1;37m▄]P7262626[47m]Pf585858[1;37m▄]P75f5f5f[47m]Pf4e4e4e[1;37m▄]P7000000[47m]Pfbcbcbc[1;37m▄]P7d7d7d7[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7bcbcbc[47m▀[49m]Pf9e9e9e[1;37m▀]P7aaaaaa]Pfffffff[0m
  ]Pfbcbcbc[1;37m▀]P7e4e4e4[47m]Pf6c6c6c[1;37m▄]P7ffffff[47m ]Pfeeeeee[1;37m▄]P7a8a8a8[47m]Pf767676[1;37m▄]P74e4e4e[47m]Pf878787[1;37m▄]P7585858[47m  ]Pf949494[1;37m▀]Pfbcbcbc[1;37m▀]P7d0d0d0[47m]Pf1c1c1c[1;37m▄]P7ffffff[47m]Pfbcbcbc[1;37m▄]P7e4e4e4[47m]Pf000000[1;37m▄]P7585858[47m▀]Pf4e4e4e[1;37m▀]P7626262[47m▀]P7a8a8a8[47m]Pfffffff[1;37m▄]P7ffffff[47m       ]P7000000[47m▀]Pfc6c6c6[1;37m▄]P7ffffff[47m ]P7afafaf[47m]Pf808080[1;37m▄]P7000000[47m]Pfeeeeee[1;37m▄]P7ffffff[47m▀]Pfd0d0d0[1;37m▄]Pfbcbcbc[1;37m▄]Pfb2b2b2[1;37m▄]Pfbcbcbc[1;37m▄]Pfb2b2b2[1;37m▄ ]Pfeeeeee[1;37m▀]P7e4e4e4[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m ]Pfeeeeee[1;37m▀]Pfd7d7d7[1;37m▀ ]Pfe4e4e4[1;37m▄]P7000000[47m]Pf262626[1;37m▄]P7949494[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m]Pfc6c6c6[1;37m▄ ]P7afafaf[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m     ]P76c6c6c[47m]Pfeeeeee[1;37m▄]P7585858[47m]Pf000000[1;37m▄ ]Pf4e4e4e[1;37m▀]Pf767676[1;37m▀]P7eeeeee[47m]Pf262626[1;37m▄]P7000000[47m]Pf5f5f5f[1;37m▄]Pf585858[1;37m▄]P75f5f5f[47m▄]P74e4e4e[47m▀]Pf5f5f5f[1;37m▄]P7000000[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7c6c6c6[47m▀[49m]Pf4e4e4e[1;37m▀[39m ]P7aaaaaa]Pfffffff[0m
   ]Pfbcbcbc[1;37m▀]P7dadada[47m]Pf444444[1;37m▄]P7ffffff[47m  ]Pf000000[1;37m▀]P74e4e4e[47m]Pfc6c6c6[1;37m▄]P7585858[47m]Pf444444[1;37m▄]Pf5f5f5f[1;37m▄  ]Pf4e4e4e[1;37m▀  ]P7121212[47m]Pf949494[1;37m▄]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m      ]P7eeeeee[47m▀]P7c6c6c6[47m▄]P7e4e4e4[47m▄]P7ffffff[47m    ]Pfeeeeee[1;37m▀▄]Pfd7d7d7[1;37m▄]Pfbcbcbc[1;37m▄]Pfc6c6c6[1;37m▄]P7878787[47m]Pf3a3a3a[1;37m▄]P7ffffff[47m  ]Pfd0d0d0[1;37m▀]P7c6c6c6[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m   ]P7e4e4e4[47m]Pfeeeeee[1;37m▄]P74e4e4e[47m]Pf9e9e9e[1;37m▄]P7ffffff[47m]Pfd0d0d0[1;37m▄]Pf9e9e9e[1;37m▄▄]P7949494[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m      ]P78a8a8a[47m]Pfc6c6c6[1;37m▄]P7585858[47m]Pf4e4e4e[1;37m▄   ]Pf5f5f5f[1;37m▄]Pf444444[1;37m▄]P7bcbcbc[47m▀]P7949494[47m]Pf878787[1;37m▄]P7d7d7d7[47m]Pfffffff[1;37m▄]P7eeeeee[47m▄]P7767676[47m▀[49m]Pf5f5f5f[1;37m▀[39m  ]P7aaaaaa]Pfffffff[0m
     ]Pf5f5f5f[1;37m▀]P7ffffff[47m]Pf767676[1;37m▄ ]Pfafafaf[1;37m▀ ]P7000000[47m]Pf949494[1;37m▄]P7878787[47m]Pfd0d0d0[1;37m▄]P7585858[47m]Pf8a8a8a[1;37m▄]P74e4e4e[47m]Pf808080[1;37m▄]P7585858[47m▄]P7262626[47m]Pf6c6c6c[1;37m▄]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m          ]P7dadada[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m   ]P74e4e4e[47m]Pf000000[1;37m▄]P7ffffff[47m▀]P7bcbcbc[47m▀]P7585858[47m]Pf4e4e4e[1;37m▄]P73a3a3a[47m ]P7dadada[47m ]P7d0d0d0[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]Pfd7d7d7[1;37m▀]Pfeeeeee[1;37m▄   ]P7000000[47m]Pfd0d0d0[1;37m▄]P7bcbcbc[47m]Pf767676[1;37m▄]P7444444[47m]Pf585858[1;37m▄]P74e4e4e[47m]Pf000000[1;37m▄]P7080808[47m]Pfffffff[1;37m▄]P7e4e4e4[47m]Pfdadada[1;37m▄]P7ffffff[47m      ]P7000000[47m]Pfbcbcbc[1;37m▄]P7585858[47m]Pf444444[1;37m▄]P75f5f5f[47m]Pfc6c6c6[1;37m▄]P7949494[47m]Pfa8a8a8[1;37m▄]P7000000[47m]Pfdadada[1;37m▄]P7e4e4e4[47m]Pfffffff[1;37m▄]P7c6c6c6[47m▄]P7ffffff[47m ]P7c6c6c6[47m▀[49m]Pfbcbcbc[1;37m▀[39m    ]P7aaaaaa]Pfffffff[0m
       ]Pf5f5f5f[1;37m▀]P7ffffff[47m]Pf121212[1;37m▄]Pfc6c6c6[1;37m▄ ]Pfeeeeee[1;37m▀ ]Pf949494[1;37m▀]P7a8a8a8[47m]Pf000000[1;37m▄]P7c6c6c6[47m]Pfffffff[1;37m▄]P7ffffff[47m          ]P7eeeeee[47m]Pfbcbcbc[1;37m▄]Pfd0d0d0[1;37m▀]P7ffffff[47m   ]Pfeeeeee[1;37m▀]Pf878787[1;37m▀]Pfafafaf[1;37m▄]P78a8a8a[47m]Pfd0d0d0[1;37m▄]P79e9e9e[47m]Pfc6c6c6[1;37m▄]P7ffffff[47m]Pfbcbcbc[1;37m▄]Pfd7d7d7[1;37m▀]Pfc6c6c6[1;37m▄       ]Pf949494[1;37m▀]P7a8a8a8[47m]Pf444444[1;37m▄]P7dadada[47m]Pf5f5f5f[1;37m▄]P7afafaf[47m]Pf949494[1;37m▄]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m       ]Pf5f5f5f[1;37m▀]P78a8a8a[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfeeeeee[1;37m▄]Pfc6c6c6[1;37m▄]Pf8a8a8a[1;37m▄▄[49m]Pf808080[1;37m▀[39m      ]P7aaaaaa]Pfffffff[0m
          ]Pf3a3a3a[1;37m▀]Pf878787[1;37m▀]Pfbcbcbc[1;37m▀]P7dadada[47m]Pf808080[1;37m▄]P76c6c6c[47m]Pfc6c6c6[1;37m▄]P7ffffff[47m          ]Pfe4e4e4[1;37m▄]P7262626[47m]Pf3a3a3a[1;37m▄]P7ffffff[47m          ]Pfbcbcbc[1;37m▀]Pfeeeeee[1;37m▀        ]Pfe4e4e4[1;37m▀]P7d7d7d7[47m]Pf8a8a8a[1;37m▄]P7d0d0d0[47m]Pfffffff[1;37m▄]P7e4e4e4[47m▄]P79e9e9e[47m▀]P7ffffff[47m       ]Pfe4e4e4[1;37m▀]P76c6c6c[47m]Pf8a8a8a[1;37m▄[49m]Pfd7d7d7[1;37m▀[39m         ]P7aaaaaa]Pfffffff[0m
              ]P7c6c6c6[47m ]P7ffffff[47m         ]Pf949494[1;37m▄]P7444444[47m]Pfd0d0d0[1;37m▄]P7767676[47m]Pfafafaf[1;37m▄]P7ffffff[47m                      ]P7949494[47m]Pf8a8a8a[1;37m▄]P7ffffff[47m]Pfa8a8a8[1;37m▄[49m]Pfb2b2b2[1;37m▀]Pf585858[1;37m▀]P7eeeeee[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m]Pf5f5f5f[1;37m▄]Pfafafaf[1;37m▄    ]Pf6c6c6c[1;37m▀]P7d0d0d0[47m]Pfc6c6c6[1;37m▄[49m]Pf8a8a8a[1;37m▄[39m        ]P7aaaaaa]Pfffffff[0m
            ]Pf8a8a8a[1;37m▄]P7000000[47m]Pfe4e4e4[1;37m▄]P7ffffff[47m        ]Pfafafaf[1;37m▄]P7bcbcbc[47m]Pf6c6c6c[1;37m▄]P7767676[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]P7bcbcbc[47m]Pfd7d7d7[1;37m▄]P7ffffff[47m         ]Pfeeeeee[1;37m▄]P74e4e4e[47m▀]P78a8a8a[47m]Pfffffff[1;37m▄]P7585858[47m▄]P7767676[47m▄]P7808080[47m▄]P7dadada[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m]Pf808080[1;37m▄     ]P7000000[47m]Pfdadada[1;37m▄[49m]Pf767676[1;37m▄[39m    ]Pf878787[1;37m▀]Pf808080[1;37m▀]Pfa8a8a8[1;37m▀▀]Pf9e9e9e[1;37m▀]Pf585858[1;37m▀[39m         ]P7aaaaaa]Pfffffff[0m
            ]P7444444[47m]Pf767676[1;37m▄]P7ffffff[47m     ]Pfdadada[1;37m▄]Pf949494[1;37m▄]Pf000000[1;37m▄]P7767676[47m]Pf949494[1;37m▄]P7bcbcbc[47m▀]P7ffffff[47m     ]Pfeeeeee[1;37m▀        ]P7949494[47m ]P7d0d0d0[47m]Pf000000[1;37m▄]P7262626[47m]Pfffffff[1;37m▄]P79e9e9e[47m▄]P7eeeeee[47m ]P7ffffff[47m  ]Pfeeeeee[1;37m▀]Pf6c6c6c[1;37m▀]P7d0d0d0[47m]Pfd7d7d7[1;37m▄]P7ffffff[47m]Pf949494[1;37m▄   ]Pfeeeeee[1;37m▀]Pfafafaf[1;37m▀]Pfe4e4e4[1;37m▀▀]P7767676[47m]Pf949494[1;37m▄[39m[49m               ]P7aaaaaa]Pfffffff[0m
          ]P7808080[47m]Pf949494[1;37m▄]P7ffffff[47m▀]Pfeeeeee[1;37m▄ ]Pf626262[1;37m▄]P7b2b2b2[47m]Pfa8a8a8[1;37m▄]P76c6c6c[47m]Pf3a3a3a[1;37m▄]P7000000[47m]Pfffffff[1;37m▄]P78a8a8a[47m▄]P7d0d0d0[47m▄]P7ffffff[47m ]P7bcbcbc[47m]Pfdadada[1;37m▄]Pf808080[1;37m▄]P7ffffff[47m        ]Pfb2b2b2[1;37m▄]Pfbcbcbc[1;37m▄]Pfeeeeee[1;37m▄   ]Pfd7d7d7[1;37m▀]P78a8a8a[47m]Pfe4e4e4[1;37m▄]P7ffffff[47m ]P7949494[47m]Pfc6c6c6[1;37m▄]P7262626[47m]Pf000000[1;37m▄]P7eeeeee[47m▀]P79e9e9e[47m]Pfc6c6c6[1;37m▄]P7ffffff[47m]Pfa8a8a8[1;37m▄  ]Pfeeeeee[1;37m▀]Pfb2b2b2[1;37m▀]Pfeeeeee[1;37m▀     ]P7afafaf[47m]Pfa8a8a8[1;37m▄[39m[49m               ]P7aaaaaa]Pfffffff[0m
          ]Pf9e9e9e[1;37m▀]Pf000000[1;37m▀]Pf4e4e4e[1;37m▀]Pf000000[1;37m▀]Pfb2b2b2[1;37m▀[39m ]P7000000[47m ]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m   ]P7eeeeee[47m]Pfe4e4e4[1;37m▄]P74e4e4e[47m]Pf878787[1;37m▄]P7ffffff[47m        ]Pfd7d7d7[1;37m▀  ]Pf949494[1;37m▄]Pfeeeeee[1;37m▄ ]Pfc6c6c6[1;37m▄      ]Pf9e9e9e[1;37m▀]Pfdadada[1;37m▄        ]Pf8a8a8a[1;37m▄]P7000000[47m]Pfbcbcbc[1;37m▄[39m[49m               ]P7aaaaaa]Pfffffff[0m
                ]P7000000[47m ]P7ffffff[47m     ]P7000000[47m]Pfeeeeee[1;37m▄]P7dadada[47m]Pf3a3a3a[1;37m▄]P7ffffff[47m           ]P78a8a8a[47m]Pfe4e4e4[1;37m▄]P7dadada[47m]Pf767676[1;37m▄]P7ffffff[47m        ]Pfeeeeee[1;37m▀     ]Pfc6c6c6[1;37m▄]Pf262626[1;37m▄]P7767676[47m]Pfdadada[1;37m▄[49m]Pfafafaf[1;37m▀[39m                ]P7aaaaaa]Pfffffff[0m
                ]P7000000[47m ]P7ffffff[47m]Pfeeeeee[1;37m▄     ]P74e4e4e[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfdadada[1;37m▄           ]P76c6c6c[47m]Pfe4e4e4[1;37m▄]P7ffffff[47m]Pf949494[1;37m▄           ]Pfdadada[1;37m▀]Pfa8a8a8[1;37m▀]Pfd7d7d7[1;37m▀]P7585858[47m]Pfeeeeee[1;37m▄[49m]Pf5f5f5f[1;37m▄[39m                 ]P7aaaaaa]Pfffffff[0m
                ]P7767676[47m]Pfa8a8a8[1;37m▄]P7dadada[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m     ]Pfc6c6c6[1;37m▀]Pf878787[1;37m▀]P74e4e4e[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfd0d0d0[1;37m▄]Pfeeeeee[1;37m▄         ]Pf808080[1;37m▀]P7eeeeee[47m]Pf000000[1;37m▄]Pfffffff[1;37m▀]P7ffffff[47m       ]P7eeeeee[47m▀]P7d0d0d0[47m▀]P7c6c6c6[47m▀]P7d0d0d0[47m▀]P7e4e4e4[47m▀]P7c6c6c6[47m▀]P7eeeeee[47m]Pf000000[1;37m▄[49m]Pfa8a8a8[1;37m▀[39m                ]P7aaaaaa]Pfffffff[0m
                 ]P78a8a8a[47m]Pf000000[1;37m▄]P7ffffff[47m       ]Pfd7d7d7[1;37m▀]P7afafaf[47m]Pf808080[1;37m▄]P7000000[47m]Pfd0d0d0[1;37m▄]P7ffffff[47m           ]Pf6c6c6c[1;37m▀▀]P7b2b2b2[47m]Pfd0d0d0[1;37m▄▀]P7bcbcbc[47m▀]P7b2b2b2[47m]Pfd7d7d7[1;37m▄]P7767676[47m]Pfffffff[1;37m▄]P7121212[47m▄]P7808080[47m▄]P7878787[47m▄]P7767676[47m▄]P7303030[47m▄]P7000000[47m]Pf808080[1;37m▄[49m]Pf9e9e9e[1;37m▀[39m                  ]P7aaaaaa]Pfffffff[0m
                 ]Pf949494[1;37m▀]P7dadada[47m]Pf808080[1;37m▄]P7ffffff[47m       ]P7000000[47m]Pf9e9e9e[1;37m▄]P7ffffff[47m]Pf6c6c6c[1;37m▄]Pfe4e4e4[1;37m▄                      ]P7a8a8a8[47m]Pf6c6c6c[1;37m▄[39m[49m                   ]P7aaaaaa]Pfffffff[0m
                  ]Pf878787[1;37m▀]P7eeeeee[47m]Pf585858[1;37m▄]P7ffffff[47m       ]Pfd7d7d7[1;37m▀]P7808080[47m]Pfd0d0d0[1;37m▄]P7000000[47m]Pf8a8a8a[1;37m▄]Pfafafaf[1;37m▀]P7ffffff[47m]Pfdadada[1;37m▄        ]Pfc6c6c6[1;37m▄]Pf5f5f5f[1;37m▄]Pf000000[1;37m▄▄]P7e4e4e4[47m▄]P7c6c6c6[47m▄]P7bcbcbc[47m]Pf585858[1;37m▄]P7a8a8a8[47m]Pf767676[1;37m▄[49m]Pf949494[1;37m▀▀]Pfa8a8a8[1;37m▀]Pf8a8a8a[1;37m▀[39m                   ]P7aaaaaa]Pfffffff[0m
                    ]P7c6c6c6[47m]Pf808080[1;37m▄]P7ffffff[47m]Pfeeeeee[1;37m▄       ]Pfd0d0d0[1;37m▄]P79e9e9e[47m]Pf000000[1;37m▄]P7bcbcbc[47m]Pfffffff[1;37m▄▀]P7000000[47m▀]P7afafaf[47m]Pfc6c6c6[1;37m▄]P7ffffff[47m       ]Pf949494[1;37m▀]Pfb2b2b2[1;37m▀  ]P7000000[47m [39m[49m                        ]P7aaaaaa]Pfffffff[0m
                     ]Pf6c6c6c[1;37m▀]P7ffffff[47m]Pf767676[1;37m▄      ]P7626262[47m]Pfeeeeee[1;37m▄]P7808080[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfb2b2b2[1;37m▄]P7000000[47m]Pf878787[1;37m▄]P7585858[47m ]Pf767676[1;37m▀]P7a8a8a8[47m]Pf808080[1;37m▄]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m       ]P7e4e4e4[47m▀]P7ffffff[47m ]Pfd0d0d0[1;37m▀]P7bcbcbc[47m]Pf626262[1;37m▄[39m[49m                       ]P7aaaaaa]Pfffffff[0m
                       ]Pf9e9e9e[1;37m▀]P7ffffff[47m]Pfd0d0d0[1;37m▄     ]Pfeeeeee[1;37m▀]Pf121212[1;37m▀]P74e4e4e[47m]Pf949494[1;37m▄]P7000000[47m▀]P73a3a3a[47m]Pfeeeeee[1;37m▄]P7444444[47m]Pf262626[1;37m▄]P7ffffff[47m]Pf949494[1;37m▄      ]P7eeeeee[47m]Pf585858[1;37m▄]Pfd0d0d0[1;37m▀]P7ffffff[47m]Pf878787[1;37m▄]P7dadada[47m]Pf303030[1;37m▄[49m]Pf9e9e9e[1;37m▀[39m                       ]P7aaaaaa]Pfffffff[0m
                         ]Pfeeeeee[1;37m▀]P7ffffff[47m      ]Pfa8a8a8[1;37m▄]P76c6c6c[47m]Pf000000[1;37m▄[49m]Pfd0d0d0[1;37m▀]Pf808080[1;37m▀]P74e4e4e[47m]Pf878787[1;37m▄ ]P7dadada[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m ]Pf626262[1;37m▄]P7d7d7d7[47m]Pf444444[1;37m▄]P74e4e4e[47m]Pf585858[1;37m▄]P76c6c6c[47m▄]P7000000[47m]Pf3a3a3a[1;37m▄[49m]Pfc6c6c6[1;37m▀[39m                         ]P7aaaaaa]Pfffffff[0m
                           ]Pfffffff[1;37m▀▀▀▀]P78a8a8a[47m]Pfc6c6c6[1;37m▄[49m]Pfafafaf[1;37m▀[39m  ]Pfa8a8a8[1;37m▄]P74e4e4e[47m ]P7585858[47m ]P79e9e9e[47m]Pf262626[1;37m▄]P7d0d0d0[47m]Pfe4e4e4[1;37m▄]P74e4e4e[47m]Pf303030[1;37m▄]P7585858[47m    ]P79e9e9e[47m]Pf4e4e4e[1;37m▄[49m]Pf8a8a8a[1;37m▄]Pfbcbcbc[1;37m▄[39m                       ]P7aaaaaa]Pfffffff[0m
                                   ]Pf000000[1;37m▀[39m ]P7000000[47m]Pfbcbcbc[1;37m▄]P75f5f5f[47m]Pf444444[1;37m▄]P74e4e4e[47m]Pf585858[1;37m▄]Pf6c6c6c[1;37m▀]P7585858[47m ]Pf626262[1;37m▄]Pf262626[1;37m▄  ]Pf5f5f5f[1;37m▄]Pf000000[1;37m▄[49m]Pfa8a8a8[1;37m▀[39m                      ]P7aaaaaa]Pfffffff[0m
                                      ]Pfa8a8a8[1;37m▀]Pf000000[1;37m▀]P7afafaf[47m]Pf949494[1;37m▄[49m]Pf000000[1;37m▀]P7262626[47m]Pfc6c6c6[1;37m▄[49m]Pfa8a8a8[1;37m▄]Pf585858[1;37m▀]Pf303030[1;37m▀]Pf3a3a3a[1;37m▀[39m                        ]P7aaaaaa]Pfffffff[0m

                                                    Join the GNU Freedom Movement
                                                      http://gnu.org/philosophy                   

"
  echo "restarting..."
  sleep 8
  reboot
fi

if [ "${ans:0:1}" = "Q" ] || [ "${ans:0:1}" = "q" ]; then
  clear
  echo "Ok then. Just remember you need to restart your computer as soon as you are done with"
  echo "whatever it is you need to do. Your computer is not usable in its current state, except for"
  echo "this terminal. Preform your commands, then preform the command"
  echo "sudo reboot"
  echo "then enter your own password."
  sleep 3
  clear
  echo "Now re-entering"
  echo "
 _______  _______  _______  __   __ 
|  _    ||   _   ||       ||  | |  |
| |_|   ||  |_|  ||  _____||  |_|  |
|       ||       || |_____ |       |
|  _   | |       ||_____  ||       |
| |_|   ||   _   | _____| ||   _   |
|_______||__| |__||_______||__| |__|
"
  sleep 3
  clear
  echo "Thank you for choosing"
  echo "
      ________                     __      __          ________    _          
     / ____/ /_  ____  _________  / /___ _/ /____     / ____/ /_  (_)___      
    / /   / __ \/ __ \/ ___/ __ \/ / __  / __/ _ \   / /   / __ \/ / __ \     
   / /___/ / / / /_/ / /__/ /_/ / / /_/ / /_/  __/  / /___/ / / / / /_/ /     
   \____/_/ /_/\____/\___/\____/_/\__,_/\__/\___/   \____/_/ /_/_/ .___/      
      ______                            __  _                   /_/           
     / ____/___  ____ ___  ____  __  __/ /_(_)___  ____ _                     
    / /   / __ \/ __  __ \/ __ \/ / / / __/ / __ \/ __  /                     
   / /___/ /_/ / / / / / / /_/ / /_/ / /_/ / / / / /_/ /                      
   \____/\____/_/ /_/ /_/ .___/\__,_/\__/_/_/ /_/\__, /                       
                       /_/                      /____/  
(assumed buisness name comming soon)
"
echo "for your new GNU/Linux Experience"
  sleep 2
  clear
  exit 1
fi

sleep 1
clear
echo "          ]Pf767676[1;37m▄]Pf9e9e9e[1;37m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄]P7808080[47m]Pfffffff[1;37m▄▄]P7949494[47m▄]P7a8a8a8[47m▄▄▄]Pfdadada[1;37m▄]P7949494[47m]Pfe4e4e4[1;37m▄]P76c6c6c[47m]Pfffffff[1;37m▄]P7767676[47m▄]P7c6c6c6[47m]Pfdadada[1;37m▄[49m]Pf4e4e4e[1;37m▄]Pfe4e4e4[1;37m▄[39m                        ]Pfc6c6c6[1;37m▄]Pf808080[1;37m▄]P7d7d7d7[47m ]P7a8a8a8[47m]Pfffffff[1;37m▄]P7949494[47m▄▄▄▄]P79e9e9e[47m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄[49m]Pfbcbcbc[1;37m▄]Pf8a8a8a[1;37m▄]Pfbcbcbc[1;37m▄[39m        ]P7aaaaaa]Pfffffff[0m
       ]Pf262626[1;37m▄]P7767676[47m]Pfeeeeee[1;37m▄]P79e9e9e[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7b2b2b2[47m▀]P7e4e4e4[47m]Pf262626[1;37m▄]P7eeeeee[47m▄]P7bcbcbc[47m]Pf4e4e4e[1;37m▄]P7000000[47m]Pf878787[1;37m▄]Pfbcbcbc[1;37m▄]P7767676[47m▄]P7000000[47m]Pfc6c6c6[1;37m▄]P71c1c1c[47m]Pfffffff[1;37m▄]P7000000[47m]Pfe4e4e4[1;37m▄]Pfd7d7d7[1;37m▄]P7080808[47m]Pfffffff[1;37m▄]P7767676[47m]Pfeeeeee[1;37m▄]P7ffffff[47m]Pfa8a8a8[1;37m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄]P7808080[47m]Pfffffff[1;37m▄]P7eeeeee[47m]Pfbcbcbc[1;37m▄[49m]Pfb2b2b2[1;37m▄]Pf4e4e4e[1;37m▄[39m                ]Pf808080[1;37m▄]Pf949494[1;37m▄]Pfa8a8a8[1;37m▄]P7767676[47m]Pfffffff[1;37m▄]P7eeeeee[47m]Pfb2b2b2[1;37m▄]Pf949494[1;37m▄]P7bcbcbc[47m]Pfdadada[1;37m▄]P7a8a8a8[47m]Pf585858[1;37m▄]P7262626[47m]Pfd0d0d0[1;37m▄]P7949494[47m]Pfa8a8a8[1;37m▄]P7d0d0d0[47m]Pf444444[1;37m▄]P7b2b2b2[47m]Pf3a3a3a[1;37m▄]P79e9e9e[47m]Pf4e4e4e[1;37m▄]P7ffffff[47m]Pf3a3a3a[1;37m▄]Pf767676[1;37m▄]Pf5f5f5f[1;37m▄]Pfeeeeee[1;37m▀]Pf767676[1;37m▀]P7d7d7d7[47m]Pfbcbcbc[1;37m▄[49m]Pf949494[1;37m▄[39m     ]P7aaaaaa]Pfffffff[0m
     ]Pf626262[1;37m▄]P76c6c6c[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7afafaf[47m▀]Pf4e4e4e[1;37m▄]P7a8a8a8[47m]Pf585858[1;37m▄]P73a3a3a[47m]Pf303030[1;37m▄]P75f5f5f[47m]Pfe4e4e4[1;37m▄]P7949494[47m]Pfffffff[1;37m▄]P7878787[47m▄]P7949494[47m▀]P7626262[47m▀]P7eeeeee[47m]Pfb2b2b2[1;37m▄[49m]Pfbcbcbc[1;37m▀]Pf9e9e9e[1;37m▀]Pf949494[1;37m▀]Pfafafaf[1;37m▀]P7d0d0d0[47m]Pfc6c6c6[1;37m▄]P7eeeeee[47m]Pf9e9e9e[1;37m▄]P7ffffff[47m]Pf808080[1;37m▄▄]Pf949494[1;37m▄]P7eeeeee[47m]Pfb2b2b2[1;37m▄[49m]Pf8a8a8a[1;37m▀[39m                 ]Pf8a8a8a[1;37m▀]P7ffffff[47m]Pf949494[1;37m▄]Pfa8a8a8[1;37m▄▄]Pf9e9e9e[1;37m▄▄]Pf949494[1;37m▄]Pfafafaf[1;37m▄]P7e4e4e4[47m]Pfd7d7d7[1;37m▄▄]P7ffffff[47m]Pfb2b2b2[1;37m▄]Pf767676[1;37m▄]Pfb2b2b2[1;37m▄]Pf000000[1;37m▀▀]P74e4e4e[47m]Pf8a8a8a[1;37m▄]Pfafafaf[1;37m▀]P7e4e4e4[47m]Pf303030[1;37m▄]P7ffffff[47m]Pf9e9e9e[1;37m▄]Pfd7d7d7[1;37m▀]P7808080[47m▄[49m]Pf9e9e9e[1;37m▄[39m   ]P7aaaaaa]Pfffffff[0m
   ]Pf949494[1;37m▄]P7262626[47m]Pfeeeeee[1;37m▄]P7ffffff[47m ]Pfd0d0d0[1;37m▄]P7c6c6c6[47m]Pf3a3a3a[1;37m▄]P7262626[47m]Pf585858[1;37m▄]P75f5f5f[47m]Pf000000[1;37m▄]P7080808[47m]Pfffffff[1;37m▄]P7a8a8a8[47m▄]P7808080[47m▀[49m]Pfb2b2b2[1;37m▀]Pf767676[1;37m▀[39m                                            ]Pf767676[1;37m▀]P7eeeeee[47m]Pf878787[1;37m▄]P7e4e4e4[47m ]P7000000[47m]Pfffffff[1;37m▄]P7585858[47m]Pf9e9e9e[1;37m▄]Pf080808[1;37m▀]P7e4e4e4[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfdadada[1;37m▄]Pfafafaf[1;37m▀]P7dadada[47m]Pf4e4e4e[1;37m▄[39m[49m  ]P7aaaaaa]Pfffffff[0m
  ]Pf9e9e9e[1;37m▄]P7878787[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]P7bcbcbc[47m]Pf626262[1;37m▄]P7585858[47m ]Pf3a3a3a[1;37m▄]P74e4e4e[47m]Pfe4e4e4[1;37m▄]P7ffffff[47m ]P7b2b2b2[47m]Pf8a8a8a[1;37m▄[39m[49m              ]Pf8a8a8a[1;37m▄]Pfb2b2b2[1;37m▄]P7c6c6c6[47m]Pfe4e4e4[1;37m▄]P7afafaf[47m]Pfffffff[1;37m▄]P7a8a8a8[47m▄▄]P7b2b2b2[47m]Pfeeeeee[1;37m▄]P7bcbcbc[47m▀[49m]Pf5f5f5f[1;37m▄]Pfdadada[1;37m▄[39m     ]Pfa8a8a8[1;37m▄]Pf9e9e9e[1;37m▄]P7d0d0d0[47m]Pfeeeeee[1;37m▄]P7a8a8a8[47m]Pfffffff[1;37m▄]P7b2b2b2[47m▄]P7c6c6c6[47m]Pfeeeeee[1;37m▄[49m]Pfbcbcbc[1;37m▄]Pf9e9e9e[1;37m▄[39m            ]Pf808080[1;37m▀]P7ffffff[47m▄]Pfbcbcbc[1;37m▀]P7585858[47m]Pf4e4e4e[1;37m▄▀]P7c6c6c6[47m]Pf808080[1;37m▄]P7ffffff[47m ]Pfeeeeee[1;37m▀]P7a8a8a8[47m]Pf808080[1;37m▄[39m[49m ]P7aaaaaa]Pfffffff[0m
  ]P7767676[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m  ]P79e9e9e[47m]Pfd7d7d7[1;37m▄]P7585858[47m]Pf444444[1;37m▄]Pf4e4e4e[1;37m▀]P7bcbcbc[47m]Pf767676[1;37m▄]P7ffffff[47m ]P7878787[47m]Pf9e9e9e[1;37m▄[39m[49m            ]Pfbcbcbc[1;37m▄]P7c6c6c6[47m ]P79e9e9e[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7dadada[47m▀]P78a8a8a[47m▀]P7000000[47m▀]P7eeeeee[47m]Pf3a3a3a[1;37m▄]P7e4e4e4[47m▄]P7eeeeee[47m]Pf262626[1;37m▄]P7ffffff[47m]Pf000000[1;37m▄]Pfafafaf[1;37m▄]Pfc6c6c6[1;37m▀]P78a8a8a[47m]Pfeeeeee[1;37m▄[49m]Pf4e4e4e[1;37m▄]Pfe4e4e4[1;37m▄]Pf303030[1;37m▄]P76c6c6c[47m]Pf808080[1;37m▄]P7eeeeee[47m]Pfd0d0d0[1;37m▄]P7ffffff[47m▄]Pf000000[1;37m▄]P7eeeeee[47m]Pf303030[1;37m▄]Pf3a3a3a[1;37m▄]P7ffffff[47m]Pf000000[1;37m▄]Pf9e9e9e[1;37m▄ ]Pfd0d0d0[1;37m▀[49m]Pfeeeeee[1;37m▄[39m           ]Pfc6c6c6[1;37m▀]P7eeeeee[47m]Pfa8a8a8[1;37m▄]P7e4e4e4[47m]Pfb2b2b2[1;37m▄]P7444444[47m]Pf585858[1;37m▄]P74e4e4e[47m]Pf303030[1;37m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄]P7ffffff[47m ]Pfd0d0d0[1;37m▀[49m]Pfa8a8a8[1;37m▄]P7aaaaaa]Pfffffff[0m
 ]P7c6c6c6[47m]Pfa8a8a8[1;37m▄]P7e4e4e4[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7d7d7d7[47m▀]P7bcbcbc[47m]Pf1c1c1c[1;37m▄]P74e4e4e[47m]Pf585858[1;37m▄▀]P7a8a8a8[47m]Pfffffff[1;37m▄]P7bcbcbc[47m]Pf808080[1;37m▄[39m[49m            ]P7c6c6c6[47m]Pf9e9e9e[1;37m▄]Pfffffff[1;37m▄]P7e4e4e4[47m▀]P7000000[47m▀]P7767676[47m]Pf585858[1;37m▄]P73a3a3a[47m▄]P7585858[47m        ]Pfffffff[1;37m▀]P7e4e4e4[47m▀]P7444444[47m▄]P7808080[47m▄]P7878787[47m]Pfdadada[1;37m▄]P7b2b2b2[47m]Pf9e9e9e[1;37m▄]P71c1c1c[47m]Pfffffff[1;37m▄]P7b2b2b2[47m]Pf3a3a3a[1;37m▄]P7bcbcbc[47m▀]P75f5f5f[47m▄]P7585858[47m  ]Pf000000[1;37m▀]P7bcbcbc[47m]Pf444444[1;37m▄]P7ffffff[47m]Pf878787[1;37m▄]Pfe4e4e4[1;37m▀[49m]Pfd0d0d0[1;37m▄[39m          ]P7afafaf[47m ]P7dadada[47m]Pfffffff[1;37m▄]P73a3a3a[47m]Pf808080[1;37m▄]P7444444[47m]Pf585858[1;37m▄]P7d7d7d7[47m]Pf000000[1;37m▄]P7ffffff[47m  ]P79e9e9e[47m ]P7aaaaaa]Pfffffff[0m
 ]P7a8a8a8[47m ]P7ffffff[47m   ]P76c6c6c[47m]Pf9e9e9e[1;37m▄]P7585858[47m]Pf4e4e4e[1;37m▄]Pf303030[1;37m▀]P7ffffff[47m]Pfbcbcbc[1;37m▄]P7949494[47m [39m[49m          ]Pf585858[1;37m▄]P7767676[47m]Pfffffff[1;37m▄]P7eeeeee[47m▀]P7dadada[47m]Pf000000[1;37m▄]P75f5f5f[47m▀]Pf585858[1;37m▄]P7585858[47m           ]P76c6c6c[47m]Pf878787[1;37m▄]P7ffffff[47m   ]P7808080[47m]Pf949494[1;37m▄]P7ffffff[47m  ]P7262626[47m]Pfd0d0d0[1;37m▄]P7a8a8a8[47m]Pf949494[1;37m▄]P7585858[47m]Pf444444[1;37m▄   ]Pf4e4e4e[1;37m▀]P78a8a8a[47m]Pf444444[1;37m▄]P7ffffff[47m]Pfbcbcbc[1;37m▄]Pf8a8a8a[1;37m▀[49m]Pf767676[1;37m▄[39m        ]P7a8a8a8[47m ]P7ffffff[47m]Pfe4e4e4[1;37m▄]P73a3a3a[47m ]P74e4e4e[47m ]P7bcbcbc[47m]Pf9e9e9e[1;37m▄]P7ffffff[47m  ]P7949494[47m▀]P7aaaaaa]Pfffffff[0m
 ]P7a8a8a8[47m]Pfafafaf[1;37m▄]P7ffffff[47m  ]Pfdadada[1;37m▀]Pf000000[1;37m▀]P75f5f5f[47m]Pf262626[1;37m▄]P7303030[47m]Pf585858[1;37m▄]P7ffffff[47m]Pfdadada[1;37m▄]P7808080[47m]Pfa8a8a8[1;37m▄[39m[49m        ]Pf303030[1;37m▄]P73a3a3a[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7444444[47m▀]P7000000[47m]Pf585858[1;37m▄]P75f5f5f[47m▄]P7585858[47m   ]P74e4e4e[47m▀]P7262626[47m▀]P7000000[47m▀]P7303030[47m▀]P7080808[47m▀]P73a3a3a[47m▀]P7000000[47m▀]P7808080[47m▀]P73a3a3a[47m]Pfe4e4e4[1;37m▄]P7000000[47m]Pfffffff[1;37m▄]P7444444[47m]Pfb2b2b2[1;37m▄]P7ffffff[47m   ]Pfd7d7d7[1;37m▀]P7e4e4e4[47m]Pfeeeeee[1;37m▄]Pfffffff[1;37m▀]P7bcbcbc[47m ]P7a8a8a8[47m ]Pf4e4e4e[1;37m▀]P7585858[47m ▄]Pf444444[1;37m▄  ]Pf000000[1;37m▀]P7eeeeee[47m]Pf444444[1;37m▄]P7ffffff[47m ]P79e9e9e[47m]Pfd0d0d0[1;37m▄[49m]Pfdadada[1;37m▄[39m      ]P7949494[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m]Pfc6c6c6[1;37m▄]P7767676[47m]Pf3a3a3a[1;37m▄]P7585858[47m]Pf303030[1;37m▄]P7878787[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]P7949494[47m ]P7aaaaaa]Pfffffff[0m
 ]Pfc6c6c6[1;37m▀]P7eeeeee[47m▄]P7ffffff[47m ]Pfe4e4e4[1;37m▄]P75f5f5f[47m]Pfb2b2b2[1;37m▄]P7585858[47m]Pf6c6c6c[1;37m▄ ]P74e4e4e[47m]Pf8a8a8a[1;37m▄]P7ffffff[47m ]P7767676[47m]Pfbcbcbc[1;37m▄[49m▄[39m    ]Pf585858[1;37m▄]P7eeeeee[47m▀]Pfffffff[1;37m▄]P76c6c6c[47m▀]P7626262[47m]Pf585858[1;37m▄]P7000000[47m▀]P79e9e9e[47m▀]P73a3a3a[47m]Pfeeeeee[1;37m▄]P7000000[47m]Pfffffff[1;37m▄▄]P7878787[47m▄]P7c6c6c6[47m▄]P7eeeeee[47m▄]P7ffffff[47m  ]P7b2b2b2[47m▀]P7e4e4e4[47m▄]P7ffffff[47m     ]Pf6c6c6c[1;37m▀]Pf949494[1;37m▄▄]Pfe4e4e4[1;37m▄]P7c6c6c6[47m]Pfa8a8a8[1;37m▄]P7d7d7d7[47m]Pfffffff[1;37m▄]P7ffffff[47m   ]P7a8a8a8[47m]Pfbcbcbc[1;37m▄]Pfeeeeee[1;37m▄]P7d7d7d7[47m]Pfffffff[1;37m▄]P7afafaf[47m▄]P7444444[47m▄]P74e4e4e[47m]Pfc6c6c6[1;37m▄]P7585858[47m]Pf000000[1;37m▄]Pf6c6c6c[1;37m▀]P7ffffff[47m]Pf8a8a8a[1;37m▄]Pfa8a8a8[1;37m▀]P7eeeeee[47m]Pf9e9e9e[1;37m▄[49m]Pfe4e4e4[1;37m▄[39m   ]Pf808080[1;37m▄]P7e4e4e4[47m]Pfffffff[1;37m▄]P7b2b2b2[47m]Pfc6c6c6[1;37m▄]P7585858[47m]Pf4e4e4e[1;37m▄]Pf808080[1;37m▄]P7000000[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]P78a8a8a[47m]Pf808080[1;37m▄]P7aaaaaa]Pfffffff[0m
  ]P79e9e9e[47m]Pf6c6c6c[1;37m▄]P7ffffff[47m  ]Pfb2b2b2[1;37m▄]P73a3a3a[47m]Pf808080[1;37m▄]P7585858[47m ]Pf767676[1;37m▀]P7c6c6c6[47m]Pf3a3a3a[1;37m▄]Pfffffff[1;37m▀]P7bcbcbc[47m▄]P7808080[47m▄]P7d0d0d0[47m]Pfd7d7d7[1;37m▄]P7bcbcbc[47m]Pfeeeeee[1;37m▄]P7444444[47m]Pfffffff[1;37m▄]P7bcbcbc[47m▀]P7000000[47m▀]P7585858[47m]Pf3a3a3a[1;37m▄]P74e4e4e[47m]Pfafafaf[1;37m▄]P76c6c6c[47m]Pfffffff[1;37m▄]P7eeeeee[47m▄]P7ffffff[47m     ]P7c6c6c6[47m▀]P7dadada[47m]Pf808080[1;37m▄]P7d0d0d0[47m]Pf9e9e9e[1;37m▄]P7262626[47m]Pf585858[1;37m▄]P7000000[47m]Pf949494[1;37m▄]P7ffffff[47m    ]Pfb2b2b2[1;37m▀]P7c6c6c6[47m]Pfa8a8a8[1;37m▄]P7d7d7d7[47m]Pf767676[1;37m▄]P7ffffff[47m  ]P7d7d7d7[47m]Pfeeeeee[1;37m▄]P7afafaf[47m]Pfa8a8a8[1;37m▄]P79e9e9e[47m▀]P7ffffff[47m ▄]P7d7d7d7[47m]Pf000000[1;37m▄]P7eeeeee[47m]Pfb2b2b2[1;37m▄]P76c6c6c[47m]Pfffffff[1;37m▄]P7808080[47m▀]P7ffffff[47m   ]Pfdadada[1;37m▀]P7080808[47m]Pfafafaf[1;37m▄]P74e4e4e[47m ]P7808080[47m]Pf585858[1;37m▄]P7ffffff[47m]Pf262626[1;37m▄]P7d0d0d0[47m]Pfbcbcbc[1;37m▄]P7878787[47m]Pfffffff[1;37m▄]P7a8a8a8[47m▄]P79e9e9e[47m▄]P7ffffff[47m ]P7767676[47m]Pf000000[1;37m▄]P7262626[47m]Pf585858[1;37m▄]P75f5f5f[47m]Pf4e4e4e[1;37m▄]P7000000[47m]Pfbcbcbc[1;37m▄]P7d7d7d7[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7bcbcbc[47m▀[49m]Pf9e9e9e[1;37m▀]P7aaaaaa]Pfffffff[0m
  ]Pfbcbcbc[1;37m▀]P7e4e4e4[47m]Pf6c6c6c[1;37m▄]P7ffffff[47m ]Pfeeeeee[1;37m▄]P7a8a8a8[47m]Pf767676[1;37m▄]P74e4e4e[47m]Pf878787[1;37m▄]P7585858[47m  ]Pf949494[1;37m▀]Pfbcbcbc[1;37m▀]P7d0d0d0[47m]Pf1c1c1c[1;37m▄]P7ffffff[47m]Pfbcbcbc[1;37m▄]P7e4e4e4[47m]Pf000000[1;37m▄]P7585858[47m▀]Pf4e4e4e[1;37m▀]P7626262[47m▀]P7a8a8a8[47m]Pfffffff[1;37m▄]P7ffffff[47m       ]P7000000[47m▀]Pfc6c6c6[1;37m▄]P7ffffff[47m ]P7afafaf[47m]Pf808080[1;37m▄]P7000000[47m]Pfeeeeee[1;37m▄]P7ffffff[47m▀]Pfd0d0d0[1;37m▄]Pfbcbcbc[1;37m▄]Pfb2b2b2[1;37m▄]Pfbcbcbc[1;37m▄]Pfb2b2b2[1;37m▄ ]Pfeeeeee[1;37m▀]P7e4e4e4[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m ]Pfeeeeee[1;37m▀]Pfd7d7d7[1;37m▀ ]Pfe4e4e4[1;37m▄]P7000000[47m]Pf262626[1;37m▄]P7949494[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m]Pfc6c6c6[1;37m▄ ]P7afafaf[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m     ]P76c6c6c[47m]Pfeeeeee[1;37m▄]P7585858[47m]Pf000000[1;37m▄ ]Pf4e4e4e[1;37m▀]Pf767676[1;37m▀]P7eeeeee[47m]Pf262626[1;37m▄]P7000000[47m]Pf5f5f5f[1;37m▄]Pf585858[1;37m▄]P75f5f5f[47m▄]P74e4e4e[47m▀]Pf5f5f5f[1;37m▄]P7000000[47m]Pfffffff[1;37m▄]P7ffffff[47m ]P7c6c6c6[47m▀[49m]Pf4e4e4e[1;37m▀[39m ]P7aaaaaa]Pfffffff[0m
   ]Pfbcbcbc[1;37m▀]P7dadada[47m]Pf444444[1;37m▄]P7ffffff[47m  ]Pf000000[1;37m▀]P74e4e4e[47m]Pfc6c6c6[1;37m▄]P7585858[47m]Pf444444[1;37m▄]Pf5f5f5f[1;37m▄  ]Pf4e4e4e[1;37m▀  ]P7121212[47m]Pf949494[1;37m▄]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m      ]P7eeeeee[47m▀]P7c6c6c6[47m▄]P7e4e4e4[47m▄]P7ffffff[47m    ]Pfeeeeee[1;37m▀▄]Pfd7d7d7[1;37m▄]Pfbcbcbc[1;37m▄]Pfc6c6c6[1;37m▄]P7878787[47m]Pf3a3a3a[1;37m▄]P7ffffff[47m  ]Pfd0d0d0[1;37m▀]P7c6c6c6[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m   ]P7e4e4e4[47m]Pfeeeeee[1;37m▄]P74e4e4e[47m]Pf9e9e9e[1;37m▄]P7ffffff[47m]Pfd0d0d0[1;37m▄]Pf9e9e9e[1;37m▄▄]P7949494[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m      ]P78a8a8a[47m]Pfc6c6c6[1;37m▄]P7585858[47m]Pf4e4e4e[1;37m▄   ]Pf5f5f5f[1;37m▄]Pf444444[1;37m▄]P7bcbcbc[47m▀]P7949494[47m]Pf878787[1;37m▄]P7d7d7d7[47m]Pfffffff[1;37m▄]P7eeeeee[47m▄]P7767676[47m▀[49m]Pf5f5f5f[1;37m▀[39m  ]P7aaaaaa]Pfffffff[0m
     ]Pf5f5f5f[1;37m▀]P7ffffff[47m]Pf767676[1;37m▄ ]Pfafafaf[1;37m▀ ]P7000000[47m]Pf949494[1;37m▄]P7878787[47m]Pfd0d0d0[1;37m▄]P7585858[47m]Pf8a8a8a[1;37m▄]P74e4e4e[47m]Pf808080[1;37m▄]P7585858[47m▄]P7262626[47m]Pf6c6c6c[1;37m▄]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m          ]P7dadada[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m   ]P74e4e4e[47m]Pf000000[1;37m▄]P7ffffff[47m▀]P7bcbcbc[47m▀]P7585858[47m]Pf4e4e4e[1;37m▄]P73a3a3a[47m ]P7dadada[47m ]P7d0d0d0[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]Pfd7d7d7[1;37m▀]Pfeeeeee[1;37m▄   ]P7000000[47m]Pfd0d0d0[1;37m▄]P7bcbcbc[47m]Pf767676[1;37m▄]P7444444[47m]Pf585858[1;37m▄]P74e4e4e[47m]Pf000000[1;37m▄]P7080808[47m]Pfffffff[1;37m▄]P7e4e4e4[47m]Pfdadada[1;37m▄]P7ffffff[47m      ]P7000000[47m]Pfbcbcbc[1;37m▄]P7585858[47m]Pf444444[1;37m▄]P75f5f5f[47m]Pfc6c6c6[1;37m▄]P7949494[47m]Pfa8a8a8[1;37m▄]P7000000[47m]Pfdadada[1;37m▄]P7e4e4e4[47m]Pfffffff[1;37m▄]P7c6c6c6[47m▄]P7ffffff[47m ]P7c6c6c6[47m▀[49m]Pfbcbcbc[1;37m▀[39m    ]P7aaaaaa]Pfffffff[0m
       ]Pf5f5f5f[1;37m▀]P7ffffff[47m]Pf121212[1;37m▄]Pfc6c6c6[1;37m▄ ]Pfeeeeee[1;37m▀ ]Pf949494[1;37m▀]P7a8a8a8[47m]Pf000000[1;37m▄]P7c6c6c6[47m]Pfffffff[1;37m▄]P7ffffff[47m          ]P7eeeeee[47m]Pfbcbcbc[1;37m▄]Pfd0d0d0[1;37m▀]P7ffffff[47m   ]Pfeeeeee[1;37m▀]Pf878787[1;37m▀]Pfafafaf[1;37m▄]P78a8a8a[47m]Pfd0d0d0[1;37m▄]P79e9e9e[47m]Pfc6c6c6[1;37m▄]P7ffffff[47m]Pfbcbcbc[1;37m▄]Pfd7d7d7[1;37m▀]Pfc6c6c6[1;37m▄       ]Pf949494[1;37m▀]P7a8a8a8[47m]Pf444444[1;37m▄]P7dadada[47m]Pf5f5f5f[1;37m▄]P7afafaf[47m]Pf949494[1;37m▄]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m       ]Pf5f5f5f[1;37m▀]P78a8a8a[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfeeeeee[1;37m▄]Pfc6c6c6[1;37m▄]Pf8a8a8a[1;37m▄▄[49m]Pf808080[1;37m▀[39m      ]P7aaaaaa]Pfffffff[0m
          ]Pf3a3a3a[1;37m▀]Pf878787[1;37m▀]Pfbcbcbc[1;37m▀]P7dadada[47m]Pf808080[1;37m▄]P76c6c6c[47m]Pfc6c6c6[1;37m▄]P7ffffff[47m          ]Pfe4e4e4[1;37m▄]P7262626[47m]Pf3a3a3a[1;37m▄]P7ffffff[47m          ]Pfbcbcbc[1;37m▀]Pfeeeeee[1;37m▀        ]Pfe4e4e4[1;37m▀]P7d7d7d7[47m]Pf8a8a8a[1;37m▄]P7d0d0d0[47m]Pfffffff[1;37m▄]P7e4e4e4[47m▄]P79e9e9e[47m▀]P7ffffff[47m       ]Pfe4e4e4[1;37m▀]P76c6c6c[47m]Pf8a8a8a[1;37m▄[49m]Pfd7d7d7[1;37m▀[39m         ]P7aaaaaa]Pfffffff[0m
              ]P7c6c6c6[47m ]P7ffffff[47m         ]Pf949494[1;37m▄]P7444444[47m]Pfd0d0d0[1;37m▄]P7767676[47m]Pfafafaf[1;37m▄]P7ffffff[47m                      ]P7949494[47m]Pf8a8a8a[1;37m▄]P7ffffff[47m]Pfa8a8a8[1;37m▄[49m]Pfb2b2b2[1;37m▀]Pf585858[1;37m▀]P7eeeeee[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m]Pf5f5f5f[1;37m▄]Pfafafaf[1;37m▄    ]Pf6c6c6c[1;37m▀]P7d0d0d0[47m]Pfc6c6c6[1;37m▄[49m]Pf8a8a8a[1;37m▄[39m        ]P7aaaaaa]Pfffffff[0m
            ]Pf8a8a8a[1;37m▄]P7000000[47m]Pfe4e4e4[1;37m▄]P7ffffff[47m        ]Pfafafaf[1;37m▄]P7bcbcbc[47m]Pf6c6c6c[1;37m▄]P7767676[47m]Pfffffff[1;37m▄]P7ffffff[47m  ]P7bcbcbc[47m]Pfd7d7d7[1;37m▄]P7ffffff[47m         ]Pfeeeeee[1;37m▄]P74e4e4e[47m▀]P78a8a8a[47m]Pfffffff[1;37m▄]P7585858[47m▄]P7767676[47m▄]P7808080[47m▄]P7dadada[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m]Pf808080[1;37m▄     ]P7000000[47m]Pfdadada[1;37m▄[49m]Pf767676[1;37m▄[39m    ]Pf878787[1;37m▀]Pf808080[1;37m▀]Pfa8a8a8[1;37m▀▀]Pf9e9e9e[1;37m▀]Pf585858[1;37m▀[39m         ]P7aaaaaa]Pfffffff[0m
            ]P7444444[47m]Pf767676[1;37m▄]P7ffffff[47m     ]Pfdadada[1;37m▄]Pf949494[1;37m▄]Pf000000[1;37m▄]P7767676[47m]Pf949494[1;37m▄]P7bcbcbc[47m▀]P7ffffff[47m     ]Pfeeeeee[1;37m▀        ]P7949494[47m ]P7d0d0d0[47m]Pf000000[1;37m▄]P7262626[47m]Pfffffff[1;37m▄]P79e9e9e[47m▄]P7eeeeee[47m ]P7ffffff[47m  ]Pfeeeeee[1;37m▀]Pf6c6c6c[1;37m▀]P7d0d0d0[47m]Pfd7d7d7[1;37m▄]P7ffffff[47m]Pf949494[1;37m▄   ]Pfeeeeee[1;37m▀]Pfafafaf[1;37m▀]Pfe4e4e4[1;37m▀▀]P7767676[47m]Pf949494[1;37m▄[39m[49m               ]P7aaaaaa]Pfffffff[0m
          ]P7808080[47m]Pf949494[1;37m▄]P7ffffff[47m▀]Pfeeeeee[1;37m▄ ]Pf626262[1;37m▄]P7b2b2b2[47m]Pfa8a8a8[1;37m▄]P76c6c6c[47m]Pf3a3a3a[1;37m▄]P7000000[47m]Pfffffff[1;37m▄]P78a8a8a[47m▄]P7d0d0d0[47m▄]P7ffffff[47m ]P7bcbcbc[47m]Pfdadada[1;37m▄]Pf808080[1;37m▄]P7ffffff[47m        ]Pfb2b2b2[1;37m▄]Pfbcbcbc[1;37m▄]Pfeeeeee[1;37m▄   ]Pfd7d7d7[1;37m▀]P78a8a8a[47m]Pfe4e4e4[1;37m▄]P7ffffff[47m ]P7949494[47m]Pfc6c6c6[1;37m▄]P7262626[47m]Pf000000[1;37m▄]P7eeeeee[47m▀]P79e9e9e[47m]Pfc6c6c6[1;37m▄]P7ffffff[47m]Pfa8a8a8[1;37m▄  ]Pfeeeeee[1;37m▀]Pfb2b2b2[1;37m▀]Pfeeeeee[1;37m▀     ]P7afafaf[47m]Pfa8a8a8[1;37m▄[39m[49m               ]P7aaaaaa]Pfffffff[0m
          ]Pf9e9e9e[1;37m▀]Pf000000[1;37m▀]Pf4e4e4e[1;37m▀]Pf000000[1;37m▀]Pfb2b2b2[1;37m▀[39m ]P7000000[47m ]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m   ]P7eeeeee[47m]Pfe4e4e4[1;37m▄]P74e4e4e[47m]Pf878787[1;37m▄]P7ffffff[47m        ]Pfd7d7d7[1;37m▀  ]Pf949494[1;37m▄]Pfeeeeee[1;37m▄ ]Pfc6c6c6[1;37m▄      ]Pf9e9e9e[1;37m▀]Pfdadada[1;37m▄        ]Pf8a8a8a[1;37m▄]P7000000[47m]Pfbcbcbc[1;37m▄[39m[49m               ]P7aaaaaa]Pfffffff[0m
                ]P7000000[47m ]P7ffffff[47m     ]P7000000[47m]Pfeeeeee[1;37m▄]P7dadada[47m]Pf3a3a3a[1;37m▄]P7ffffff[47m           ]P78a8a8a[47m]Pfe4e4e4[1;37m▄]P7dadada[47m]Pf767676[1;37m▄]P7ffffff[47m        ]Pfeeeeee[1;37m▀     ]Pfc6c6c6[1;37m▄]Pf262626[1;37m▄]P7767676[47m]Pfdadada[1;37m▄[49m]Pfafafaf[1;37m▀[39m                ]P7aaaaaa]Pfffffff[0m
                ]P7000000[47m ]P7ffffff[47m]Pfeeeeee[1;37m▄     ]P74e4e4e[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfdadada[1;37m▄           ]P76c6c6c[47m]Pfe4e4e4[1;37m▄]P7ffffff[47m]Pf949494[1;37m▄           ]Pfdadada[1;37m▀]Pfa8a8a8[1;37m▀]Pfd7d7d7[1;37m▀]P7585858[47m]Pfeeeeee[1;37m▄[49m]Pf5f5f5f[1;37m▄[39m                 ]P7aaaaaa]Pfffffff[0m
                ]P7767676[47m]Pfa8a8a8[1;37m▄]P7dadada[47m]Pfbcbcbc[1;37m▄]P7ffffff[47m     ]Pfc6c6c6[1;37m▀]Pf878787[1;37m▀]P74e4e4e[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfd0d0d0[1;37m▄]Pfeeeeee[1;37m▄         ]Pf808080[1;37m▀]P7eeeeee[47m]Pf000000[1;37m▄]Pfffffff[1;37m▀]P7ffffff[47m       ]P7eeeeee[47m▀]P7d0d0d0[47m▀]P7c6c6c6[47m▀]P7d0d0d0[47m▀]P7e4e4e4[47m▀]P7c6c6c6[47m▀]P7eeeeee[47m]Pf000000[1;37m▄[49m]Pfa8a8a8[1;37m▀[39m                ]P7aaaaaa]Pfffffff[0m
                 ]P78a8a8a[47m]Pf000000[1;37m▄]P7ffffff[47m       ]Pfd7d7d7[1;37m▀]P7afafaf[47m]Pf808080[1;37m▄]P7000000[47m]Pfd0d0d0[1;37m▄]P7ffffff[47m           ]Pf6c6c6c[1;37m▀▀]P7b2b2b2[47m]Pfd0d0d0[1;37m▄▀]P7bcbcbc[47m▀]P7b2b2b2[47m]Pfd7d7d7[1;37m▄]P7767676[47m]Pfffffff[1;37m▄]P7121212[47m▄]P7808080[47m▄]P7878787[47m▄]P7767676[47m▄]P7303030[47m▄]P7000000[47m]Pf808080[1;37m▄[49m]Pf9e9e9e[1;37m▀[39m                  ]P7aaaaaa]Pfffffff[0m
                 ]Pf949494[1;37m▀]P7dadada[47m]Pf808080[1;37m▄]P7ffffff[47m       ]P7000000[47m]Pf9e9e9e[1;37m▄]P7ffffff[47m]Pf6c6c6c[1;37m▄]Pfe4e4e4[1;37m▄                      ]P7a8a8a8[47m]Pf6c6c6c[1;37m▄[39m[49m                   ]P7aaaaaa]Pfffffff[0m
                  ]Pf878787[1;37m▀]P7eeeeee[47m]Pf585858[1;37m▄]P7ffffff[47m       ]Pfd7d7d7[1;37m▀]P7808080[47m]Pfd0d0d0[1;37m▄]P7000000[47m]Pf8a8a8a[1;37m▄]Pfafafaf[1;37m▀]P7ffffff[47m]Pfdadada[1;37m▄        ]Pfc6c6c6[1;37m▄]Pf5f5f5f[1;37m▄]Pf000000[1;37m▄▄]P7e4e4e4[47m▄]P7c6c6c6[47m▄]P7bcbcbc[47m]Pf585858[1;37m▄]P7a8a8a8[47m]Pf767676[1;37m▄[49m]Pf949494[1;37m▀▀]Pfa8a8a8[1;37m▀]Pf8a8a8a[1;37m▀[39m                   ]P7aaaaaa]Pfffffff[0m
                    ]P7c6c6c6[47m]Pf808080[1;37m▄]P7ffffff[47m]Pfeeeeee[1;37m▄       ]Pfd0d0d0[1;37m▄]P79e9e9e[47m]Pf000000[1;37m▄]P7bcbcbc[47m]Pfffffff[1;37m▄▀]P7000000[47m▀]P7afafaf[47m]Pfc6c6c6[1;37m▄]P7ffffff[47m       ]Pf949494[1;37m▀]Pfb2b2b2[1;37m▀  ]P7000000[47m [39m[49m                        ]P7aaaaaa]Pfffffff[0m
                     ]Pf6c6c6c[1;37m▀]P7ffffff[47m]Pf767676[1;37m▄      ]P7626262[47m]Pfeeeeee[1;37m▄]P7808080[47m]Pf000000[1;37m▄]P7ffffff[47m]Pfb2b2b2[1;37m▄]P7000000[47m]Pf878787[1;37m▄]P7585858[47m ]Pf767676[1;37m▀]P7a8a8a8[47m]Pf808080[1;37m▄]P7eeeeee[47m]Pfffffff[1;37m▄]P7ffffff[47m       ]P7e4e4e4[47m▀]P7ffffff[47m ]Pfd0d0d0[1;37m▀]P7bcbcbc[47m]Pf626262[1;37m▄[39m[49m                       ]P7aaaaaa]Pfffffff[0m
                       ]Pf9e9e9e[1;37m▀]P7ffffff[47m]Pfd0d0d0[1;37m▄     ]Pfeeeeee[1;37m▀]Pf121212[1;37m▀]P74e4e4e[47m]Pf949494[1;37m▄]P7000000[47m▀]P73a3a3a[47m]Pfeeeeee[1;37m▄]P7444444[47m]Pf262626[1;37m▄]P7ffffff[47m]Pf949494[1;37m▄      ]P7eeeeee[47m]Pf585858[1;37m▄]Pfd0d0d0[1;37m▀]P7ffffff[47m]Pf878787[1;37m▄]P7dadada[47m]Pf303030[1;37m▄[49m]Pf9e9e9e[1;37m▀[39m                       ]P7aaaaaa]Pfffffff[0m
                         ]Pfeeeeee[1;37m▀]P7ffffff[47m      ]Pfa8a8a8[1;37m▄]P76c6c6c[47m]Pf000000[1;37m▄[49m]Pfd0d0d0[1;37m▀]Pf808080[1;37m▀]P74e4e4e[47m]Pf878787[1;37m▄ ]P7dadada[47m]Pfa8a8a8[1;37m▄]P7ffffff[47m ]Pf626262[1;37m▄]P7d7d7d7[47m]Pf444444[1;37m▄]P74e4e4e[47m]Pf585858[1;37m▄]P76c6c6c[47m▄]P7000000[47m]Pf3a3a3a[1;37m▄[49m]Pfc6c6c6[1;37m▀[39m                         ]P7aaaaaa]Pfffffff[0m
                           ]Pfffffff[1;37m▀▀▀▀]P78a8a8a[47m]Pfc6c6c6[1;37m▄[49m]Pfafafaf[1;37m▀[39m  ]Pfa8a8a8[1;37m▄]P74e4e4e[47m ]P7585858[47m ]P79e9e9e[47m]Pf262626[1;37m▄]P7d0d0d0[47m]Pfe4e4e4[1;37m▄]P74e4e4e[47m]Pf303030[1;37m▄]P7585858[47m    ]P79e9e9e[47m]Pf4e4e4e[1;37m▄[49m]Pf8a8a8a[1;37m▄]Pfbcbcbc[1;37m▄[39m                       ]P7aaaaaa]Pfffffff[0m
                                   ]Pf000000[1;37m▀[39m ]P7000000[47m]Pfbcbcbc[1;37m▄]P75f5f5f[47m]Pf444444[1;37m▄]P74e4e4e[47m]Pf585858[1;37m▄]Pf6c6c6c[1;37m▀]P7585858[47m ]Pf626262[1;37m▄]Pf262626[1;37m▄  ]Pf5f5f5f[1;37m▄]Pf000000[1;37m▄[49m]Pfa8a8a8[1;37m▀[39m                      ]P7aaaaaa]Pfffffff[0m
                                      ]Pfa8a8a8[1;37m▀]Pf000000[1;37m▀]P7afafaf[47m]Pf949494[1;37m▄[49m]Pf000000[1;37m▀]P7262626[47m]Pfc6c6c6[1;37m▄[49m]Pfa8a8a8[1;37m▄]Pf585858[1;37m▀]Pf303030[1;37m▀]Pf3a3a3a[1;37m▀[39m                        ]P7aaaaaa]Pfffffff[0m


                                                     Join the GNU Freedom Movement
                                                      http://gnu.org/philosophy
"
echo "restarting..."
sleep 8
reboot
exit
