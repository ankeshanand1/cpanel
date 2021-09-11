# Installation Guide
Unofficial ONE-CLICK Installation Script for WHM/cPanel

**The Shell Script Does the Following things for You:**
1. Setup Hostname
2. The Script Installs STABLE version marked by cPanel/WHM
3. Fixes and Setup the Common Network Problems
4. Installs NANO EDITOR and other Essentials

**For CentOS:**
```
wget -O centos.sh https://raw.githubusercontent.com/ankeshanand1/cpanel/main/installer/centos.sh && chmod 755 centos.sh && ./centos.sh
```
In CentOS-minimal, wget is not included and You have to Install it using:
```
yum -y install wget
```
![Screenshot of a terminal for CentOS Version](/doc/centos.png)  
cPanel/WHM Installation Log File:
```
/etc/cpanel_install.log
```
