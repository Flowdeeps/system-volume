# Mac OS X System Volume Control

If you're anything like me then you like to have control over your machines on your home network from whatever sofa you happen to be lounging around on in your tattered bathing gown.

With this script you have easy access to mute, unmute, volume up, volume down, volume n over your ssh connection. Or you may find it convenient not to break out of your terminal whilst working. The choice is quite literally ~~limitless~~ limited.

## Installation

I find it's best to keep this somewhere obvious like ~/scripts and then create a symlink to it in /usr/bin or whatever your path is. Alternatively you could make an alias in your .bash_profile and call it from there.

## Usage

$system-volume mute
$system-volume unmute

$system-volume vol up
$system-volume vol down

$system-volume volume up
$system-volume volume down

$system-volume get

$system-volume help
