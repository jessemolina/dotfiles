#!/bin/bash

# Script is used as a "wrapper" to launch dmenu using the system colors set by pywal

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

dmenu_run -nb "$color0" -nf "$color7" -sb "$color0" -sf "$color1" -fn "Hack-8"
