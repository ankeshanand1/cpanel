# cPanel Scripts

Scripts which can simplify the life of a cPanel SysAdmin!

## 1. Fix File Permissions

### Requirements:

* Root User

### Installation:

#### RELEASE
```
wget -O fixperms.sh https://raw.githubusercontent.com/ankeshanand1/cpanel/main/scripts/fixperms.sh && chmod 755 fixperms.sh && ./fixperms.sh
```

### Usage
```
Fix perms script help:
Sets file/directory permissions to match suPHP and FastCGI schemes
USAGE: fixperms [options] -a account_name
-------
Options:
-h or --help: print this screen and exit
-v: verbose output
-all: run on all cPanel accounts
--account or -a: specify a cPanel account
```
#### Examples
Fix All Accounts
```
./fixperms.sh -all
```
Fix Specific Account
```
./fixperms.sh --account USERNAME
```
Show output
```
./fixperms.sh -all -v
./fixperms.sh -v --account USERNAME
```
