#!/bin/sh

current_scheme=$(dconf read /org/gnome/desktop/interface/color-scheme)

if [ "$current_scheme" == "'prefer-dark'" ]; then
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
else
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
fi
