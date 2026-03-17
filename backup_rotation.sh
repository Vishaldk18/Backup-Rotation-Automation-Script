#!/bin/bash

set -euo pipefail

# ==============================
# Usage
# ==============================
display_usage() {
  echo "Usage: ./backup_rotation.sh <source_dir> <backup_dir>"
  exit 1
}

# ==============================
# Input Validation
# ==============================
if [ $# -ne 2 ]; then
  display_usage
fi

source_dir="$1"
backup_dir="$2"
timestamp=$(date +%Y-%m-%d-%H-%M-%S)

# ==============================
# Directory Checks
# ==============================
check_directories() {
  if [ ! -d "$source_dir" ]; then
    echo "❌ Source directory does not exist: $source_dir"
    exit 1
  fi

  if [ ! -d "$backup_dir" ]; then
    echo "📁 Backup directory not found. Creating..."
    mkdir -p "$backup_dir"
  fi
}

# ==============================
# Backup Function
# ==============================
backup() {
  echo "📦 Creating backup..."

  zip -r "${backup_dir}/backup_${timestamp}.zip" "$source_dir" > /dev/null

  echo "✅ Backup created: backup_${timestamp}.zip"
}

# ==============================
# Rotation (Keep Last 5 Backups)
# ==============================
perform_rotation() {
  echo "🔄 Checking for old backups..."

  mapfile -t backup_list < <(ls -t ${backup_dir}/backup_*.zip 2>/dev/null || true)

  if [ "${#backup_list[@]}" -gt 5 ]; then
    echo "🗑️ Removing old backups..."

    backups_to_remove=("${backup_list[@]:5}")

    for file in "${backups_to_remove[@]}"; do
      rm -f "$file"
      echo "Deleted: $file"
    done
  else
    echo "No rotation needed."
  fi
}

# ==============================
# Main
# ==============================
main() {
  echo "========== Backup Process Started =========="
  check_directories
  backup
  perform_rotation
  echo "========== Backup Process Completed =========="
}

main
