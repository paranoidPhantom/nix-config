#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title nix-darwin - Rebuild
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.description Rebuilds system
# @raycast.icon https://github.com/user-attachments/assets/0e1a77ac-6739-4153-bd24-abd3a5e143f5

sudo osascript -e 'tell application "System Events" to keystroke space using {command down}'
sudo nix run nix-darwin -- switch --flake ~/nix-config
