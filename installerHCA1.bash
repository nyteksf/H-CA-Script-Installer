#!/bin/bash =============================================================================================#
#========================================================================================================#
#													 #
# [NYTEK'S  H:CA  DEV-ENV  INSTALL  SCRIPT  v1] 							 #
# [FOR UBUNTU, DEBIAN, AND THEIR DERIVATIVE DISTROS]							 #
# [ALSO  WITH  INSTALL  OPTION  ADDED  FOR  OSX]							 #
#													 #
# [TESTED ON XUBUNTU 14.04 (Trusty) - i686]								 #
#													 #
#======================================================================================================= #
# USAGE INSTRUCTIONS:											 #
# To run the installer, open terminal and type  `bash installerHCA1.bash`  within the currently  	 #
# installed-to folder.              									 #
#													 #
# ABOUT: 												 #
# A simple Bash script put together by H:CA Student Joe Coviello which installs certain			 #
# useful packages, and for particularly after completing a fresh install. It also 			 #
# contains optional system tweaks for enhancing general ease of use, and comfort. 			 #
#													 #
# NOTES:											         #
# -Read over this whole file once, first, before executing it. In your doing so you may wish to comment  #
#  out any unwanted package(s) by simply placing a "#" at the beginning of each respective line.         #
# -The OS Optimization script is only for Linux at this time. Furthermore, it can only be run ONE TIME   #
#  due to file changes being made. Do not interrupt. Using '-t' more than once will damage your system!  #
# -On your local desktop: look for the appearance of related post-install README files.                  #
#========================================================================================================#
#========================================================================================================#

clear
echo
echo -en "\E[31m"

cat << "EOF"
        _,.
      ,` -.)
     '( _/'-\\-.
    /,|`--._,-^|            ,
    \_| |`-._/||          ,'|
      |  `-, / |         /  /
      |     || |        /  /
       `r-._||/   __   /  /
   __,-<_     )`-/  `./  /
  '  \   `---'   \   /  /
     |            |./  /
    /.            //  /
 \_/' \         | /  /        ██░ ██  ▄████▄        █▄▄
  |    |   _,^-' /  /        ▓██░ ██▒▒██▀ ▀█       ▒████▄
  |    , W``  (\/  /_        ▒██▀▀██░▒▓█   ▄▄      ▒██  ▀█▄
   \,.->._     \X-=/^        ░▓█ ░██ ▒▓▓▄ ▄██▒     ░██▄▄▄▄██▄
    (  /   `-._//^`          ░▓█▒░██░▒ ▓███▀ ░ ██▓  ▓█    ▓██▒  ██▓
     `Y-.____(__}             ▒ ░░▒░▒░ ░▒ ▒  ░ ▒▓▒  ▒▓    ▓▒██░  ▒▓▒
      |     {__)              ▒ ░▒░ ░  ░  ▒    ░▒    ▒    ▒▒  ▒░▒
            ()`                ░  ░░ ░░         ░     ░    ▒    ░
                             ░  ░  ░░ ░        ░          ░  ░  ░
                            ░          ░              ░
                                       [ CODE WARRIORS ]
EOF
echo -en "\E[37m"
echo "   Usage: bash $(basename $0) -l -m -t"
echo "     -l: Install [H:CA Script] for Linux"
echo "     -m: Install [H:CA Script] for OSX"
echo "     -t: Install [H:CA Script] OS Optimization [Linux Only]"
echo
echo "         ex. [For Linux]: bash $(basename $0) -l -t"
echo "             [For OSX]:   bash $(basename $0) -m"
echo

# Using 'getopts' to make the multi-choice-magic happen
#
lflag=
mflag=
tflag=
while getopts 'lmt' OPTION
do
  case $OPTION in
    l)    lflag=1
    ;;
    m)    mflag=1
    ;;
    t)    tflag=1
    ;;
    ?)    printf "%s: Usage: bash $(basename $0) [-l] [-m] [-t]\n\n" $(basename $0) >&2
      exit 2
    ;;
  esac

done
shift $(($OPTIND - 1)) 
## The wizardry which consecutively parses/runs the chosen sub-program(s) from the whole:
## ie, Decrements the argument pointer so that it points to the next argument after
## processing until none are left.


if [ "$lflag" ]
then
  printf "\nOption -l specified"
  sleep 2
  
  # CLEAR THE CONSOLE BEFORE CONTINUING EXECUTION:
  # TABULA RASA:
  clear
  
  
  cat << "EOF"
					 		        .,..
                                                             .88888888:.
				       		            88888888.88888.
				                          .8888888888888888.
				   		          888888888888888888
				                          88' _`88'_  `88888
						          88 88 88 88  88888
						          88_88_::_88_:88888
			  		   	          88:::,::,:::::8888
	   	 		        THE LINUX OS      88`:::::::::'`8888     INSTALL SCRIPT
				                         .88  `::::'    8:88.
							8888            `8:888.
				     	             .8888'             ,`888888.
				                   .8888.'     :'     `'::`88:8888
				                  .8888        '         `.888:8888.
   ▄█    █▄     ▄████████    ▄████████	         888:8         .           888:88888      ▄████████  ▄████████    ▄████████  ▄█     ▄███████▄     ███                
  ███    ███   ███    ███   ███    ███	       .888:88        .:           888:88888:     ███    ███ ███    ███   ███    ███ ███    ███    ███ ▀█████████▄           
  ███    ███   ███    █▀    ███    ███	       8888888.       ::           88:888888      ███    █▀  ███    █▀    ███    ███ ███▌   ███    ███    ▀███▀▀██           
 ▄███▄▄▄▄███▄▄ ███          ███    ███	       `.::.888.      ::          .88888888       ███        ███         ▄███▄▄▄▄██▀ ███▌   ███    ███     ███   ▀           
▀▀███▀▀▀▀███▀  ███        ▀███████████▀       .::::::.888.    ::         :::`8888'.:.   ▀███████████ ███        ▀▀███▀▀▀▀▀   ███▌  ▀█████████▀     ███               
  ███    ███   ███    █▄    ███    ███	     ::::::::::.888   '         .::::::::::::            ███ ███    █▄  ▀███████████ ███    ███            ███               
  ███    █▀    ████████▀    ███    █▀ 	     ::::::::::::.8    '      .:8::::::::::::.     ▄█    ███ ███    ███   ███    ███ ███    ███            ███   ▄           
	   		                   .::::::::::::::.        .:888::::::::::::::    ▄████████▀  ████████▀    ███    ███ █▀    ▄████▀         ▄████▀ ██▀         
                                	   :::::::::::::::88:.__..:88888::::::::::::'
                                           `'.:::::::::::88888888888.88::::::;::'
                                        	`':::_:' -- '' -'-' `':_::::'`
	           ▄█  ███▄▄▄▄      ▄████████     ███        ▄████████  ▄█        ▄█    ██    ▄████████    ▄████████    
        	  ███  ███▀▀▀██▄   ███    ███ ▀█████████▄   ███    ███ ███       ███         ███    ███   ███    ███	
	          ███▌ ███   ███   ███    █▀     ▀███▀▀██   ███    ███ ███       ███         ███    █▀    ███    ███    
        	  ███▌ ███   ███   ███            ███   ▀   ███    ███ ███       ███        ▄███▄▄▄      ▄███▄▄▄▄██▀    
    	          ███▌ ███   ███ ▀███████████     ███     ▀███████████ ███       ███       ▀▀███▀▀▀     ▀▀███▀▀▀▀▀	
   	          ███  ███   ███          ███     ███       ███    ███ ███       ███         ███    █▄  ▀███████████    
 	          ███  ███   ███    ▄█    ███     ███       ███    ███ ███▌    ▄ ███▌    ▄   ███    ███   ███    ███    
     		  █▀    ▀█   █▀   ▄████████▀     ▄████▀     ███    █▀  █████▄▄██ █████▄▄██   ██████████   ███    ███    
                                                             ▀         ▀                        ███    ███              
