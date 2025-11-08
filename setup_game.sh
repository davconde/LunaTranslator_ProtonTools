#!/usr/bin/env bash
# setup_game.sh — prepare one game prefix: fonts, VC++ 2022, WebView2, then launch Luna
# Usage:
#   export STEAM_APPID=<YOUR_APPID>
#   bash setup_game.sh

set -e

: "${STEAM_APPID:?Set STEAM_APPID (Steam AppID)}"
: "${WEBVIEW2_INSTALLER:?Define WEBVIEW2_INSTALLER (file path) — run install.sh first}"
: "${LUNATRANSLATOR:?Define LUNATRANSLATOR (path) — run install.sh first}"

protontricks "$STEAM_APPID" -q cjkfonts corefonts vcrun2022 || true
protontricks-launch --appid "$STEAM_APPID" "$WEBVIEW2_INSTALLER" /silent /install
protontricks-launch --appid "$STEAM_APPID" "$LUNATRANSLATOR"

