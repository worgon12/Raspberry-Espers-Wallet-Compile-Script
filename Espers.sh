#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;33m'
NC='\033[0m'

echo "${BLUE}******************** Raspberry Espers Wallet Auto-Install ****************************${NC}"
echo "${GREEN}******************************* by worgon12 ****************************************${NC}"
sleep 5
echo "${RED}First of all we will System Update and install the dependencies${NC}"
echo "${RED}Starting installing the dependencies, please do not close the window${NC}"
sleep 5

echo "${BLUE}System Update and dependencies install!${NC}"
sleep 5
sudo apt update
sudo apt update -y
sudo apt-get install ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev libcurl4-openssl-dev curl libzip-dev git make automake build-essential libboost-all-dev yasm binutils libcurl4-openssl-dev openssl libssl-dev libgmp-dev qt5-default qt5-qmake qtbase5-dev-tools qttools5-dev-tools
echo "${GREEN}done${NC}"
sleep 5
echo "${BLUE}Berkeley-db5 install!${NC}"
cd ~; wget http://download.oracle.com/berkeley-db/db-6.2.32.NC.tar.gz; tar zxf db-6.2.32.NC.tar.gz; cd db-6.2.32.NC/build_unix; ../dist/configure --enable-cxx; make; sudo make install; sudo ln -s /usr/local/BerkeleyDB.6.2/lib/libdb-6.2.so /usr/lib/libdb-6.2.so; sudo ln -s /usr/local/BerkeleyDB.6.2/lib/libdb_cxx-6.2.so /usr/lib/libdb_cxx-6.2.so; export BDB_INCLUDE_PATH="/usr/local/BerkeleyDB.6.2/include"; export BDB_LIB_PATH="/usr/local/BerkeleyDB.6.2/lib"; cd ~;
echo "${GREEN}done${NC}"
sleep 5
echo "${BLUE}Clone Espers${NC}"
cd ~; git clone https://github.com/CryptoCoderz/Espers
echo "${GREEN}done${NC}"
sleep 5
echo "${BLUE}Build Espers daemon${NC}"
cd ~; cd ~/Espers/src; chmod a+x obj; chmod a+x leveldb/build_detect_platform; chmod a+x leveldb; chmod a+x ~/Espers/src; chmod a+x ~/Espers; make -f ~/Espers/src/makefile/makefile.unix USE_UPNP=-; cd ~; sudo cp ~/Espers/src/Espersd /usr/local/bin;
echo "${GREEN}done${NC}"
sleep 5
echo "${BLUE}Build Espers-qt${NC}"
cd ~; cd ~/Espers; qmake; make;
cd ..
echo "${GREEN}done${NC}"
echo "${GREEN}finish${NC}"
echo "${GREEN}Start the Wallet over VNC with Espers.qt on Desktop${NC}"
sleep 10
exit 0