EOF
sleep 3
clear
sleep 1

  # SET FOREGROUND TO RED
  echo -en "\E[31m"
  echo
  echo
  echo
  echo
  echo
  echo '/    /   /  /  //  /// Launching  The  H:CA'
  echo '/    /   /  /  //  /// ////  ,------------. '
  echo '/    /   /  /  //  /// ////  | |        | | '
  echo '/    /   /  /  //  /// ////  | |        | | '
  echo "/    /   /  /  //  /// ////  | '________. | "
  echo '/    /   /  /  //  /// ////  | ,________. | '
  echo '/    /   /  /  //  /// ////  | |#####|  | | '
  echo '/    /   /  /  //  /// ////  | |#####|  | | '
  echo '/    /   /  /  //  /// ////  `------------` '
  echo '/    /   /  /  //  /// Linux Install Script'
  sleep 1
  
  # CHECK FOR INTERNET CONNECTION:
  echo "/   /   /  /// Please check to ensure that your internet connection is currently established."
  sleep 3
  read -p "/   /   /  /// Are you ready to continue? [Y/n] " -n 1 -r
  echo

  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    echo
    echo -n "Aborting H:CA Installer..."
    sleep 1
    echo "Now!"
    exit
  fi
  
  
  # EYE CANDY FOR THE HELL OF IT:
  # STFU PLZ. KTHX GTFO BAI.
  declare -a Spinner
  
  Spinner=(/ - \\ \| / - \\ \| )
  Spinnerpos=0
  
  update_spinner()
  {
    printf "\b"${Spinner[$Spinnerpos]}
    (( Spinnerpos=(Spinnerpos +1)%8 ))
  }
  echo
  echo "Initializing shell script..."
  printf "Loading :  "
  
  update_spinner
  sleep 1
  update_spinner
  sleep 1
  update_spinner
  sleep 1
  update_spinner
  sleep 1
  update_spinner
  echo
  echo
  clear
  
  
  # PREPARING TO SERVE THE MEAT AND POTATOES PORTION OF OUR SCRIPT:
  sleep 3
  echo "Shell script ready and initialized!"
  echo
  sleep 1
  echo "Script executing!"
  echo "Hold on tightly!"
  echo
  echo
  
  
  # FOR THE DURATION OF THIS INSTALL PROCESS
  # CREATE A DIR TO STORE ALL OF OUR INSTALL FILES
  mkdir ~/tmp.xxxxx
  
  # UPDATE YOUR SYSTEM
  sudo apt-get install -f
  sudo apt-get -y update
  sudo apt-get -y upgrade
  
  
   clear
  echo -en "\E[31m"
  echo "Installing and configuring Git..."
  sleep 2   
  
  # INSTALL GIT
  sudo apt-get install -y git
  #
  # CONFIG GIT
  
  echo "'Git': successfully installed."
  echo
  echo -n "Configuring Git..."
  echo "Now!"
  echo
  echo
  echo
  echo "[[GitHub]---[H:CA Script v1 beta]]"
  echo
  echo
  echo "      .--------. "
  echo "     / .------. \ "
  echo "    / /        \ \ "
  echo "    | |        | | "
  echo "   _| |________| |_ "
  echo " .' |_|        |_| '. "
  echo " '._____ ____ _____.' "
  echo " |     .'____'.     | "
  echo " '.__.'.'    '.'.__.' "
  echo " '.__  |GitHub|  __.' "
  echo " |   '.'.____.'.'   | "
  echo " '.____'.____.'____.'[H:CA Script v1 beta] "
  echo " '.________________.' "
  echo
  echo
  echo "To start with, we must config Git for usage before doing anything else." 
  echo "It is true that Git sits at the very heart of Github, after all." 
 
    echo -en "\E[31m"
  read -p "/   /   /  /// Enter in your first name: "
  git config --global user.name \"$REPLY\"
  
  echo -en "\E[31m"
  read -p "/   /   /  /// Carefully enter in your email address: " 
  git config --global user.email \"$REPLY\"
  echo
  sleep 2
  
  
  read -p "/   /   /  /// Were you able to enter in the two previous two commands successfully? [Y/n] " -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            # run the commands:
            clear
            sleep 1

            echo -en "\E[31m"
            echo
            echo
            echo  "/   /   /  /// We are checking to see if you have existing SSH keys. Look below for the output."
            echo
            echo

            echo -en "\E[37m"
            ls -al ~/.ssh
            echo 
            echo
  read -p "/   /   /  /// Did you find anything in directory '~/.ssh'? Enter [Y/n]." -n 1
	          if [[ ! $REPLY =~ ^[Yy]$ ]]
                  then
                  read -p "/   /   /  /// We're making you an SSH key. Carefully enter your Email Address."
                  ssh-keygen -t rsa -C \"$REPLY\"
            fi
           ##
           ## ADD YOUR SSH KEY TO GITHUB ACCT. 
            clear
            echo
            echo
            echo "/   /   /  /// Your first assignment, having now just configured Git, is to go and register an account over at GitHub.com." 
            echo "/   /   /  /// The script will wait. Load your browser, do that, and come back when finished."
            echo
            read -p "/   /   /  /// Is your GitHub Account all set up and logged in? Press [Y/n] to continue." -n 1
            echo
	    
	    sudo apt-get install xclip
# Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer (like `yum`)

	    xclip -sel clip < ~/.ssh/id_rsa.pub
