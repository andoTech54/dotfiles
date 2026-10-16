#!/usr/bin/env bash

# Define local repository directory
HYPR_REPO_DIR="$HOME/.config/hypr"

echo "=== Starting Hyprland Config Sync ==="

# Navigate to the repo directory
cd "$HYPR_REPO_DIR" || exit

# Check for git changes
if [ -z "$(git status --porcelain)" ]; then
    echo "=== No changes detected in Hyprland config. Everything is clean! ==="
    exit 0
fi

# Stage, commit, and push
echo "--> Changes detected. Staging files..."
git add .

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Update Hyprland config: $TIMESTAMP"

echo "--> Committing: '$COMMIT_MSG'..."
git commit -m "$COMMIT_MSG"

echo "--> Pushing to GitHub..."
git push

echo "=== Hyprland config synced successfully! ==="
