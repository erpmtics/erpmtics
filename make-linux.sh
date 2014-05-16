#!/usr/bin/env sh
# -*- coding: UTF-8 -*- 


# Copyright (C) 2014 Armando Ibarra
#  v0.1 alpha - 2014
# 

#----------------------------------------------------------------------
# .sh
#
# Author: Ing. Armando Ibarra - armandoibarra1@gmail.com
# Email: armandoibarra1@gmail.com
# Date: 16/04/2014 
# Purpose:
#    Performs the install dependences for this app 
#    this shell script try to install depencences 
#    on linux OS, invokes some system commands like
#    sudo, pacman, apt-get install, etc
#
#
#----------------------------------------------------------------------

###############################################################################

# Try to build your environment on Linux for run app erpmtics

# Licensed under the GNU LGPL v2.1 - http://www.gnu.org/licenses/lgpl-2.1.html
# - or any later version.
# @author: Ing. Armando Ibarra

# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
###############################################################################

#variables

#autor and project data
AUTHOR='Ing. Armando Ibarra <armandoibarra1@gmail.com>'
COPYRIGHT='Copyright (c) 2014, armandoibarra1@gmail.com'
LICENSE='GNU LGPL Version 2.1'

#Repos data
URL_GIT_REPO="https://github.com/erpmtics/erpmtics"

#colors bash script
GREEN="\033[1;32m"
RESET="\033[0m"
WHITE="\033[1;37m"
BLUE="\033[1;34m"
RED="\033[1;31m"

#scripts utils
DIR_SCRIPTS=$('pwd')
THIS_SCRIPT_PATH=`readlink -f $0`
THIS_SCRIPT_DIR=`dirname ${THIS_SCRIPT_PATH}`

ERPMTICS_TARBALL=${THIS_SCRIPT_DIR}/erpmtics-0.1.tar.gz

PATH_HOME_APP=$THIS_SCRIPT_DIR
PORT_DEF=3000
PATH_DB_MONGO_ROOT="/data"
PATH_DB_MONGO="/data/db"
APP_TMP=$PATH_HOME_APP/app.js
DEPENDENCIES="sudo curl axel wget ssh npm mongo pip python-pip python2-virtualenv"
DEPENDENCIES_PY="adodb"
DEPENDENCIES_NODE="connect sails yeoman-generator stylus jade"
PATH_SEARCH_LOGS=$HOME
DHCP_FILE_IP=$HOME/erpmtics.conf

#
deps_ok=NO

#ArchLinux manager packages
alias install="sudo packer -S --noconfirm --noedit"


[ "$(whoami)" != 'root' ] && ( echo "########## WARNING: you are using a non-privileged account
	normaly this is necesary to intall dependences"; exit 1 )

#will grant only the owner of that file execution permissions  
chmod u+x *.sh

show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Mount dropbox ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Mount USB 500 Gig Drive ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Restart Apache ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} ssh Frost TomCat Server ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}

check_dependences(){

deps_ok=YES
for dep in $DEPENDENCIES
        do
             if ! which $dep &>/dev/null;  then
                        deps_ok=NO
                        echo "============================================================";
                        echo "***** This script requires $dep to run but it is not installed";
                        echo "============================================================";
                        install $dep
                        #echo "Try to install dependences";
             fi

        done

deps_ok=YES
for dep in $DEPENDENCIES_PY
        do
             if ! which $dep &>/dev/null;  then
                        deps_ok=NO

                        echo "***** Depencences Python;";
                        echo "============================================================";
                        echo "This script requires $dep to run but it is not installed";
                        echo "============================================================";
                        #echo "Try to install dependences";
                        sudo pip install $dep
             fi

        done

}

report_bug() {
  echo "Please file a bug report at ${WEB_SITE}"
  echo "Project: Ubuntuone sync erpmtics"
  echo "Component: Packages"
  echo "Label: erpmtics"
  echo "Version: $VERSION_SCRIPT"
  echo " "
  echo -e ""$GREEN"Please detail your operating system type, version and any other relevant details" ""$RESET""
}


