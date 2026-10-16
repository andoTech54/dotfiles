#!/usr/bin/env bash

# Define local repository directory
HYPR_REPO_DIR="$HOME/.config/hypr"

notify-send "Hyprland Sync" "Checking Hyprland configuration for updates..." -i system-run -u low

# Navigate to the repo directory
cd "$HYPR_REPO_DIR" || exit

# Check for git changes
if [ -z "$(git status --porcelain)" ]; then
    notify-send "Hyprland Sync" "No changes detected in Hyprland config." -i dialog-information
    exit 0
fi

# Stage, commit, and push
git add .

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Update Hyprland config: $TIMESTAMP"

git commit -m "$COMMIT_MSG"

if git push; then
    notify-send "Hyprland Sync" "Successfully pushed Hyprland updates to GitHub!" -i vcs-normal
else
    notify-send "Hyprland Sync" "Failed to push Hyprland updates to GitHub." -i dialog-error -u critical
fi