# Copies the contents of the id_rsa.pub file to your clipboard
            echo
            echo
            echo
            echo -en "\E[31m"
            echo > ~/Desktop/README_GITHUB.txt
            echo >> ~/Desktop/README_GITHUB.txt
            echo "pbcopy has automagically cut your SSH Key to the clipboard, so that it can be pasted into your GitHub account." >> ~/Desktop/README_GITHUB.txt
            echo "Alternatively, using your favorite text editor, you can open the ~/.ssh/id_rsa.pub file to thereby copy and paste the contents of said file over manually." >> ~/Desktop/README_GI$
            echo >> ~/Desktop/README_GITHUB.txt
            echo >> ~/Desktop/README_GITHUB.txt
            echo "Now that you have the key copied either way, it's time to add it into GitHub:" >> ~/Desktop/README_GITHUB.txt      
            echo >> ~/Desktop/README_GITHUB.txt
      	    echo "(See: https://help.github.com/articles/generating-ssh-keys for accompanying images if such an aide is desired.)" >> ~/Desktop/README_GITHUB.txt
            echo "#1: Load GitHub.com again. In the user bar in the top-right corner of any page, find and click Account settings." >> ~/Desktop/README_GITHUB.txt
            echo "#2: Click 'SSH Keys' in the left sidebar. " >> ~/Desktop/README_GITHUB.txt
            echo "#3: Click 'Add SSH key'." >> ~/Desktop/README_GITHUB.txt
            echo "#4: In the Title field, add a descriptive label for the new key." >> ~/Desktop/README_GITHUB.txt
            echo "For example, if you're using a personal Mac, you might call this key 'Personal MacBook Air'." >> ~/Desktop/README_GITHUB.txt
            echo "#5: Paste your key into the 'Key' field with Ctrl+V." >> ~/Desktop/README_GITHUB.txt
            echo "#6: Click 'Add key'." >> ~/Desktop/README_GITHUB.txt
            echo "#7: Confirm the action by entering your GitHub password." >> ~/Desktop/README_GITHUB.txt
            echo >> ~/Desktop/README_GITHUB.txt
            echo >> ~/Desktop/README_GITHUB.txt
            echo "Finally: Test everything out!" >> ~/Desktop/README_GITHUB.txt
            echo >> ~/Desktop/README_GITHUB.txt
            echo "To make sure everything is working, you'll now try SSHing to GitHub." >> ~/Desktop/README_GITHUB.txt
            echo "When you do this, you will be asked to authenticate this action using your password," >> ~/Desktop/README_GITHUB.txt 
            echo "which was the passphrase you created earlier." >> ~/Desktop/README_GITHUB.txt
            echo  >> ~/Desktop/README_GITHUB.txt
            echo "Open up your Terminal and type:" >> ~/Desktop/README_GITHUB.txt
            echo >> ~/Desktop/README_GITHUB.txt
            echo "ssh -T git@github.com" >> ~/Desktop/README_GITHUB.txt
            echo >> ~/Desktop/README_GITHUB.txt
            echo "Did trying to connect to GitHub via SSH give you an error? Let's hope not!" >> ~/Desktop/README_GITHUB.txt
            echo
            echo "README file for GITHUB has been generated on ~/Desktop..."
            echo
            echo "/   /   /  /// Pause momentarily to load your Desktop screen. Find the GitHub README, and return here when finished with the install instructions."
            read -p "/   /  / /// Press any key to continue" -n 1

            sleep 2
            clear 
 
       fi


  # MAKE SURE HARDWARE WORKS AND INSTALL ANY MISSING DRIVERS
  sudo apt-get install -y linux-firmware-nonfree
  
  # INSTALL CURL FOR EFFICIENT DOWNLOADS
  # You will find yourself using this one sooner or later--trust me.
  sudo apt-get install -y curl
  
  # INSTALL BUILD TOOLS:
  # These contain important libraries for programmers.
  sudo apt-get install -y build-essential
  sudo apt-get install -y ruby
  
  # INSTALL SYNAPTIC AND GDEBI:
  # Synaptic is often considered generally faster and easier than Ubuntu Software Center.
  # Gdebi is very useful when installing .deb files manually. It automatically pulls in
  # the dependencies from the given repos.
  sudo apt-get install -y synaptic
  sudo apt-get install -y gdebi-core
  
  #===================================================================#
  # YOU MUST PICK BETWEEN INSTALLING CHROMIUM AND CHROME BROWSER      #
  # MAIN DIFF. IS CHROMIUM DOESNT COME PRECONFIG'D WITH MEDIA PLUGINS #
  #===================================================================#
  #
  # Uncomment below command to Install CHROMIUM Browser:
  # ie. Chromium is the Open Source version of Chrome Browser
  #    sudo apt-get install chromium-browser
  #
  # OR
  #
  # INSTALL GOOGLE CHROME INSTEAD
  # Google Chromw ( 64 bit )  download and install
  wget -P ~/tmp.xxxxx https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i ~/tmp.xxxxx/google-chrome-stable_current_amd64.deb
  
  # Google Chrome ( 32 bit )  download and install
  #     wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
  #     sudo gdebi google-chrome-stable_current_i386.deb
  
  # INSTALL FLASH FOR CHROME/CHROMIUM AND MOZILLA FIREFOX
  sudo apt-get install -y flashplugin-installer
  sudo apt-get install -y pepperflashplugin-nonfree
  #=====================================================================#
  
  # INSTALL GNOME SYSTEM MONITOR:
  # The gnome system monitor is a simple tool that shows processes, resource usage (cpu, memory,
  # network) and disk usage
  # better than the default Task manager tool that comes with xfce.
  sudo apt-get install -y gnome-system-monitor
  
  
  # INSTALL AN OFFICE SUITE LIKE MSWORD:
  # Better than Xubuntu's defaults
  sudo apt-get install -y libreoffice
  
  
  # INSTALL VLC PLAYER:
  # IT! PLAYS! EVERYTHING!!!!!!111!1!11oneon
  sudo apt-get install -y vlc
  
  
  # INSTALL MULTIMEDIA CODECS:
  # Is additional codecs from the xubuntu-restricted-extras package.
  # These codecs enable multimedia apps to play many more audio/video formats.
  sudo apt-get install -y xubuntu-restricted-extras
  sudo apt-get install -y libavcodec-extra
  
  
  # ENABLE THE PLAYBACK OF CSS (Constant Scrambling System) ENCRYPTED DVDs
  sudo apt-get install -y libdvdread4
  sudo /usr/share/doc/libdvdread4/install-css.sh
  
  
  # INSTALL VIM TEXT EDITOR
  # Because not Emacs is why.
  sudo apt-get install -y vim
  #
  # JUST KIDDING.
  # Here is your EMACS as well.
  sudo apt-get install -y emacs
  
  
  # ADDING USEFUL VIM PLUGIN SUPPORT:
  sudo apt-get install -y ruby
  sudo apt-get install -f
  #
  # VIM ADD-ON MANAGER (VAM)
  wget -P ~/tmp.xxxxx/ http://mirrors.kernel.org/ubuntu/pool/universe/v/vim-addon-manager/vim-addon-manager_0.5.3_all.deb 
  sudo dpkg -i ~/tmp.xxxxx/vim-addon-manager_0.5.3_all.deb
  #
  # ADDING VIM SCRIPTS (TWO DOZEN POPULAR VIM ADD-ONS FTW)
  wget -P ~/tmp.xxxxx/ http://ftp.us.debian.org/debian/pool/main/v/vim-scripts/vim-scripts_20130814_all.deb
  sudo dpkg -i vim-scripts_20130814_all.deb
  # 
  # INSTALL NPM, NODEJS
  sudo apt-add-repository ppa:chris-lea/node.js
  sudo apt-get install -y nodejs
  sudo apt-get update -y
  #
  sudo apt-get install -y python-software-properties
  sudo apt-get install -y npm
  #
  sudo npm install -g jslint
  echo "alias jslint='~/.npm/jslint/0.6.2/package/bin/jslint.js'" >> ~/.bash_aliases
  echo >> ~/.bash_aliases
  echo "'jslint' alias added: VIM plug-in" >> ~/Desktop/README_NEWALIASES.txt
  #
  ##
  echo 'alias netre="sudo /etc/init.d/networking restart"' >> ~/.bash_aliases
  echo "Added alias 'netre' to reboot network quickly." >> ~/Desktop/README_NEWALIASES.txt
  ##
  
  
  #
  # LEARNYOUNODE FOR MUCH WIN! - http://NodeSchool.io
  # This program is the leeter version of CoderByte.com, but for Node.JS
  sudo npm install -g learnyounode #CGHECK OUT nodeschool.io
  
  
  # INSTALL DROPBOX FOR FILE SHARING AND STORAGE
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  echo "Note: ~/.dropbox-dist/dropboxd to run DropBox, and sync with folders of your choosing in home directory." >> ~/Desktop/README_DROPBOX.txt 
  mkdir ~/Dropbox && cp ~/.dropbox-dist/dropboxd ~/Dropbox/dropboxd
  wget -P ~/Dropbox -o ~/Dropbox/dropbox.py www.dropbox.com/download?dl=packages/dropbox.py
  # 
  echo "[[DROPBOX]--[H:CA Script v1 beta]]" > ~/Desktop/README_DROPBOX.txt
  echo >> ~/Desktop/README_DROPBOX.txt
  echo "Navigate to your home directory, and enter the folder named 'Dropbox' therein." >> ~/Desktop/README_DROPBOX.txt
  echo "Use the python program 'dropbox.py' to control your Dropbox through the command line." >> ~/Desktop/README_DROPBOX.txt
  echo "Alternatively, one may use dropboxd in the same folder for the GUI version, if preferred. " >> ~/Desktop/README_DROPBOX.txt


  ###########################################################
  # INSTALL GKSUDO:
  # Lets you run GUI apps as root
  # ie.    To launch any gui app with root privileges, use gksudo
  # eg. To launch Thunar, type-->
  # $ gksudo thunar
  sudo apt-get install -y gksu
  
  
  # INSTALL GUAKE
  # Guake brings a terminal up at the push of a button
  sudo apt-get install -y guake
  #
  # PREMPTIVELY FIXING COMMON GUAKE ERRORS
  sudo mkdir /etc/gconf/schemas
  cd /etc/gconf/schemas/
  sudo ln -s /usr/share/gconf/schemas/guake.schemas
  cd -
  #
  # SET GUAKE TO RUN AFTER EACH BOOT
  sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/
  ##############################################################
  
  
  # INSTALL TMUX FOR PAIR PROGRAMMING, SHELL SPLITTING, ETC.
  sudo apt-get install -y tmux
  
  
  # INSTALL RAR:
  # Thunar file manager has the option to Create Archive in the context menu which allows you to
  # quickly create archive files in many different formats like 7z, tar etc.
  # To add the option to create rar archives, install the rar package.
  sudo apt-get install -y rar
  
  
  # INSTALL GPARTED FOR PARTITIONING
  sudo apt-get install -y gparted
  
  
  # INSTALL JAVA BROWSER PLUG-IN
  # WARNING: Java has lots of vulnerabilities and needs perpetual updating
  # sudo apt-get install -y icedtea-plugin
  
  
  # INSTALL sudo apt-get -y update
  sudo add-apt-repository ppa:webupd8team/sublime-text-3
  sudo apt-get -y update
  sudo apt-get install -y sublime-text-installer
  #
  # SUBLIME PLUGINS
  # HTML5 TIDY (LINTER)
  sudo apt-get install -y tidy
  
  echo "If and when you install a linter that also covers HTML5 for Sublime, you may delete the" 
  echo "current HTML5 Linter by typing itpn terminal: 'sudo apt-get purge tidy', just like so." > ~/Desktop/README_SUBLIME_TEXT.txt
  echo 
  echo "https://sublime.wbond.net/installation: FOR INSTALLATIOM HELP WITH PLUG-INS BELOW">> ~/Desktop/README_SUBLIME_TEXT.txt
  echo "https://sublime.wbond.net/packages/SublimeLinter-jshint" >> ~/Desktop/README_SUBLIME_TEXT.txt
  echo "https://sublime.wbond.net/packages/DocBlockr" >> ~/Desktop/README_SUBLIME_TEXT.txt
  echo "https://sublime.wbond.net/packages/TrailingSpaces"
  echo "https://sublime.wbond.net/packages/HTML-CSS-JS%20Prettify" >> ~/Desktop/README_SUBLIME_TEXT.txt
  
  
  # INSTALL NPM AND NODE.JS
  sudo apt-get install -y python-software-properties
  sudo apt-get install -y npm
  #
  # LEARNYOUNODE FOR MUCH WIN! - http://NodeSchool.io
  # This program is the leeter version of CoderByte.com, but for Node.JS
  sudo npm install -g learnyounode #CGHECK OUT nodeschool.io
  
  
  # INSTALL F.LUX for LINUX:
  # Allows for automatic dimming/brightening of screen according to time of day
  # This can also be done manually when the lights are turned off suddenly so as
  # to not strain the eyes with prolonged use.
  sudo add-apt-repository ppa:kilian/f.lux
  sudo apt-get -y update
  sudo apt-get install -y fluxgui
  #
  # DOWNLOAD AND INSTALL F.LUX DAEMON
  sudo wget -x -P ~/.flux https://justgetflux.com/linux/xflux64.tgz
  sudo tar -zxvf ~/.flux/justgetflux.com/linux/xflux64.tgz && eval sudo cp ~/xflux ~/.xflux/ && eval ~/.flux/xflux -z 94124&
  
  
 # INSTALL COMPRESSION AND DECOMPRESSION TOOLS
  sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils uudeview mpack arj cabextract file-roller
  
  
   # INSTALL ZSH
  sudo apt-get install -y zsh
  #
  # INSTALL OH-MY-ZSH
  wget –no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O – | sh 
  
  
  # INSTALL THEME MANAGER
  sudo add-apt-repository ppa:rebuntu16/other-stuff
  sudo apt-get update
  sudo apt-get install xfce-theme-manager
  
  
  # INSTALL UBTUNTU TWEAK:
  #   Ubuntu Tweak is an application designed to config Ubuntu easier for everyone. Use to change themes if you like it.
  # WORKS WITH ZEN SUITE
  sudo add-apt-repository ppa:tualatrix/ppa
  sudo apt-get update
  sudo apt-get install ubuntu-tweak
  
  
  # INSTALL ZEN SUITE (THEMES, ET AL) 
  sudo add-apt-repository ppa:noobslab/themes
  sudo apt-get update
  sudo apt-get install zen-suite
  
  
  # INSTALL XFCE THEME MANAGER
  sudo add-apt-repository ppa:rebuntu16/other-stuff
  sudo apt-get update
  sudo apt-get install xfce-theme-manager
  sudo apt-get install -f
  
  
  # INSTALLING ALIEN TO CONVERT .RPM and etc Distro pkgs to UBUNTU COMPATIBLE FORMATS 
  sudo apt-get install -y alien
  
  
  # CLEANING UP OUR MESS AND PUTTING AWAY OUR TOYS:
  # Deleting our install folder et al
  sudo rm -rf ~/tmp.xxxxx
  
  echo
  echo
  echo
  
  echo -n "CLEANING UP"
  sleep 1
  echo -n "."
  sleep 1
  echo -n "."
  sleep 1
  echo -n "."
  sleep 1
  echo "."
  clear
  
  
  
  echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  echo "  ___________.___ _______  .___  _________ ___ _____________________ "
  echo " \_   _____/|   |\      \ |   |/   _____//   |   \_   _____/\______ \ "
  echo "  |    __|  |   |/   |   \|   |\_____  \/    ~    \    __)_  |    |  \ "
  echo '  |     \   |   /    |    \   |/        \    Y    /        \ |    `   \ '''''''''''''''
  echo '  |___  /   |___\____|__  /___/_______  /\___|_  /_______  //_______  /  /\   /\   /\  '
  echo '      \/                \/            \/       \/        \/         \/   \/   \/   \/  '
  echo ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  echo
  echo "Your installation is now complete."
  echo "Welcome to Hacker: Coding Academy."
  echo
  echo
  echo "Closing Notes:"
  echo
  echo "-You may now type `gksudo thunar /usr/share/xfce4/backdrops` to discover more desktop backgrounds you might enjoy."
  echo "-zsh has been installed on your computer as an alternative shell to bash. It merely needs to be set up as default if so desired in the next step."
  echo
  echo
  echo

  
    echo "/// / /  /  If you ONLY selected option [-l] by itself, then press [Y] to finish and reboot the machine now." 
    echo "/// / /  /  Otherwise, if you additionally selected [-t] before, then press [n] to continue on with installing your Optimizations."
    read -p "/   /   /  /// Do you need to reboot now? [Y/n] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      # run the commands:
      clear
      sleep 1
      
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo -n "/// / /  /  Going down for a system reboot..."
      sleep 2
      
      echo "Now!"
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      echo
      sudo shutdown -P now
    fi
  fi


  if [ "$mflag" ]
  then
    printf "\nOption -m specified"
    sleep 2
    clear


