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
echo "    cPanel Suspend All Accounts      "
echo "Author: Ankesh Anand                 "
echo "Copyright: GNU General Public License"
echo "Version: 1.0.0                       "
echo "Release Date:                        "
echo "Credits: cPanel/WHM, Github          "
echo "-------------------------------------"
sleep 1
echo ""

echo -e "${YELLOW}Enter the Suspend Reason?${NC}"
read suspend
if [[ "$suspend" ]];then
echo -e "${GREEN}Suspend Reason: $suspend ${NC}"
else
suspend='Unspecified'
echo -e "${GREEN}Suspend Reason: ${suspend} ${NC}"
fi

cd /var/cpanel/users/
for user in *
do
if [ "$user" = "root" ] || [ "$user" = "nobody" ];then
continue
else
/usr/local/cpanel/scripts/suspendacct $user "$suspend" > /etc/suspendall.log
echo -e "${YELLOW}Suspended Username $user ${NC}"
fi
done
echo ""
echo -e "${GREEN}Suspended All Users${NC}"
echo -e "${GREEN}Goodbye!${NC}"
