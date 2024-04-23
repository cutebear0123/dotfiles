#!/bin/bash
swayidle -w \
	timeout 60 "killall swaylock;hyprctl dispatch dpms off"\
        resume "hyprctl dispatch dpms on;swaylock -i hyprland.png --clock --indicator --indicator-radius 100"