cat << "EOF"

         :mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-
       +hs::::::::::::::::::::::::::::::::::::::::::::::::::sh+
     +so+:                                                  /+os/
     dM/      -::::::::::::::::::::::::::::::::::::::::-      +My
     dM/    --sdddddddddddddddddddddddddddddddddddddddds--    +My
     dM/   `NM:                                        +Mm    +My
     dM/   `NM:                                        +Mm    +My
     dM/   `NM:         --.        .-.      `--        +Mm    +My
     dM/   `NM:         mMo        yMy      +MN        +Mm    +My
     dM/   `NM:         mMo        yMy      +MN        +Mm    +My
     dM/   `NM:         mMo        yMy      +MN        +Mm    +My         ▄ .▄ ▄▄·  ▄▄▄·             .▄▄ · ▐▄• ▄
     dM/   `NM:         ..`        yMy      `..        +Mm    +My        ██▪▐█▐█ ▌▪▐█ ▀█       ▪     ▐█ ▀.  █▌█▌▪
     dM/   `NM:                    yMy                 +Mm    +My        ██▀▐███ ▄▄▄█▀▀█        ▄█▀▄ ▄▀▀▀█▄ ·██·
     dM/   `NM:                  +smMy                 +Mm    +My        ██▌▐▀▐███▌▐█ ▪▐▌      ▐█▌.▐▌▐█▄▪▐█▪▐█·█▌
     dM/   `NM:                  osss+                 +Mm    +Mh        ▀▀▀ ··▀▀▀  ▀  ▀        ▀█▄▀▪ ▀▀▀▀ •▀▀ ▀▀
     dM/   `NM:             `--         --`            +Mm    +Mh               ▪   ▐  ▄ .▄▄ ·▄▄▄▄▄ ▄▄▄· ▄▄▌  ▄▄▌
     dM/   `NM:             /Nm````````.mN:            +Mm    +My               ██ •█▌▐█▐█ ▀. •██  ▐█ ▀█ ██•  ██•
     dM/   `NM:               .MMMMMMMMN`              +Mm    +My               ▐█·▐█▐▐▌▄▀▀▀█▄ ▐█.▪▄█▀▀█ ██▪  ██▪
     dM/   `NM:                `````````               +Mm    +Mh               ▐█▌██▐█▌▐█▄▪▐█ ▐█▌·▐█ ▪▐▌▐█▌▐▌▐█▌▐▌
     dM/   `NM:                                        +Mm    +Mh               ▀▀▀▀▀ █▪ ▀▀▀▀  ▀▀▀  ▀  ▀ .▀▀▀ .▀▀▀
     dM/   `ss+::::::::::::::::::::::::::::::::::::::::+so    +My         .▄▄ ·  ▄▄· ▄▄▄  ▪  ▄▄▄·▄▄▄▄▄▄         _        ,..    ____
     dM/      odddddddddddddddddddddddddddddddddddddddd+      +My         ▐█ ▀. ▐█ ▌▪▀▄ █·██ ▐█ ▄█•██      ,--._\\_.--, (-00).-| yo.\
     dM/                                                      +My         ▄▀▀▀█▄██ ▄▄▐▀▀▄ ▐█· ██▀· ▐█.▪   ; #         _:(  -)   \___/
     dM/                                                      +My         ▐█▄▪▐█▐███▌▐█•█▌▐█▌▐█▪·• ▐█▌·   :          (_____/
     dM/                                                      +My          ▀▀▀▀ ·▀▀▀ .▀  ▀▀▀▀.▀    ▀▀▀    :            :
     dM/                                                      +My                                          `.___..___.`
     dM/    odddd.                      shhhhhhhhhhhhhhs      +My
     dM/    -////`                      ://////////////:      +My
     dM/                                                      +My
     dM/                                                      +My
     dM/                                                      +My
     dM/                                                      +My
     dM/                                                      +My
     dM/                                                      +My
     ..sddddddddddddddddddddddddddddddddddddddddddddddddddddddo.`         /   /  /  ///PRESS ANY KEY TO CONTINUE
       yMd::::::::::::::::::::::::::::::::::::::::::::::::::mMs
       yMh                                                  dMs
       yMh                                                  dMs
       yMh..................................................dMs
       sNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNo

EOF
read -n 1

echo
echo
echo
echo
echo
echo
sleep 1
clear


cat << "EOF"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::/+os::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::+syy+::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::/sys/:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::/+oooo+///+osso+/::::::::::::::::::::::::::::::::oddh::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::/osyyyyyyyyyyyyyyyy//+oooooo+ooooooo+/::+ooooooo/::sMMN:::/+oooooo/::::::::::::::::::::::::::
::::::::::::::::::::::::::/+++++++++++++++++++hNMMMMMMMymMMMMMMMMd/hMMMMMMMMm+sMMN:+dNMMMMMMMo::::::::::::::::::::::::::
::::::::::::::::::::::::::osssssssssssssssss/mMMd/:/mMMymMMs:/sMMMdhMMh::+NMMNsMMNoNMMs:/hMMh:::::::::::::::::::::::::::
::::::::::::::::::::::::::shhhhhhhhH:CAhhhhh+MMMd/:/mMMymMMs::/mMMdhMMh::/hMMNsMMNyMMMs+yhhs::::::::::::::::::::::::::::
::::::::::::::::::::::::::oyyyyyyyyyyyyyyyyyoomMMNmymMMymMMydmNMMd/hMMhhmNMMm+sMMN:yNMMNmmmmmo::::::::::::::::::::::::::
:::::::::::::::::::::::::::syyyyyyyyyyyyyyyyyso+sss+oss+mMMsssso/::hMMhosss+::+sss:::+sssssss/::::::::::::::::::::::::::
:::::::::::::::::::::::::::+hhhhhhhhhhhhhhhhhhs:::::::::dmmo:::::::ymmy:::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::/yhhhhhhhhhhhhhhho::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::osyyysooosyyys/:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::://:::::::/:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
EOF

sleep 3
clear


echo -en "\E[37m"
echo
echo
echo
echo
echo
echo "/   /  /  /// Start by ensuring that XCode is downloaded.It is available from the app store."
echo "/   /  /  /// Download Link:  https://developer.apple.com/xcode/downloads/"
echo "/   /  /  /// Help for you: https://guide.macports.org/chunked/installing.xcode.html"
echo
echo
echo "/   /  /  /// The script will pause until you have XCode installed, and then we will resume."
read -p  "/   /  /  /// Press [Enter] only when ready, and XCode is successfully installed." -n 1 

echo 
echo
echo
# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update
brew doctor
export PATH="/usr/local/bin:$PATH"
source ~/.bash_profile
source ~/.zsh_profile

brew install node

echo "[[SUBLIME3]]---[[H:CA Script v1 beta]]" >> ~/Desktop/README_SUBLIME3.txt
echo "To install Sublime Text 3: Download and open the .dmg file, and then drag the Sublime Text 3 bundle into the Applications folder." >> ~/Desktop/README_SUBLIME3.txt

# INSTALLING GIT
brew install git

# CONFIGURING GIT


pbcopy < ~/.ssh/id_rsa.pub



fi
  
  
  if [ "$tflag" ]
  then
    printf "\nOption -t specified"
    sleep 2
    clear
    echo
  
    
cat << "EOF"

                           `:+ssss+`
                         .oyo+++++ys
                  `-:+o+oyo+shyhsys.
              .+sssso++++++++syhs-  `://:`
            -syo+++++sy+++yso+++oy+oys++oh-
           :h++/+/+sdhy++yo-ys++++dmo/++od-                          `:/+:`
           mo/+/+/++yh/+om:`sy/+//hdmyydy-   `-::. `-::-` `-:::.   -yyoo+od-::-`
          `sh++++++yd+++hssys+++++hyoo+oh. :syoooyyysoosyysooooys` -d+/+/+hsoosyo`
       -+oyyyyhysosmo+/sh/+++++++hmo+/++d. oh+/++++///++++++++++d. +y+++/+o++/++yo
     /yso++++od-`:ys/++dds++/+osyod+/++ss  sy//++yhs++++oyy+++++d``h+++/ohyh++/+oy`
   `sy++++++++yosyo++/sy.:+++o+:`sy//++d- `d++/+ohhs+/++hsd/+++yo /h++/++ys+++++ys
   :h/++++++++++++++/od-        `mo++++hooyy++++hsd++++syho+/++ysods/++++/+///+od`
   +y+++++++++++++++od:         .do/++/+ohN++/+odsy/+++h/do+++++shd+/++o++++++sy.
   .ho+//++++++++++sy-           :ssooss+/msssso-hyssso: -ssoossods++/+hssooso:`
    .sso++//+++ooss:`              `.```  .```   ..```     `..``-d+++/ss``..`
      .:+ssssso+:.                                              ys//++d-
          ```     ./+ooo+::...`  `.::-                         `myosss/
                 oyo+++++ooooys`/ssosh                          -.```
                -d+++++yddo/+hyys++oh-                             ``..``
                `hs+++oyms+o+hhoo++h:.:+++-:+++.      `.--.`     -osssoss:
              ./syyshyods+yh++oho+sh`hso+sNs++y+    .ossoosso- .syo++++++y+
             /yo++++doys++Ny++dh+/ohsdo/+dNo++h-   /yo++++/+oyyho+++++/+/sh
            -d+/++/++o+++yNyoyms++/+hd+++ys++sh   -d++++/+o+oyd++/+oo/+++y+                     `              `-+/.                    `
            .d++/+//+/++ys-oo-+yo+oyddsoss+++h/   :d+++//ho-+d++/ohsd+++sy`                 `-+sooo-         .+ssoyo                .:osooo`
             /yoo++++oss:      :///:dosyyo/+ys`   `ys++/+oysyo++omhyo+oyo`   `-/++o+::+oo/  sho+//sd+oo+:` -oyo+++hyo` `-/oooo+:.  `hs++/+hyoo+/-
              `:/o+++/.            `ho++++sy/`     .syo+++/++++/os++sho.    -syo+/++syo++d. oy++/++o++++yy/do++/++++h//yso+++/+sy+ `ho+/++oo+++oh+
                                    `:////-      ````:osyss+/++osyhhhsss/. +h++++syy//++sh `do/+/+syo/++/hsdo+/++hooohs/++oyyo/++d/-d++/+osy+++/+m.
                                               -ossssysssym+++syodo+//++ohsh+/+++dyy//++h/ /h+/++yyhs/++/hsd++++so  ss/+++hodo+++ysss///+hod+//+/m.
                                              /h++++++++++++/omo/yh+++++/sM+++++/++++/++h.`ho+++/+o+/++/+dhs/+++h+..h+/+++oso++++d+h+///++o+//++oy`
                                              ys/++odmdy+/++++++++++///++yNo+//+/+o+++/+yshd++/+++++/+++h+d++++/+osymy/++++++/++y+yy//+++++/+++oh-
                                              -ho++/++++osysyso++++/+++sy+:do++ooyhs+++osymo++/+yo++++sy- /ho++++osyooyo+++++oys-.d+/+/oyo+++oys`
                                               `/ossosso+:`  ./+ossosso/`  .+oo+/``/ooo+::m/+++sy+ooo+-    .+ooo+/-   ./+ooo+/.  oy/+++ho+ooo/.
                                                                                         ss/+++d-                                d+/+/+h`
                                                                                        .d++++sy                                /h++++h/
                                                                                        -ho+++:`                                +y++++-
                                                                                          +++                                    +++'


