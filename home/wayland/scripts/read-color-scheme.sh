#!/bin/sh

current_scheme=$(dconf read /org/gnome/desktop/interface/color-scheme)

echo "{\"alt\":\"$current_scheme\"}"
