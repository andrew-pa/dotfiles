#!/bin/bash
set -v

# Variables
TARGET_DIR="$HOME"
ARCHIVE_NAME="${HOSTNAME}_backup_$(date +%Y_%m_%d__%H_%M_%S).tar.gz"

# Excluded directories
EXCLUDE_DIRS=(
    "$TARGET_DIR/.cache"
    "$TARGET_DIR/.local"
    "$TARGET_DIR/.var"
    "$TARGET_DIR/.opam"
    "$TARGET_DIR/.cargo"
    "$TARGET_DIR/.rustup"
    "$TARGET_DIR/.gradle"
    "$TARGET_DIR/.ghcup"
    "$TARGET_DIR/.wine"
    "$TARGET_DIR/.jdks"
    "$TARGET_DIR/.nvm"
    "$TARGET_DIR/.npm"
    "$TARGET_DIR/.conda"
    "$TARGET_DIR/.minikube"
    "$TARGET_DIR/.mozilla"
    "$TARGET_DIR/.m2"
    "$TARGET_DIR/.ollama"
    "$TARGET_DIR/.config/google-chrome"
    "$TARGET_DIR/.BitwigStudio"
    "$TARGET_DIR/go"
    "$TARGET_DIR/Android"
    "$TARGET_DIR/.android"
    "$TARGET_DIR/Downloads"
    "$TARGET_DIR/sd"
    "$TARGET_DIR/Music/bandcamp*"
    "$TARGET_DIR/VirtualBox\ VMs"
    "*/build"
    "*/.build"
    "*/target"
    "*/node_modules"
    "*/*.pth"
    "*/*.safetensors"
    "*/*.gguf"
)

# Function to generate prune conditions for find command
generate_prune_conditions() {
    for dir in "${EXCLUDE_DIRS[@]}"; do
        echo "-path $dir -prune -o"
    done
}

# Process .gitignore files
process_gitignore() {
    find "$TARGET_DIR" $(generate_prune_conditions) -type f -name '.gitignore' -print0 | while IFS= read -r -d '' file; do
        dir_path=$(dirname "$file")
        grep -v '^#' "$file" | while IFS= read -r pattern; do
            [[ -z $pattern || $pattern == '!'* ]] && continue
            # Escape glob characters to prevent shell expansion
            escaped_pattern=$(printf '"%s"' "$dir_path/$pattern")
            echo "--exclude=$escaped_pattern"
        done
    done
}

# Create and compress tar archive
tar -cvf - "${EXCLUDE_DIRS[@]/#/--exclude=}" "$TARGET_DIR" | pigz -v -b 4096 > /mnt/jeff/backup/octopus/${ARCHIVE_NAME}

echo "Backup completed"

