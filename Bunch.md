#bunch 

## Documnet Setup

```txt
---
title: <TITLE>
shortcut: <SHORTCUT>
---
```
- `TITLE` - The name of the Bunch in the menu bar
- `SHORTCUT` - Letter you want to use to trigger the shortcut
	- `@` - Command (⌘)
	- `$` - Shift (⇧)
	- `~` - Option (⌥)
	- `^` - Control (⌃)

```txt
## This is how you do a comment

/*
Comments can also be used like this
This way is cool because it is multi-line capable
*/
```

## Applications

```txt
<APPLICATION_NAME>
<APPLICATION_NAME>^
```
- `APPLICATION_NAME` - Just the name on a line will launch the app
- `^` - Force an app to become foreground (and unhide if hidden)

```txt
<APPLICATION_NAME>
- <FILE_PATH>

<APPLICATION_NAME>
- XX
- <FILE_PATH>

FINDER
-> <FILE_PATH>
```
- `-` - Opens a file in the app you specified above
- `XX` - Closes all windows before opening new files
- `->` - Opens a file in a new tab
	- Only works in Finder for now

```txt
%<APPLICATION_NAME>
```
- `%` - This before the application name will stop it from being quit after you close out the bunch

```txt
@<APPLICATION_NAME>
```
- `@` - This focuses the app and hides everything else
- This should be used at the end of the bunch

```txt
@@
```
- `@@` - Hides all apps
- Usually used at the beginning of a bunch

```txt
!!<APPLICATION_NAME>
!!!<APPLICATION_NAME>
```
- `!!` - Launches app when you close the bunch
- `!!!` - Quits app when you clsoe the bunch