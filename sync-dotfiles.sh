#!/usr/bin/env bash

# Define directories
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# List of folders to sync from ~/.config to ~/dotfiles/config
FOLDERS=("hypr" "rofi" "wallust" "waybar" "waypaper" "wlogout")

echo "=== Starting Dotfiles Sync ==="

# Copy updated folders
for folder in "${FOLDERS[@]}"; do
    if [ -d "$CONFIG_DIR/$folder" ]; then
        echo "--> Syncing $folder..."
        rsync -av --delete "$CONFIG_DIR/$folder/" "$DOTFILES_DIR/config/$folder/"
    else
        echo "--> Warning: $CONFIG_DIR/$folder does not exist. Skipping."
    fi
done

# Navigate to dotfiles repo
cd "$DOTFILES_DIR" || exit

# Check for git changes
if [ -z "$(git status --porcelain)" ]; then
    echo "=== No changes detected in working tree. Everything is up to date! ==="
    exit 0
fi

# Stage, commit, and push
echo "--> Changes detected. Staging files..."
git add .

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Auto-sync dotfiles: $TIMESTAMP"

echo "--> Committing: '$COMMIT_MSG'..."
git commit -m "$COMMIT_MSG"

echo "--> Pushing to GitHub..."
git push

echo "=== Dotfiles sync completed successfully! ==="
