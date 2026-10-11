#!/bin/bash

# 1. Get the current date to timestamp the file
DATE=$(date +%Y-%m-%d_%H-%M)

# 2. Find the highest numbered snapshot folder in Snapper
LATEST_SNAP=$(sudo ls -vd /.snapshots/[0-9]* | tail -n1)/snapshot

# 3. Stream and compress it to the QNAP with a unique timestamped name
echo "Starting system image backup of $LATEST_SNAP to QNAP..."
sudo btrfs send "$LATEST_SNAP" | gzip > /mnt/system_backup/cachyos_system_root_${DATE}.img.gz
echo "System image backup completed successfully!"

# 4. Clean up old backups, keeping only the 3 newest ones
echo "Checking for old backups to rotate..."
ls -t /mnt/system_backup/cachyos_system_root_*.img.gz | tail -n +4 | xargs -r rm
echo "Backup rotation complete. Only the 3 most recent backups have been kept."
