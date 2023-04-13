#linux

## Navigation

- ls - list what is in your working directory
- pwd - shows where you are on the device
- cd - change directory


## File Manipulaiton

- Nano - make a new file and add text to it
	- ⌃ O - save file
	- ⌃ X - leave file
- cat - view file
- rm - remove a file
- mv - move a file
- cp - copy a file
- touch - make a new empty file
- sort - sort the files
- sort -r sort files in reverse
- sort -n - sort files in number order
	- sort -n -r - sort files in reverse number order
- sort -M - sort files in month order
	- sort -m -r - sort files in reverse month order
- ls -a - finds all hidden items in your directory
- grep - finds words inside ONE File
- grep -r - finds all words indise ALL files
- grep -i - finds what you want ignoring case


## Directory Manipulation

- mkdir - make new directory
	- rm -fr - to remove if directory has contents
- rmdir - remove directory
-


## Device Manipulation

- Sudo halt - shuts down device
- Sudo reboot - reboots device
- Sudo shutdown -h now - shuts down the device instantly
- Sudo shutdown -h now -r - shuts down device instantly then restarts
-

## Python

- python - run a python file
	- python3 - run a python file after version 3.0.0

## Network Commands

- ifconfig - find info on device
- ping - pings device
- ssh - remotly use


## Other Commands

- clear - clears the terminal
- ⌃C - stop any command
- sudo useradd (name) -m -s /bin/bash -g users - add new user
- sudo passwd (name of user) - changes or adds password for specified user
- sudo login - login to user
- logout - logout of user
- sudo userdel (name of user) - deletes the user but not their files
- sudo userdel -r (name of user) - deletes user and their files
- chmod - change permission
	- add up what you want them to do
	- d rwx rwx rwx
		- r - read
		- w - write
		- x - execute
	-     421 421 421


## Other symbols

- * - wildcard. Means anything
- > - sends output somewhere else
- ~ - home directory
- .(dot) - cirrent directory
- |(pipe) - send output to input
