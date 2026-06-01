#!/usr/bin/env bash
# Toggle screen mirroring: laptop panel (eDP-1) -> external display (projector/TV).
# Bound to $mod+Shift+c in ~/.config/sway/config.
#
# Notes:
#  - Use the USB-C / Thunderbolt port (Intel GPU, shows up as DP-1/DP-2), NOT the
#    built-in HDMI port (wired to the NVIDIA dGPU, whose display engine is broken).
#  - wl-mirror scales eDP-1 to fit the external output, preserving aspect ratio.
#    We force a 16:10 mode (1920x1200) when available so it matches the 16:10
#    laptop panel with no letterbox.
# Full write-up:
#   ~/code/phd/phd_note_vault/docs/tools/hardware/kenzae/Screen-sharing for presentations on Kenzae.md
set -u

LAPTOP="eDP-1"

# Already mirroring? -> stop and exit.
if pkill -x wl-mirror 2>/dev/null; then
    command -v notify-send >/dev/null && notify-send -t 2000 "Screen mirror" "Stopped"
    exit 0
fi

# Find the first ACTIVE external output (anything that is not the laptop panel).
EXT=$(swaymsg -t get_outputs | python3 -c "
import json, sys
ext = [o['name'] for o in json.load(sys.stdin) if o.get('active') and o['name'] != '$LAPTOP']
print(ext[0] if ext else '')
")

if [ -z "$EXT" ]; then
    command -v notify-send >/dev/null && \
        notify-send -u critical -t 3000 "Screen mirror" "No external display connected (use the USB-C port)"
    exit 1
fi

# Prefer a 16:10 mode to match the laptop's aspect ratio (full frame, no black bars).
if swaymsg -t get_outputs | python3 -c "
import json, sys
sys.exit(0 if any(o['name']=='$EXT' and any(m['width']==1920 and m['height']==1200 for m in o.get('modes',[])) for o in json.load(sys.stdin)) else 1)
"; then
    swaymsg output "$EXT" mode 1920x1200 >/dev/null
fi

command -v notify-send >/dev/null && notify-send -t 2000 "Screen mirror" "Mirroring $LAPTOP → $EXT"

# Prefer an installed wl-mirror; fall back to the cached nix package if not on PATH.
if command -v wl-mirror >/dev/null; then
    exec wl-mirror --fullscreen-output "$EXT" "$LAPTOP"
else
    exec nix run nixpkgs#wl-mirror -- --fullscreen-output "$EXT" "$LAPTOP"
fi
