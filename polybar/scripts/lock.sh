#!/usr/bin/env bash

# Use the locker matching the graphical session.
if [ -n "${SWAYSOCK:-}" ]; then
    exec swaylock -f
fi
exec "$HOME/.config/i3lock-color/i3lock-color.sh" --nofork