install_dependences(){

	echo -e "......................................"
	echo -e "......................................"
	echo -e "......................................"
	echo -e "......................................"
	echo -e "Try to install dependences, please wait ...."

	deps_ok=YES
	for dep in $DEPENDENCIES
        do
             if ! which $dep &>/dev/null;  then
                        deps_ok=NO
                        echo "============================================================";
                        echo -e "***** This script requires $dep to run but it is not installed";
                        echo -e "***************************************************************";
                        sudo pacman -S $dep
                        #if not exist install with packer
                        #instalar $dep
                        echo "============================================================";
                        #echo "Try to install dependences";
             fi

        done

    deps_py_ok=YES
	for dep in $DEPENDENCIES_PY
        do
             if ! which $dep &>/dev/null;  then
                        deps_py_ok=NO
                        echo "============================================================";
                        echo "***** This script requires $dep to run but it is not installed";
                        echo -e "***************************************************************";
                        #sudo pip2 install $dep
                        echo "============================================================";
                        #echo "Try to install dependences";
             fi

        done    

   
}

install_dependences_manual()
{
	URL_SOUCE="http://sourceforge.net/projects/adodb/files/adodb-python/adodb-py-210/adodb-220.zip/download"
	#https://github.com/pld-linux/python-adodb/blob/master/python-adodb.spec

	#search on system python 
	whereis python2.7	

	deps_ok=YES
	for dep in $DEPENDENCIES_PY
	        do
	             if ! which $dep &>/dev/null;  then
	                        deps_ok=NO

	                        echo "***** Depencences Python manual ";
	                        echo "============================================================";
	                        echo "This script requires $dep to run but it is not installed";
	                        echo "============================================================";
	                        #sudo pip2 search $dep
 							python -c "import $dep"

	                        if test $? -ne 0; then
							    echo "#######################Please, wait try to install mode manual #################"
							    #axel -n 50 $URL_SOUCE

							    #wget -qO- | unzip -tq \*.zip
							    #wget: saving a file to a custom location
							    

							    if [ ! -f "$DIR_SCRIPTS/dependences_bin/$dep.zip" ]; then
								    								   
								    wget -O $DIR_SCRIPTS/dependences_bin/$dep.zip $URL_SOUCE
								   	
								   	if cd $DIR_SCRIPTS/dependences_bin/ ; then
								    	unzip $dep.zip -d $DIR_SCRIPTS/dependences_bin/$dep
								    	#cd $DIR_SCRIPTS/dependences_bin/$dep | mv 
								    	FILE_SETUP_PY=$(find adodb -name 'setup.py')

								    	echo $FILE_SETUP_PY
								    	#grep -i -R 'setup.py' dependences_bin/adodb

								    	#sudo python2 setup.py install
								    	sudo python2 $FILE_SETUP_PY install

								    	python -c "import $dep"
								    	
								    	cd $DIR_SCRIPTS
									fi								

								else
									echo "Requirements installed."								    
								fi

								pwd
								

							    #report_bug
							    #exit 1
							else 
								echo "####################### Installation ok #################33"
								    
							fi
	                       
	                        #echo "Try to install dependences";
	             fi

	        done


}

#Testing all dependences 
echo "============================================================";
echo -e "\n Please wait, checking dependences .. \n"
echo "============================================================";
#echo -e "\n linea 1 \n linea 2 \n" > salida.txt
#Set keyboard on spanish 
sudo setxkbmap es

#check dependences for app
check_dependences

echo "============================================================";

if [ "$deps_ok"=="NO" ]; then

	read -p "Do you wish to install dependences? [Yes (y) / No (n)]" choice
	case "$choice" in 
	  y|Y ) echo "yes"
			install_dependences

			echo "Testing server, please wait ..."
			sleep 2	
			#install_dependences_manual
			
			;;
	  n|N ) echo "no"
			exit 0
		
		;;
	  * ) echo "invalid";;
	esac
fi

exit 0