EOF
    echo -en "\E[31m"
    echo
    echo "    'Yo dawg! I heard you liked OS tweaks, so I tweaked your OS so that you can tweak OS tweaks from a tweaked OS.'"
    echo
    sleep 2

    read -p "/   /   /  /// |Press [Enter] key when ready to continue..."   
    # TO DO STILL:
    # CUSTOM H:CA GRUB BOOTSCREN BACKGROUND:
    #     https://sites.google.com/site/easylinuxtipsproject/beautifygrub
    #
    
    
    # CREATE README FOR USER ON DESKTOP TEACHING ABOUT NEW ALIASES
    echo "[H:CA Script v1 beta]" >> ~/Desktop/README_NEWALIASES.txt
    echo >> ~/Desktop/README_NEWALIASES.txt
    echo "Congratulations, and welcome. Included below, you'll find a list of shortcut commands for terminal which have been recently added to increase user functionality." >> ~/Desktop/README_NEWALIASES.txt
    echo "If you wish, keep this as a cheat-sheet of sorts here on your Desktop until all has been learned." >> ~/Desktop/README_NEWALIASES.txt
    echo >> ~/Desktop/README_NEWALIASES.txt
    echo >> ~/Desktop/README_NEWALIASES.txt
    echo "-xkill typed into a terminal will provide you a targeting cursor with which to kill a frozen app via mouse click event. Rarely used, but can be useful to know..." >> ~/Desktop/README_NEWALIASES.txt
    
    
    # SPEED UP INTERNET CONNECTION BY TURNING OFF WIRELESS NIC POWER MANAGEMENT
    # SHORTENS BATTERY LIFE SLIGHTLY ONLY WHEN LAPTOP IS NOT PLUGGED IN BUT SPEEDS
    # UP INTERNET
    echo -en "\E[31m"
    echo "/   /  /  /// Checking to see if you are using wlan0 to access your primary internet connection."
     
    echo -en "\E[37m"
    iwconfig

    echo -en "\E[31m"
    echo    
    echo
    read -p "/   /  /  /// Was your primary internet connection on wlan0 after all, then? Press [Y/n] to continue" -n 1 -r
    echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            sudo tune2fs -c 100 /dev/sda2
        fi
    cd ~/tmp.xxxxx && eval touch wireless
    sudo echo "#!/bin/sh" > ~/tmp.xxxxx/wireless
    sudo echo >> ~/tmp.xxxxx/wireless
    sudo echo "/sbin/iwconfig wlan0 power off" >> ~/tmp.xxxxx/wireless
    sudo mv ~/tmp.xxxxx/wireless /etc/pm/power.d/wireless
    sudo chmod 755 /etc/pm/power.d/wireless
    cd -
    
    
    # ATTEMPT TO SET A MORE REASONABLE TIME PERIOD BETWEEN System File Checks:
    # Verify your Linux partition is indeed SDA2 before continuing.
    #     Changes system file check to every 100 secs instead of 30
    echo -en "\E[31m"
    echo 
    echo
    echo "Ubuntu does System File Checks every 30 secs. Let's set that time to a more reasonable 100 secs per, instead."
    echo "First: is your Linux partition located at '/dev/sda2'? We'll check with you right now using the mount command."
    echo "Ask a teacher if you don't know which based on the output below, but the correct partition should be a type 'ext4', if that helps."
    #
    echo -en "\E[37m"
    echo
    mount | grep sda
    echo
    #
    echo -en "\E[31m"
    read -p "/   /  /  /// Was your Linux partition located on /dev/sda2 after all, then? Press [Y/n] to continue." -n 1 -r
    echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            sudo tune2fs -c 100 /dev/sda2
        fi
    
     echo -en "\E[31m"
     read -p "/   /  /  /// Would you like to configure ZSH as your default shell? Press [Y/n] to continue." -n 1 -r
    echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            chsh -s /bin/zsh
        fi
    
    
    echo -en "\E[31m"
    echo  "/   /  /  /// Checking to see if Firewall is set up."
    echo
    echo -en "\E[37m"
    sudo ufw status
    # ENABLE DEFAULT FIREWALL AT BOOTUP IF NECESSARY
    echo -en "\E[31m"
    echo
    read -p "/   /  /  /// Was your firewall listed as being inactive? Press [Y/n] to continue." -n 1 -r
    echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then

	# Okay. Now it's active. And GUFW is the installed iptables GUI, for your information.
	echo "# /etc/ufw/ufw.conf" >> ~/tmp.xxxxx/ufw.conf
	echo  >> ~/tmp.xxxxx/ufw.conf
	echo "# Set to yes to start on boot. If setting this remotely, be sure to add a rule" >> ~/tmp.xxxxx/ufw.conf
	echo "# to allow your remote connection before starting ufw. Eg: 'ufw allow 22/tcp'" >> ~/tmp.xxxxx/ufw.conf
	echo "ENABLED=yes" >> ~/tmp.xxxxx/ufw.conf
	echo  >> ~/tmp.xxxxx/ufw.conf
	echo "# Please use the 'ufw' command to set the loglevel. Eg: 'ufw logging medium'." >> ~/tmp.xxxxx/ufw.conf
	echo "# See 'man ufw' for details." >> ~/tmp.xxxxx/ufw.conf
	echo "LOGLEVEL=low" >> ~/tmp.xxxxx/ufw.conf
	echo >> ~/tmp.xxxxx/ufw.conf
	sudo cp /etc/ufw/ufw.conf /etc/ufw/ufw.conf.bak
	sudo mv -f ~/tmp.xxxxx/ufw.conf /etc/ufw/
   fi
    
   
    # ADDING SURICATA ("THE SNORT REPLACER")
    sudo aptitude install suricata
    echo "[[SURICATA]---[HCA Script v1 beta]" >> ~/Desktop/README_SURICATA
    echo >> ~/Desktop/README_SURICATA]
    echo "All you need to get going is suricata, and oinkmaster. You have both." >> ~/Desktop/README_SURICATA 
    echo "Feel free to also register at snort's website." >> ~/Desktop/README_SURICATA
    echo "Here are help sites you can pick from to finish configuring Suricata for use:" >> ~/Desktop/README_SURICATA
    echo " - http://www.linux.org/threads/suricata-the-snort-replacer-part-2-configure-test.4348/"  > ~/Desktop/README_SURICATA
    echo " - http://www.cyborgworkshop.org/2014/01/26/install-suricata-oinkmaster-and-emerging-threats/"  > ~/Desktop/README_SURICATA

    # ADD A CRON JOB TO WIPE THE THUMBNAIL FOLDER OF ACCUMULATING IMAGE FILES:
    # PERFORMED TWICE (BIANNUAL FREQ.)
    echo -en "\E[31m"
    echo
    sudo touch ~/.bash_aliases
    echo "/   /  /  /// We are setting up a Cronjob to wipe the image thumbnail folder at a biyearly interval."
    #
    echo -en  "\E[37m"
    crontab -l
    #
    echo -en "\E[31m"
    echo
    read -p "/   /  /  /// Do you already have a Crontab file? Look directly above to find out, and then press [Y/n] to continue." -n 1 -r
    echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
                # ADD A CRON JOB TO WIPE THE THUMBNAIL FOLDER OF ACCUMULATING IMAGE FILES:
                # PERFORMED TWICE (BIANNUAL FREQ.)
                crontab -l > file.txt; echo "0 7 1 6 1 rm -f ~/.cache/thumbnails/normal && echo 'Image thumbnail folder has been wiped in order to free up more disk space.    [H:CA Script v1 beta'" >> file.txt; crontab -l

                crontab -l > file.txt; echo "0 7 1 12 1 rm -f ~/.cache/thumbnails/normal && echo 'Image thumbnail folder has been wiped in order to free up disk space.    [H:CA Script v1 beta'"  >> file.txt; crontab file.txt

                rm -rf file.txt

                echo "Done!"
        fi

        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
                 echo "0 7 1 6 1 rm -f ~/.cache/thumbnails/normal && echo 'Image thumbnail folder has been wiped in order to free up disk space.    [H:CA Script v1 beta]'" | crontab -

                 crontab -l > file.txt; echo "0 7 1 12 1 rm -f ~/.cache/thumbnails/normal && echo 'Image thumbnail folder has been wiped in order to free up disk space.    [H:CA Script v1 beta'" >> file.txt; crontab file.txt

                 rm -rf file.txt

                 echo "Done!"
        fi

   # ADDING CRON JOB TO UPDATE TRIPWIRE
    echo "/   /  /  /// We're setting up a Cron job to update Tripwire weekly"
    #   
    echo -en  "\E[37m"
    crontab -l
    #   
    echo -en "\E[31m"
    echo
    read -p "/   /  /  /// Does root already have a Crontab file? Look directly above to find out, and then press [Y/n] to continue." -n 1 -r
    echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
                crontab -l > file.txt; echo '30 6 * * 2 tripwire -m p /etc/tripwire/twpol.txt' >> file.txt; crontab file.txt
                rm -rf file.txt

        fi

        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
                 echo '30 6 * * 2 tripwire -m p /etc/tripwire/twpol.txt' | crontab -

        fi

