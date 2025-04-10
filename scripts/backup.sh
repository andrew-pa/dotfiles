#!/bin/bash
# Backup Script
# -------------
# This script creates a compressed backup of selected directories from your home folder,
# excluding files that match a set of blanket patterns and any files larger than 8GiB.
# It streams the compressed archive directly to OneDrive using rclone (via rcat),
# so that the archive is never fully stored on local disk.
#
# Included directories:
#   - ~/.ssh
#   - ~/Bitwig Studio
#   - ~/.config
#   - ~/config
#   - ~/Documents
#   - ~/Music/demos
#   - ~/Pictures
#   - ~/source (with ~/source/external-tools excluded)
#   - ~/Videos
#
# Blanket exclude patterns (directories and globs) are defined below.
#
# The script logs its progress and errors to a log file. It uses robust error handling,
# so that any failure in the pipeline will cause an exit with an error message.

set -euo pipefail

# Logging function: prints timestamped messages to both stdout and the log file.
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"
}

# Error handler: log error and exit.
trap 'log "An error occurred. Exiting."; exit 1' ERR


# Global variables
ARCHIVE_NAME="${HOSTNAME}_backup_$(date +%Y_%m_%d__%H_%M_%S).tar.gz"
REMOTE_DEST="onedrive:Backup/Desktop/${ARCHIVE_NAME}"
STAGING="/mnt/d/$ARCHIVE_NAME"

log "Backup script started, destination ${REMOTE_DEST}"

# Blanket exclude patterns (absolute paths and globs)
EXCLUDE_PATTERNS=(
    "*/build"
    "*/.build"
    "*/.cache"
    "*/venv"
    "*/.venv"
    "*/__pycache__"
    "*/.zig-cache"
    "*/.next"
    "*/target"
    "*/node_modules"
    "*/*.pth"
    "*/*.safetensors"
    "*/*.gguf"
    "$HOME/.config/chromium"
)

# Directories to include in the backup
INCLUDE_DIRS=(
    "$HOME/.ssh"
    "$HOME/Bitwig Studio"
    "$HOME/.config"
    "$HOME/config"
    "$HOME/Documents"
    "$HOME/Music/demos"
    "$HOME/Pictures"
    "$HOME/source"
    "$HOME/Videos"
)

# Subdirectory to exclude within ~/source
EXCLUDE_SOURCE_SUBDIR="$HOME/source/external-tools"

# Array to hold files larger than 8GiB
LARGE_FILE_EXCLUDES=()

######################################
# Scan for files larger than 8GiB  #
######################################
log "Scanning for files larger than 8GiB to exclude:"
for dir in "${INCLUDE_DIRS[@]}"; do
    if [[ -d "$dir" ]]; then
        if [[ "$dir" == "$HOME/source" ]]; then
            # For ~/source, exclude the external-tools directory from the find.
            while IFS= read -r file; do
                log "Excluding large file: $file"
                LARGE_FILE_EXCLUDES+=("$file")
            done < <(find "$dir" -path "$EXCLUDE_SOURCE_SUBDIR" -prune -o -type f -size +8G -print)
        else
            while IFS= read -r file; do
                log "Excluding large file: $file"
                LARGE_FILE_EXCLUDES+=("$file")
            done < <(find "$dir" -type f -size +8G -print)
        fi
    else
        log "Warning: Directory $dir does not exist, skipping."
    fi
done

######################################
# Build tar options                  #
######################################
# Build an array of tar --exclude options from the blanket exclude patterns.
TAR_EXCLUDES=()
for pattern in "${EXCLUDE_PATTERNS[@]}"; do
    TAR_EXCLUDES+=(--exclude="$pattern")
done

# Add large files (over 8GiB) to the tar exclude list.
for file in "${LARGE_FILE_EXCLUDES[@]}"; do
    TAR_EXCLUDES+=(--exclude="$file")
done

# Exclude the external-tools subdirectory from ~/source.
TAR_EXCLUDES+=(--exclude="$EXCLUDE_SOURCE_SUBDIR")

# Build an array of directories that exist and should be included.
TAR_INCLUDES=()
for dir in "${INCLUDE_DIRS[@]}"; do
    if [[ -d "$dir" ]]; then
        TAR_INCLUDES+=("$dir")
    else
        log "Warning: Directory $dir does not exist and will be skipped."
    fi
done

log "TAR_EXCLUDES=${TAR_EXCLUDES[@]}"
log "TAR_INCLUDES=${TAR_INCLUDES[@]}"

######################################
# Create, compress, and stream backup
######################################
log "Creating backup archive at $STAGING"
if tar -cvf - "${TAR_EXCLUDES[@]}" "${TAR_INCLUDES[@]}" |  pigz -p "$(nproc)" --best -b 4096 > "$STAGING"; then
    log "Backup compress completed successfully."
else
    log "Backup compress failed."
    exit 1
fi

log "Uploading backup archive $(du -sh $STAGING)"
rclone moveto -v -v "$STAGING" "$REMOTE_DEST"

log "Backup script finished."

