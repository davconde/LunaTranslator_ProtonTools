#!/usr/bin/env bash
# install.sh — run once to install tools and save env vars
# Usage:
#   export WEBVIEW2_INSTALLER="/ABS/PATH/MicrosoftEdgeWebView2RuntimeInstallerX64.exe"
#   export LUNATRANSLATOR="/ABS/PATH/LunaTranslator.exe"
#   bash install.sh
#
# Get the Evergreen Standalone (offline) WebView2 installer here:
# https://developer.microsoft.com/en-us/microsoft-edge/webview2?cs=1424474517&form=MA13LH#download

set -e

: "${WEBVIEW2_INSTALLER:?Set WEBVIEW2_INSTALLER to the WebView2 installer file path}"
: "${LUNATRANSLATOR:?Set LUNATRANSLATOR to your LunaTranslator.exe path}"

sudo apt update
sudo apt install -y winetricks
sudo apt install -y pipx || sudo apt install -y python3-pipx
pipx ensurepath
pipx install protontricks

{
  echo
  echo "# Proton Luna"
  echo 'export STEAM_DIR="$HOME/.steam/steam"'
  echo 'export PROTON_VERSION="Proton Experimental"'        # display name (no hyphen)
  echo 'export PROTON_DIR_NAME="Proton - Experimental"'     # folder name (with hyphen)
  printf 'export WEBVIEW2_INSTALLER=%q\n' "$WEBVIEW2_INSTALLER"
  printf 'export LUNATRANSLATOR=%q\n' "$LUNATRANSLATOR"
} >> "$HOME/.bashrc"

echo 'Done. Run: source ~/.bashrc'

