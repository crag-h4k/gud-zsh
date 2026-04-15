#!/usr/bin/env zsh
# Backup zsh history file everytime a new shell is opened.
# Optional cleanup - remove old backups after a certain number of days (if ZSH_HISTORY_BACKUP_MAX_DAYS is set)
function zsh_history_backup() {
    local backup_dir=${1:-"$ZSH_HISTORY_BACKUP_DIR"}
    # Check if $ZHIST_BACK is set, otherwise use a default path.
    if [ -z "$ZSH_HISTORY_BACKUP_DIR" ]; then
        backup_dir="$HOME/.zsh/zsh_history_backups"
        echo "\$ZSH_HISTORY_BACKUP_DIR not set."
        echo "\$ZSH_HISTORY_BACKUP_DIR set to $backup_dir"

    fi
    # Validate and set the output directory.
    #if [ ! -d "$backup_dir" ]; then
    if [ ! -e "$backup_dir" ]; then
        echo "zsh backup directory doesn't exist, creating $backup_dir"
        mkdir -p $backup_dir
    fi

    local timestamp=$(date +%Y-%m-%d-%H%M)
    local hist_file="$HISTFILE"
    local hist_backup_file="$backup_dir/zsh_history_backup_$timestamp"

    # Perform the actual backup. Handle errors to prevent partial failure.
    cp $hist_file $hist_backup_file
    local cp_result=$?
    if [ $cp_result -eq 0 ]; then
        echo "Backup created: $hist_backup_file"
    else
        echo "Error creating backup: $cp_result"
    fi
    # Remove old backups
    if [ -n "$ZSH_HISTORY_BACKUP_MAX_DAYS" ] && [[ $ZSH_HISTORY_BACKUP_MAX_DAYS =~ ^[0-9]+$ ]]; then
        local max_backups=$(( ${ZSH_HISTORY_BACKUP_MAX_DAYS} * 86400 ))
        for file in "$backup_dir/zsh_history-*"; do
            if [ -f "$file" ]; then
                local file_date=$(date +"%s")
                if [ $(($file_date)) -lt $max_backups ]; then
                    rm "$file"
                    echo "Removed old backup: $file"
                fi
            fi
        done
    fi
}
