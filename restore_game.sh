#!/usr/bin/env bash
# restore_game.sh — reset the Proton container for a game (backup + remove)
# Usage:
#   export STEAM_APPID=<YOUR_APPID>
#   bash restore_game.sh

set -e

: "${STEAM_APPID:?Set STEAM_APPID}"
STEAM_DIR="${STEAM_DIR:-$HOME/.steam/steam}"

mv "$STEAM_DIR/steamapps/compatdata/$STEAM_APPID" \
   "$STEAM_DIR/steamapps/compatdata/${STEAM_APPID}.bak-$(date +%s)" 2>/dev/null || true
rm -rf "$STEAM_DIR/steamapps/shadercache/$STEAM_APPID" 2>/dev/null || true

echo "Prefix reset. Launch the game once from Steam, then run: bash setup_game.sh"

