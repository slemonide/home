#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Mouse cursor
xsetroot -cursor_name left_ptr

# Keyboard layout
#setxkbmap -layout ru,us -option grp:caps_toggle

# Load the composite manager
xcompmgr -c &

# Set up the wallpaper
sh ~/.fehbg &

# Set up the notify daemon
dunst -geometry x2+0-1 -format "~~~~~~%s~~~~~~\n%b\n%p" &

# Display the welcome message
notify-send -h string:bgcolor:#080808 -h string:fgcolor:#ffffff 'Welcome!' "The date is `date`"

# Start firefox & thunderbird
firefox &
thunderbird &

# Window manager
exec xmonad
