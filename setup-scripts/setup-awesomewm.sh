#!/bin/bash
#--CONSTANTS--#
#--COLORS------
Black='\033[0;30m'
Dark_Gray='\033[1;30m'
RED='\033[0;31m'
Light_Red='\033[1;31m'
GREEN='\033[0;32m'
Light_Green='\033[1;32m'
Orange='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
Light_Blue='\033[1;34m'
Purple='\033[0;35m'
Light_Purple='\033[1;35m'
Cyan='\033[0;36m'
Light_Cyan='\033[1;36m'
Light_Gray='\033[0;37m'
White='\033[1;37m'
IT='\033[1;3m'
NC='\033[0m'

QUERY_STRING="dpkg-query -W -f='\${Status}'"
INSTALLED_OK="'install ok installed'"
CUR_DIR=`pwd`
WORKING_DIR=${CUR_DIR/\/setup-scripts//}

# function checks installation
# installation is carried out if second variable is install
# usage check_installation <package name> <install>
check_installation(){
	install_failure=1
	check_install=`$QUERY_STRING $1`
	if [[ $INSTALLED_OK == $check_install ]]; then
		printf "$GREEN $1 `dpkg-query -W -f='${version}' $1` found$NC\n"
		install_failure=0
		return 0
	else
		printf "$IT no $1 version found $NC"
		if [[ $2 == "install" ]]; then
			printf "$IT Attempting to install $1 $NC\n"
			sudo apt install "$1" -y
			retVal=$?
			if [ $retVal == 0 ]; then 
				install_failure=0
			else
				install_failure=1
			fi
			return retVal
        else
            sudo apt install "$1"
		fi
	fi
}

# function makes a hardlink after testing existence of file
# usage: link_after_test <source> <dest_filename> <dest base folder>
link_after_test(){
	if [ ! -e "$3" ]; then
		mkdir -p "$3"
	fi
	if [ -e "$3/$2" ]; then
		log_info "backing up $3/$2"
		mv "$3/$2" "$3/copy_$2_bak"
	fi
if `ln -s "$WORKING_DIR/$1" "$3/$2"` ; then 
	printf "$GREEN linked $1 to $3/$2 $NC\n"
else
	printf "$RED error linking $1 to $3/$2 $NC\n"
fi
}

# decorator string
decor_print(){
	printf "$BLUE--------------- $1 ---------------------$NC\n"
}

log_info(){
	printf "$GREEN[Log:INFO]: $IT $1 $NC\n"
}

log_warn(){
	printf "$YELLOW[Log:WARN]: $IT $1 $NC\n"
}

log_err(){
	printf "$RED[Log:ERROR]: $IT $1 $NC\n"
}

decor_print "setting up awesome wm"
BASE_FOLDER="$HOME/.config/awesome"
log_info "installing awesomewm"
sudo apt update
check_installation "awesome" "install"
check_installation "awesome-extra" "install"
log_info "installing lua filesystem, git, acpi, mpd, mpc"
check_installation "lua-filesystem"
check_installation "git" "install"
check_installation "acpi" "install"
check_installation "mpd" "install"
check_installation "mpc" "install"


link_after_test "awesome/rc.lua" "rc.lua" "$BASE_FOLDER"
link_after_test "awesome/holo_theme.lua" "holo_theme.lua" "$BASE_FOLDER"
link_after_test "awesome/theme.lua" "theme.lua" "$BASE_FOLDER"