echo >> ~/Desktop/OSTWEAKS.txt
echo "SUDO CRONTAB -e TO ADD A CRONTAB AS ROOT. NEXT, YOU WILL COPY PASTA THE FOLLOWING LINES THEREINTO:" >> ~/Desktop/OSTWEAKS.txt
echo "wARNING: YOU WILL HAVE TO ADJUST THE EMAIL ADDRESS TO <YOURUSERNAME>@LOCALHOST, HOWEVER!" >> ~/Desktop/OSTWEAKS.txt
echo "#TO UPDATE TRIPWIRE" >> ~/Desktop/OSTWEAKS.txt
echo "@weekly tripwire -m p /etc/tripwire/twpol.txt" >> ~/Desktop/OSTWEAKS.txt
echo >> ~/Desktop/OSTWEAKS.txt
echo "30 6 */3 * * rkhunter -c | mail -s 'Daily rkhunter report' inf@localhost" >> ~/Desktop/OSTWEAKS.txt
echo >> ~/Desktop/OSTWEAKS.txt
echo "15 7 */3 * * chkrootkit | mail -s 'Daily chkrootkit report' inf@localhost" >> ~/Desktop/OSTWEAKS.txt
echo >> ~/Desktop/OSTWEAKS.txt
echo "30 7 * * * /usr/sbin/tripwire --check | mail -s 'Weekly Tripwire report' inf@localhost" >> ~/Desktop/OSTWEAKS.txt




    # Download and run script for battery tweaks in Ubuntu 14.04/13.10/13.04/12.10/12.04/10.04/Linux Mint 16/15/14/13/and other related Ubuntu derivatives open terminal and enter following commands:
    echo
    read -p "/   /  /  /// Do you want to install battery and power management tweaks? Uninstallation help is provided. Press [Y/n] to continue." -n 1 -r
    echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
              # Download and run script for battery tweaks in Ubuntu 14.04/13.10/13.04/12.10/12.04/10.04/Linux Mint 16/15/14/13/and other related Ubuntu derivatives 
                 cd && wget -P ~/tmp.xxxxx http://drive.noobslab.com/data/improve-battery/laptop-mode && chmod +x ~/tmp.xxxxx/laptop-mode
                 cd ~/tmp.xxxxx && ./laptop-mode
                 cd -
                 sudo bash -c "echo 60 > /proc/sys/vm/swappiness" 
                 #
                 echo "Use this one command to undo/uninstall Laptop Mode and Battery Tweaks: You open terminal, then cut and paste in the following command:" > ~/Desktop/README_LAPTOPMODE
                 echo "sudo apt-get autoremove indicator-cpufreq laptop-mode-tools && FSTABFile='noatime,nodiratime,discard,errors' && sudo sed -i -e 's/$FSTABFile/errors/g' '/etc/fstab' && s$"
        fi
   
   
    #  SPEED UP THE XUBUNTU THE USER INTERFACE:
    # (FASTER LOADING OF BUTTONS, MENUES, ETC)
    echo "gtk-menu-popup-delay = 0" >> ~/.gtkrc-2.0
    echo "gtk-menu-popdown-delay = 0" >> ~/.gtkrc-2.0
    echo "gtk-enable-animations = 0" >> ~/.gtkrc-2.0
    echo "gtk-menu-bar-popup-delay = 0" >> ~/.gtkrc-2.0
    echo "gtk-timeout-expand = 0" >> ~/.gtkrc-2.0
    echo "gtk-timeout-initial = 0" >> ~/.gtkrc-2.0
    echo "gtk-timeout-repeat = 0" >> ~/.gtkrc-2.0
    #
    echo >> ~/Desktop/README_OSTWEAKS.txt
    echo "Added ~/.gtkrc-2.0 with commands to speed up the user interface." >> ~/Desktop/README_OSTWEAKS.txt
    
    
    # And then we will cause TMUX to run whenever a new bash shell opens:
    echo >> ~/.bashrc
    echo "# OPEN TMUX WITH TERMINAL" >> ~/.bashrc      
    echo "if [[ ! $TERM =~ screen ]]; then" >> ~/.bashrc      
    echo "	exec tmux" >> ~/.bashrc      
    echo "fi" >> ~/.bashrc      

    
    echo "Added command to .bashrc which starts TMUX by default on shell launch." >> ~/Desktop/README_OSTWEAKS.txt
    
    
    # ADDING A COMMAND TO RUN xflux daemon AT STARTUP
    #   NO MORE BEING WIDE AWAKE AT 2AM DUE TO BRIGHT MONITORS MIMICKING SUNLIGHT
    mv ~/xflux ~/.xflux/xflux
    echo 'alias fluxon="~/.flux/xflux -z 94124"' >> ~/.bash_aliases
    touch ~/Desktop/README_F.LUX
    echo "GOOGLE F.LUX LINUX TO CHECK OUT HOW TO CONFIGURE F.LUX AUTO SCREEN DIMMING." >> ~/Desktop/README_F.LUX
    echo "OR SEE: https://justgetflux.com/" >> ~/Desktop/README_F.LUX
    cd -
    
    # ADDING AN ALIAS FOR LOCKING OUR SESSION QUICKLY
    echo "alias lockdown = 'xflock4'" >> ~/.bash_aliases
    echo >> ~/.bash_aliases
    
    #
    echo "- An alias to quickly lock your xsession: 'lockscreen'" >> ~/Desktop/README_NEWALIASES.txt
    echo >> ~/Desktop/README_NEWALIASES.txt
    
    
    ## ADDING AN ALIAS TO OPEN CALCULATOR EASIER AND FASTER
    echo "alias calc = 'gnome-calculator'" >> ~/.bashrc
    echo >> ~/.bashrc
    echo "- An alias to open the calculator quickly is 'calc'." >> ~/Desktop/README_NEWALIASES.txt    
    echo >> ~/Desktop/README_NEWALIASES.txt


    # Navigate up the directory path using '..n' instead of 'cd ../../'
    # In the example below, '..4' is used to go back 4 directory levels, and '..3' will go up 3 directory levels, '..2' goes up 2 directory levels...
    #
    echo 'alias ..="cd .."' >> ~/.bash_aliases
    echo 'alias ..2="cd ../.."' >> ~/.bash_aliases
    echo 'alias ..3="cd ../../.."' >> ~/.bash_aliases
    echo 'alias ..4="cd ../../../.."' >> ~/.bash_aliases
    echo 'alias ..5="cd ../../../../.."' >> ~/.bash_aliases
    echo >> ~/.bash_aliases
    #
    echo "- Navigate up the directory path using '..n' instead of 'cd ../../'" >> ~/Desktop/README_NEWALIASES.txt
    echo "      Instead of doing 'cd ..', to 'cd ../../../../..', use '..' to '..5' instead." >> ~/Desktop/README_NEWALIASES.txt
    echo >> ~/Desktop/README_NEWALIASES.txt
   
   
    ## ADDING AN ALIAS TO QUICKLY FIND XFLUX DAEMON TO KILL IT
    echo "alias findflux = 'ps -ax | grep xflux'" >> ~/.bash_aliases
    echo >> ~/.bash_aliases
    echo "- An alias to quickly find the PID of xflux for killing with kill -9 <PID>" >> ~/Desktop/README_NEWALIASES.txt
    
    
    # DISABLE TOUCHPAD WHILE TYPING, AND APPLY A MORE REASONABLE TIME-DELAY HENCEFORTH
    echo 'alias tpdoff="syndaemon -i 1.0 -K -R -t -d"' >> ~/.bash_aliases
    echo 'alias "tpdoff" added to kill mouse touchpad while typing, with a 1 second delay.' >> ~/Desktop/README_NEWALIASES.txt 
    echo "No more accidentally dragging your palm over the laptop touchpad while typing." >> ~/Desktop/README_NEWALIASES.txt 
    

