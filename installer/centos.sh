#!/bin/bash

# ----------------------------------
# Colors
# ----------------------------------
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

sleep 1
echo "-------------------------------------"
echo "          cPanel Installer           "
echo "Author: Ankesh Anand                 "
echo "Copyright: GNU General Public License"
echo "Supported OS: CentOS7.9,Centos8      "
echo "Version: 1.0.0                       "
echo "Release Date:                        "
echo "Credits: cPanel/WHM, Github          "
echo "-------------------------------------"
sleep 1
echo ""

echo -e "${YELLOW}What Hostname would you like to keep?${NC}"
read HOST
hostnamectl set-hostname $HOST --static
sleep 1
echo -e "${GREEN}Your Hostname is set to '"$HOST"'${NC}"

echo "Installation would start in 10sec. To Cancel Installation,Click Ctrl+C"
sleep 10

echo -e "${YELLOW}Setting Up the Network${NC}"
sleep 1
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
systemctl stop NetworkManager > /dev/null 2>&1
systemctl disable NetworkManager > /dev/null 2>&1
FILE=/etc/sysconfig/network-scripts/ifcfg-eth0
if test -f "$FILE"; then
sed -i 's/NM_CONTROLLED=yes/NM_CONTROLLED=no/g' /etc/sysconfig/network-scripts/ifcfg-eth0 > /dev/null 2>&1
sed -i 's/ONBOOT=no/ONBOOT=yes/g' /etc/sysconfig/network-scripts/ifcfg-eth0 > /dev/null 2>&1
fi
LO=/etc/sysconfig/network-scripts/ifcfg-lo > /dev/null 2>&1
if test -f "$LO"; then
sed -i 's/NM_CONTROLLED=yes/NM_CONTROLLED=no/g' /etc/sysconfig/network-scripts/ifcfg-lo > /dev/null 2>&1
sed -i 's/ONBOOT=no/ONBOOT=yes/g' /etc/sysconfig/network-scripts/ifcfg-lo > /dev/null 2>&1
fi
systemctl enable network.service > /dev/null 2>&1
systemctl start network.service > /dev/null 2>&1

echo -e "${YELLOW}Updating System${NC}"
sleep 1
yum -y update > /dev/null 2>&1 && yum -y upgrade > /dev/null 2>&1

echo -e "${YELLOW}Installing cPanel/WHM and Packages${NC}"
sleep 1
echo "CPANEL=stable" >> /etc/cpupdate.conf
echo "RPMUP=daily" >> /etc/cpupdate.conf
echo "SARULESUP=daily" >> /etc/cpupdate.conf
echo "STAGING_DIR=/usr/local/cpanel" >> /etc/cpupdate.conf
echo "UPDATES=manual" >> /etc/cpupdate.conf
cd /home
curl -o latest -L https://securedownloads.cpanel.net/latest
echo""
echo -e "${GREEN}Sit Back and Relax! Installation has started${NC}"
echo -e "${GREEN}Installation takes 20-30min or more depending upon CPU ${NC}"
sh latest > /etc/cpanel_install.log

echo -e "${RED}Errors(warn) May be Shown. Don't Worry!${NC}"
echo ""
echo -e "${YELLOW}All Packages Installed. Finishing Installation${NC}"
sleep 1
hostnamectl set-hostname $HOST --static
yum -y install nano > /dev/null 2>&1
curl -s https://install.speedtest.net/app/cli/install.rpm.sh > /dev/null 2>&1 | sudo bash > /dev/null 2>&1
yum -y install speedtest

echo ""
echo -e "${YELLOW}Everything set! Server needs a Reboot. Reboot Now(Y/N)${NC}"
read RBOOT
if [[ $RBOOT -gt 'Y' ]]
then
reboot
else
echo -e "${YELLOW}Goodbye!${NC}"
fi
