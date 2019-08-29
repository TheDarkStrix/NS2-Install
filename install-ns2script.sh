read -n 1 -p "$(tput setab 1)Select your option ?$(tput sgr 0) \n $(tput setab 1)1) Install NS2-Complete$(tput sgr 0) \n $(tput setab 1)2)Remove dependencies only$(tput sgr 0) \n $(tput setab 1)3)Check for internet connection$(tput sgr 0) \n $(tput setab 1)4)Install only initial build packages$(tput sgr 0) \n $(tput setab 1)5)Refresh Bashrc$(tput sgr 0) \n" choice;
case $choice in
	1)
echo "$(tput setab 1)Installing Required Dependencies$(tput sgr 0)"

sudo apt-get install tcl8.5-dev tk8.5-dev
sudo apt-get install build-essential autoconf automake
sudo apt-get install perl xgraph libxt-dev libx11-dev libxmu-dev

echo "$(tput setab 1)Installing NS2$(tput sgr 0)"

sudo ./install || exit

UserName=$(whoami)
test=google.com
if nc -zw1 $test 443 && echo |openssl s_client -connect $test:443 2>&1 |awk '
  handshake && $1 == "Verification" { if ($2=="OK") exit; exit 1 }
  $1 $2 == "SSLhandshake" { handshake = 1 }'
then
echo "Internet Connection Detected !"
echo "$(tput setab 1)Adding Enviroment Configurations$(tput sgr 0)"
echo 'OTCL_LIB=/home/'${UserName}'/Documents/ns-allinone-2.35/otcl-1.14/' >> ~/.bashrc
echo 'NS2_LIB=/home/'${UserName}'/Documents/ns-allinone-2.35/lib/' >> ~/.bashrc
echo 'USR_Local_LIB=/usr/local/lib/'>> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OTCL_LIB:$NS2_LIB:$USR_Local_LIB'>> ~/.bashrc

# TCL_LIBRARY
echo 'TCL_LIB=/home/'${UserName}'/Documents/ns-allinone-2.35/tcl8.5.10/library/' >> ~/.bashrc
echo 'USR_LIB=/usr/lib/' >> ~/.bashrc
echo 'export TCL_LIBRARY=$TCL_LIBRARY:$TCL_LIB:$USR_LIB' >> ~/.bashrc

# PATH
echo 'XGRAPH=/home/'${UserName}'/Documents/ns-allinone-2.35/xgraph-12.2/:/ewce32/ns-allinone-2.35/bin/:/ewce32/ns-allinone-2.35/tcl8.5.10/unix/:/ewce32/ns-allinone-2.35/tk8.5.10/unix/' >> ~/.bashrc
echo 'NS=/home/'${UserName}'/Documents/ns-allinone-2.35/ns-2.35/' >> ~/.bashrc
echo 'NAM=/home/'${UserName}'/Documents/ns-allinone-2.35/nam-1.15/' >> ~/.bashrc
echo 'export PATH=$PATH:$XGRAPH:$NS:$NAM' >> ~/.bashrc

source ~/.bashrc
echo "$(tput setab 1)Installation Completed !$(tput sgr 0)$(tput sgr 0)"
else
echo "$(tput setab 1)Installation Failed!$(tput sgr 0)"
echo "$(tput setab 1)There is no internet Connected!$(tput sgr 0)"
echo "$(tput setab 1)Connect your computer to the internet then , run this script again!$(tput sgr 0)"
fi
;;
	2)
	echo 'unset TCL_LIB'
	echo 'unset USR_LIB'
	echo 'unset TCL_LIBRARY'
	echo 'unset XGRAPH'
	echo 'unset NS'
	echo 'unset NAM'
	echo 'unset PATH'
	echo "$(tput setab 1)Removed dependencies!$(tput sgr 0)"
	;;
	3)
	test=google.com
if nc -zw1 $test 443 && echo |openssl s_client -connect $test:443 2>&1 |awk '
  handshake && $1 == "Verification" { if ($2=="OK") exit; exit 1 }
  $1 $2 == "SSLhandshake" { handshake = 1 }'
then
echo "$(tput setab 1)Internet Connection Detected !$(tput sgr 0)"
else
echo "$(tput setab 1)There is no internet connection !$(tput sgr 0)"
fi
;;
	4)
echo "$(tput setab 1)Installing Required Dependencies$(tput sgr 0)"
sudo apt-get install tcl8.5-dev tk8.5-dev
sudo apt-get install build-essential autoconf automake
sudo apt-get install perl xgraph libxt-dev libx11-dev libxmu-dev
# For above ubuntu above 14.04
sudo apt-get install xorg-dev
;;
	5)
	source ~/.bashrc ;;
		*)
		exit;;
esac