read -p "/   /  /  /// Would you like to install OS Security upgrades?  Press [Y/n] to continue." -n 1 -r
echo    
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
          ###### H:CA SCRIPT: COMPSEC ####

    read -p "/   /  /  ///  Do you use the printer often? I ask, as we will be temporarily disabling listening service CUPS--a listening print service--for you, if not. Press [Y/n]."
        if [[ $REPLY =~ ^[Yy]$ ]]
	then
          # KILLING CUPSD LISTENING SERVICE !
	  sudo service cups-browsed stop
    	  # PREVENTING CUPSD FROM RISING AGAIN AFTER BEING SLAIN BY US AS SUCH
    	  echo "manual" > ~/tmp.xxxxx/cupsd-browsed.override
    	  sudo chown root ~/tmp.xxxxx/cupsd-browsed.override
 	  sudo mv ~/tmp.xxxxx/cupsd-browsed.override /etc/init
	fi
	  # INSTALL SNORT and VAR PREREQ. DEPENDENCIES  	
  	  sudo apt-get install -y rails
  	  sudo apt-get install -y snort
      	  sudo apt-get install -y default-jre
   	  sudo apt-get install -y default-jdk
   	  sudo apt-get install libxslt-dev libxml2-dev
   	  ## INSTALL SNORBY: SNORT GUI
	  sudo git clone git://github.com/Snorby/snorby.git ~/tmp.xxxxx
    	  cd ~/tmp.xxxxx && eval sudo bundle install
	  # UPDATING README      	 
	  echo "[[SNORT IDS]---[H:CA Script v1 beta]] > ~/Desktop/README_SNORTIDS.txt"
      	  echo >> ~/Desktop/README_SNORTIDS.txt
      	  echo "SIGN UP FOR AN OINKCODE NOW! USE IT TO STAY UP TO DATE ON LATEST USER RULES!" >> ~/Desktop/README_SNORTIDS.txt 
      	  echo "OINKCODE NEEDED FOR PULLED PORKS RULE MANAGING ABILITY! USED TO AUTOMAGICALLY DOWNLOAD REGISTERED RULE PACKAGES!" >> ~/Desktop/README_SNORTIDS.txt
  
  
        # INSTALL PULLED PORK FOR AUTOMATIC AND EFFICIENT SNORT RULE MANAGEMENT
        #sudo wget -P /usr/local/snort/ https://pulledpork.googlecode.com/files/pulledpork-0.7.0.tar.gz
        #sudo tar -zxvf /user/local/snort/pulledpork-0.7.0.tar.gz -C /usr/local/snort
      
       # INSTALLING BARNYARD2 FOR USAGE WITH SNORT
       sudo apt-get install -y build-essential libtool autoconf git
       sudo apt-get install -y libpcap-dev libmysqld-dev libprelude-dev
       cd ~ && mkdir ~/barnyard2-install
       git clone git://github.com/firnsy/barnyard2.git
       cd ~/barnyard2-install/ && sudo ./autogen.sh
       CFLAGS=’-lpthread’
       sudo ./configure --with-mysql --with-mysql-libraries=/usr/lib/x86_64-linux-gnu --enable-ipv6 --enable-prelude --prefix=$HOME/barnyard2-install
       sudo make
       sudo make install
         # CONFIGURING BARNYARD2 W/ SNORT IDS 
        sudo cp ~/barnyard2-install/etc/barnyard2.conf /usr/local/snort/etc
	sudo mkdir /var/log/barnyard2
	sudo chmod 666 /var/log/barnyard2
	sudo touch /var/log/snort/barnyard2.waldo
	sudo chown snort.snort /var/log/snort/barnyard2.waldo
        sudo echo "create database snort;" | mysql -u root -p
	sudo echo "grant CREATE, INSERT, SELECT, DELETE, UPDATE on snort.* to snort@localhost identified by 'snortpasswordherechangeme';" | mysql -u root -p 
	sudo mkdir /usr/local/lib/snort_dynamicrules
	cd /usr/lib/; sudo ln -s /usr/local/lib/libdnet.1.0.1 libdnet.1
        # ADDING OPENFPC FOR USAGE WITH SNORBY
        sudo wget http://openfpc.googlecode.com/files/openfpc-0.5-281.tgz
        sudo tar -zxvf openfpc-0.5-281.tgz
	./configure; make; sudo make install
	#
	# Installing LibCaca:
	wget -P ~/tmp.xxxxx caca.zoy.org/files/libcaca/libcaca-0.99.beta19.tar.gz
	cd ~/tmp.xxxxx
        tar -zxvf libcaca-0.99.beta19.tar.gz 
        cd ~/tmp.xxxxx/libcaca-0.99.beta19 && eval sudo ./configure
        sudo make && eval sudo make install
        cd -
        # Toi
        wget -P ~/tmp.xxxxx caca.zoy.org/raw-attachment/wiki/toilet/toilet-0.3.tar.gz
        tar -zxvf ~/tmp.xxxxx/toilet-0.3.tar.gz 
        cd ~/tmp.xxxxx/toilet-0.3 && eval sudo ./configure
        sudo make && sudo make install
        cd -

	
        ##
        # INSTALL TRIPWIRE VIA APTITUDE
        sudo apt-get install -y aptitude
	sudo aptitude install tripwire
	sudo apt-get install -y mailutils
	echo >> ~/.bash_aliases
        echo 'alias starttripwire="sudo tripwire --init"' >> ~/.bash_aliases
	echo "Added 'starttripwire' alias to initialize Tripwire." >> ~/Desktop/README_NEWALIASES.txt
        echo "Easily configuring Tripwire to ensure file-system integrity: https://www.digitalocean.com/community/tutorials/how-to-use-tripwire-to-detect-server-intrusions-on-an-ubuntu-vps" >> ~/Desktop/README_TRIPWIRE
	sudo twadmin --create-polfile /etc/tripwire/twpol.txt
	sudo tripwire --init
	sudo sh -c 'tripwire --check | grep Filename > test_results'
	echo "YOU CAN PICK UP THE INSTALL PROCESS AT: sudo sh -c 'tripwire --check | grep Filename > test_results', WHICH IS WHERE I'VE LEFT YOU OFF." >> ~/Desktop/README_TRIPWIRE
	echo "https://www.digitalocean.com/community/tutorials/how-to-use-tripwire-to-detect-server-intrusions-on-an-ubuntu-vps" >> ~/Desktop/README_TRIPWIRE
   
   

	# Installing SecRelated Aliases
        echo 'alias startsnorby="cd /usr/local/snort/snorby && sudo bundle exec rails server -e production"' >> ~/.bash_aliases

	echo 'alias tripwirecheck="sudo tripwire --check --interactive"' >> ~/.bash_aliases

	echo 'alias tripwirestart="sudo tripwire --init"' >> ~/.bash_aliases

	echo 'alias startsnort="snort -c /usr/local/snort/snort.conf -l /var/log/snort/"' >> ~/.bash_aliases

	echo "This is the order of commands to update Snorby the Suricata/Snort GUI: cd /usr/local/snort/snorby; sudo git pull origin master; eval sudo rake snorby:update;" >> ~/Desktop/README_SNORBYUPDATES

	echo 'alias startfpc="sudo openfpc --action start"' >> ~/.bash_aliases



        echo "/   /  /  /// 'TIGER'--or Tiger Scripts--is a set of Bourne shell scripts, C programs and data"
        echo " -files which are used to perform a security audit of UNIX systems." 
        echo "/   /  /  /// TIGER has one primary goal: report ways root can be compromised. "
        echo "/   /  /  /// That said, do not run TIGER on someone elses computer without their express compliance and consent."
	echo "/   /  /  /// Debians TIGER incorporates new checks primarily oriented towards Debian distributions"
        echo " -including: md5sums checks of installed files, location of files not belonging to packages, check of"
        echo " -security advisories and analysis of local listening processes."
        echo "Also feel free to look up Linux Exploit Suggester and Linuxprivchecker for additional comfort (or discomfort, depending on findings)."x
	sleep 3

        #Install tiger in ubuntu 
        sudo aptitude install tiger
        echo "To use TIGER, just type into terminal: 'sudo tiger', and then give it plenty of time to run through its testing process." >> ~/Desktop/OSSEC.txt

	#X#######################X#
	 ####ROOTKIT DETECTION####

        #X#######################X#
	 # INSTALLING ROOTKITHUNTER -
        sudo apt-get install rkhunter
        echo "Adding 'sudo rkhunter --update' to @weekly cron recommended." >> ~/Desktop/OSSEC.txt
        echo 'alias scanforrootkits="sudo rkhunter -c"' >> ~/.bash_aliases
        echo "Added alias 'scanforrootkits' to allow just that. I suggest adding a cronjob, and piping a mail command to yourself for notification." >> ~/Desktop/README_NEWALIASES.txt
	# INSTALLING CHKROOTKIT -
	sudo apt-get install chkrootkit
	echo "Adding @weekly 'sudo chkrootkit' job to cron is a wise move. CHKROOTKIT INSTALLED." >> ~/Desktop/OSSEC.txt

       # INSTALLING GUFW FIREWALL GUI (REPLACING FIRESTARTER)
        sudo apt-get install gufw 
	echo "Added GUFW Firewall GUI." >> ~/Desktop/OSSEC.txt 
       fi
  
  
    # CREATE README FOR USER ON DESKTOP TEACHING ABOUT NEW ALIASES
    echo >> ~/Desktop/README_NEWALIASES.txt
    echo "[H:CA Script v1 beta]" >> ~/Desktop/README_NEWALIASES.txt
    echo >> ~/Desktop/README_NEWALIASES.txt
    echo "Congratulations, and welcome. Included below, you'll find a list of shortcut commands for terminal recently added to increase user functionality." >> ~/Desktop/README_NEWALIASES.txt
    echo "If you wish, keep this as a cheat-sheet of sorts here on your Desktop until all has been learned." >> ~/Desktop/README_NEWALIASES.txt
    echo >> ~/Desktop/README_NEWALIASES.txt
    echo >> ~/Desktop/README_NEWALIASES.txt
  
    # CLEANING UP AGAIN
    sudo rm -rf ~/tmp.xxxxx
  
  
    # SCRIPT ENDING 
    echo    "/   /   /  /// |The script has now finished executing, and you must reboot your computer immediately."
    read -p "/   /   /  /// |Press [Enter] key to reboot now..."   
    clear
    sleep 1 
    
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo -n "/// / /  /  Going down for a system reboot..."
    sleep 2
    
    echo "Now!"
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    sudo shutdown -P now
    
  fi  

