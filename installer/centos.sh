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
echo "Version: 1.0.5                       "
echo "Release Date: 25/09/2021             "
echo "Credits: cPanel/WHM, Github          "
echo "-------------------------------------"
sleep 1
echo ""

echo -e "${YELLOW}What Hostname would you like to keep?${NC}"
read host
if [[ "$host" ]];then
hostnamectl set-hostname $host --static
else
echo -e "${RED}You did not enter a HostName, Goodbye${NC}"
exit
fi
sleep 1
echo -e "${GREEN}Your Hostname is set to '"$host"'${NC}"

echo "Installation would start in 10sec. To Cancel Installation,Click Ctrl+C"
sleep 10

echo -e "${YELLOW}Updating System${NC}"
sleep 1
yum -y update > /dev/null 2>&1 && yum -y upgrade > /dev/null 2>&1
yum -y install epel-release > /dev/null 2>&1
yum -y install perl > /dev/null 2>&1
yum -y install curl > /dev/null 2>&1

echo -e "${YELLOW}Setting Up the Network${NC}"
sleep 1
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
systemctl stop NetworkManager > /dev/null 2>&1
systemctl disable NetworkManager > /dev/null 2>&1
inth=$(netstat -i | grep '^[a-z]' | awk '{print $1}' | grep -v 'lo')
FILE=/etc/sysconfig/network-scripts/ifcfg-$inth
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
hostnamectl set-hostname $host --static
yum -y install nano > /dev/null 2>&1

if (systemctl -q is-active cpanel.service); then
  echo ""
  echo -e "${YELLOW}Everything set! Server needs a Reboot. Reboot Now(Y/N)${NC}"
  read RBOOT
  echo -e "${GREEN}Goodbye!${NC}"
  if [[ "$RBOOT" == "Y" || "$RBOOT" == "y" ]]
  then
  reboot
  else
  echo -e "${GREEN}Goodbye!${NC}"
  fi
else
  echo -e "${RED}cPanel Installation Failed or cPanel Service has Failed. Please Check Log File Available at /etc/cpanel_install.log ${NC}"
  echo -e "${RED}Goodbye!${NC}"
fi
