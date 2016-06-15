#!/bin/bash
#
####################################
# Apple System Volume
# based on:
# iTunes Command Line Control v1.0
# written by David Schlosnagle
# created 2001.11.08
# edit    2010.06.01 rahul kumar
# edit    2016.06.01 pete haughie
####################################

showHelp () {
    echo "-----------------------------";
    echo "     Apple System Volume     ";
    echo "-----------------------------";
    echo "Usage: `basename $0` <option>";
    echo;
    echo "Options:";
    echo " mute     = Mute System volume.";
    echo " unmute   = Unmute System volume.";
    echo " vol up   = Increase System volume by equivalent 1 button press";
    echo " vol down = Increase System volume by equivalent 1 button press";
    echo " vol #    = Set System volume to # [0-10]";
    echo " get      = Echo the System volume";
}

if [ $# = 0 ]; then
  showHelp;
fi

while [ $# -gt 0 ]; do
  arg=$1;
  case $arg in

    "mute"    ) echo "Muting System volume level.";
      osascript -e 'tell application "System Events" to set volume with output muted'
      break ;;

    "unmute" ) echo "Unmuting System volume level.";
      osascript -e 'tell application "System Events" to set volume without output muted'
      break ;;

    "vol"    )
      vol=`osascript -e "output volume of (get volume settings)"`;
      if [ $2 = "up" ]; then
        newvol=$(echo $vol 6.25 | awk '{print $1 + $2}');
      elif [ $2 = "down" ]; then
        newvol=$(echo $vol 6.25 | awk '{print $1 - $2}');
      fi
      echo "Changing System volume level from $vol to $newvol.";
      osascript -e "set volume output volume ($newvol)";
      break ;;

    "get"	) echo "Getting the System volume level.";
            osascript -e "output volume of (get volume settings) as integer"
            break ;;

    "help" | * ) echo "help:";
      showHelp;

  esac
done
