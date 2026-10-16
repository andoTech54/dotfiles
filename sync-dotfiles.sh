#!/usr/bin/env bash

# Define directories
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# List of folders to sync from ~/.config to ~/dotfiles/config
FOLDERS=("hypr" "rofi" "wallust" "waybar" "waypaper" "wlogout")

notify-send "Dotfiles Sync" "Starting synchronization..." -i system-run -u low

# Copy updated folders
for folder in "${FOLDERS[@]}"; do
    if [ -d "$CONFIG_DIR/$folder" ]; then
        rsync -av --delete "$CONFIG_DIR/$folder/" "$DOTFILES_DIR/config/$folder/"
    fi
done

# Navigate to dotfiles repo
cd "$DOTFILES_DIR" || exit

# Check for git changes
if [ -z "$(git status --porcelain)" ]; then
    notify-send "Dotfiles Sync" "No changes detected. Repository is up to date." -i dialog-information
    exit 0
fi

# Stage, commit, and push
git add .

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Auto-sync dotfiles: $TIMESTAMP"

git commit -m "$COMMIT_MSG"

if git push; then
    notify-send "Dotfiles Sync" "Successfully pushed updates to GitHub!" -i vcs-normal
else
    notify-send "Dotfiles Sync" "Failed to push updates to GitHub." -i dialog-error -u critical
fi
