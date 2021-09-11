# cPanel Scripts Related to Suspend/Unsuspend of User Accounts

**Suspend All cPanel Accounts:**
```
wget -O quick.sh https://raw.githubusercontent.com/ankeshanand1/cpanel/main/suspend-unsuspend/suspendall.sh && chmod 755 suspendall.sh && ./suspendall.sh
```
In CentOS-minimal, wget is not included and You have to Install it using:
```
yum -y install wget
```

**Unsuspend All cPanel Accounts:**
```
wget -O quick.sh https://raw.githubusercontent.com/ankeshanand1/cpanel/main/suspend-unsuspend/unsuspendall.sh && chmod 755 unsuspendall.sh && ./unsuspendall.sh
```
