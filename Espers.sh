#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;33m'
NC='\033[0m'
echo "${BLUE}******************** Espers Wallet Auto-Install ****************************${NC}"
echo "${GREEN}******************************* by worgon12 ****************************************${NC}"
sleep 5

echo "${BLUE}System Update and dependencies install!${NC}"
cd ~; sudo apt-get install ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev libcurl4-openssl-dev curl libzip-dev -y; sudo apt-get update; sudo apt-get upgrade -y; sudo apt-get install git make au$
sleep 5

echo "${BLUE}Berkeley-db Download and Compile!${NC}"
cd ~; wget http://download.oracle.com/berkeley-db/db-6.2.32.NC.tar.gz; tar zxf db-6.2.32.NC.tar.gz; cd db-6.2.32.NC/build_unix; ../dist/configure --enable-cxx; make; sudo make install; sudo ln -s /usr/local/BerkeleyDB.6.2/lib/libdb-6.2.$
sleep 5

echo "${BLUE}Espers Source Download, Compile and create config File!${NC}"
cd ~; git clone https://github.com/CryptoCoderz/Espers
cd ~; cd ~/Espers/src; chmod a+x obj; chmod a+x leveldb/build_detect_platform; chmod a+x leveldb; chmod a+x ~/Espers/src; chmod a+x ~/Espers; make -f ~/Espers/src/makefile/makefile.unix USE_UPNP=-; cd ~; sudo cp ~/Espers/src/Espersd /us$
cd ~; sudo ufw allow 22448/tcp; sudo ufw allow 22442/tcp; sudo mkdir ~/.ESP; cat << "CONFIG" >> ~/.ESP/Espers.conf
listen=1
server=1
daemon=1
testnet=0
rpcuser=espersuser
rpcpassword=SomeCrazyVeryVerySecurePasswordHere
rpcport=22442
port=22448
rpcconnect=127.0.0.1
rpcallowip=127.0.0.1
addnode=198.50.180.207
addnode=85.255.7.52
addnode=195.181.211.221
addnode=176.31.205.41
addnode=116.14.167.86
addnode=167.99.171.227
addnode=174.107.102.219
addnode=176.9.156.236
addnode=198.50.180.193
addnode=94.130.64.143
addnode=145.239.65.6
addnode=108.61.175.156
addnode=46.4.27.201
addnode=149.56.154.75
addnode=50.46.99.238
addnode=159.89.114.40

CONFIG
chmod 700 ~/.ESP/Espers.conf; chmod 700 ~/.ESP; ls -la ~/.ESP
sleep 5

echo "${BLUE}Espers-qt Compile!${NC}"
sudo apt-get install qt5-default qt5-qmake qtbase5-dev-tools qttools5-dev-tools build-essential libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libssl-dev libdb++-dev libminiupnp$
cd ~; cd ~/Espers; qmake; make;

echo "${GREEN}done${NC}"
echo "${GREEN}finish${NC}"
echo "${GREEN}Start the Wallet headless with Espersd on Terminal${NC}"
echo "${GREEN}Start the Wallet over VNC with Espers.qt on Desktop${NC}"
sleep 10
exit 0

