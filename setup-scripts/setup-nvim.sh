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
WORK_DIR=${CUR_DIR/\/setup-scripts//}

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
if `ln -s "$WORK_DIR/$1" "$3/$2"` ; then 
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

decor_print "Setting up Neovim"
base_folder="$HOME/.config/nvim"
target_file='init.vim'
check_installation "snapd" "install"
check_install=`$QUERY_STRING neovim`
if [[ "$check_install" == "$INSTALLED_OK" ]]; then
    installed_noevim_version=`dpkg-query -W -f='${version}' neovim`
    if [[ "$installed_noevim_version" < 0.4 ]]; then
       log_info "requires version > 0.4 installing from snap store"
       sudo apt remove neovim -y
       sudo snap install --edge nvim --classic
       sudo rm -rf /usr/bin/nvim
       sudo ln -s /snap/bin/nvim /usr/bin/nvim
       log_info "neovim remove because version < 0.4"
    fi
else
    sudo snap install --edge nvim --classic
    if [[ -e "/usr/bin/nvim/" ]]; then
        sudo rm -f /usr/bin/nvim
    fi
    sudo ln -s /snap/bin/nvim /usr/bin/nvim
fi
link_after_test ".config/nvim/init.vim" $target_file $base_folder
check_installation "python"
if [ $install_failure == 0 ] ; then 
	sed -i "s|.*python_host_prog.*|let g:python_host_prog=\'`which python`\'|g" .config/nvim/init.vim
	check_installation "python-pip"
	if [ $install_failure == 0 ] ; then 
		pip install --upgrade pynvim
        pip install python-language-server python-jsonrpc-server
	else
		log_err "couldn't install pynvim"
		log_warn "Try running pip install pynvim"
	fi
else
	log_err "couldn't set python_host_prog in init.vim."
fi

check_installation "python3"
if [ $install_failure == 0 ] ; then 
	sed -i "s|.*python3_host_prog.*|let g:python3_host_prog=\'`which python3`\'|g" .config/nvim/init.vim
	check_installation "python3-venv" "install"
	check_installation "python3-pip"
	if [ $install_failure == 0 ] ; then 
		pip3 install --upgrade pynvim
        pip3 install python-language-server python-jsonrpc-server
	else
		log_err "couldn't install pynvim"
		log_warn "Try running pip3 install pynvim"
	fi
else
	log_err "couldn't set python3_host_prog in init.vim."
fi
check_installation "exuberant-ctags" "install"
check_installation "pylint" "install"
check_install=`$QUERY_STRING npm`
if [[ "$check_install" != "$INSTALLED_OK" ]]; then
    log_info "installing npm version 12"
    sudo snap install node --channel=12/stable --classic
fi
if [[ `node --version` > 10 ]]; then
    npm install -g neovim
    log_info "run :LspInstallServer on supported filetypes for code completion"
else
    log_err "couldnt install node 10. please install node >= 10 for language server support"
    log_info "after installing npm > 10, run npm install -g neovim"
fi

