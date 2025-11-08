#!/usr/bin/env bash
# launch_game.sh — launch Luna inside the game’s Proton prefix
# Usage:
#   export STEAM_APPID=<YOUR_APPID>
#   bash launch_game.sh

set -e

: "${STEAM_APPID:?Set STEAM_APPID}"
: "${LUNATRANSLATOR:?Define LUNATRANSLATOR — run install.sh first}"

protontricks-launch --appid "$STEAM_APPID" "$LUNATRANSLATOR"

