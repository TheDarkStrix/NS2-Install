echo "$(tput setab 1)Installing Required Dependencies$(tput sgr 0)"

sudo apt-get install tcl8.5-dev tk8.5-dev
sudo apt-get install build-essential autoconf automake
sudo apt-get install perl xgraph libxt-dev libx11-dev libxmu-dev

echo "$(tput setab 1)Installing NS2$(tput sgr 0)"

sudo ./install

echo "$(tput setab 1)Adding Enviroment Configurations$(tput sgr 0)"
UserName=$(whoami)
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

echo "$(tput setab 1)Installation Completed !$(tput sgr 0)"
