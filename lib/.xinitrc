#!/bin/sh
# DOT SKIP server

xrdb ~/.Xresources

# Set specific screen.
# To detect settings for given resolution, run: `cvt 2560 1440`
xrandr --newmode "2560x1440_60"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
xrandr --addmode HDMI-1 "2560x1440_60"
xrandr -s 2560x1440_60
xrandr --dpi 120

# DOT SKIP kinesis
keyboard_swapkeys
# DOT END

# Turn off beep.
xset b off

# Turn off any power management.
xset s off -dpms

# Wallpaper
nitrogen --restore &

# Screenshots
flameshot &

# Notifications
dunst &

# Hotkeys
sxhkd & &> /tmp/x.$USER.log

# Adjust colors
# redshift &

# Transparency (eg for terminal)
xcompmgr &

# Mute microphone
pamixer --source $(pamixer_mic_source) -m

# Status bar for DWM
kmstatus -x & &> /tmp/x.$USER.log

# Boot DWM.
# If DWM exits 0, restart.
# To actually close, run `pkill dwm`.
while type dwm >/dev/null
do
	dwm &> /tmp/x.$USER.log && continue || break
done
