#!/usr/bin/env zsh
# Back up $HISTFILE, but only if the newest existing backup is older than
# ZSH_HISTORY_BACKUP_MIN_HOURS (default 6). No deletions.
#
# Env:
#   ZSH_HISTORY_BACKUP_DIR       where backups live (default: ~/.zsh/zsh_history_backups)
#   ZSH_HISTORY_BACKUP_MIN_HOURS minimum gap between backups (default: 6)
function zsh_history_backup() {
    local backup_dir="${ZSH_HISTORY_BACKUP_DIR:-$HOME/.zsh/zsh_history_backups}"
    local min_hours=${ZSH_HISTORY_BACKUP_MIN_HOURS:-6}
    local min_secs=$(( min_hours * 3600 ))

    [[ -r "$HISTFILE" ]] || return 0
    mkdir -p "$backup_dir"

    # Newest existing backup (by mtime, survives clock skew).
    local newest
    newest=$(command ls -t "$backup_dir"/zsh_history_backup_* 2>/dev/null | head -1)

    if [[ -n "$newest" && -f "$newest" ]]; then
        local now last
        now=$(date +%s)
        # stat is BSD on macOS (-f %m), GNU on Linux (-c %Y).
        last=$(stat -f %m "$newest" 2>/dev/null || stat -c %Y "$newest" 2>/dev/null)
        if [[ -n "$last" ]] && (( now - last < min_secs )); then
            return 0
        fi
    fi

    local ts
    ts=$(date +%Y-%m-%d-%H%M)
    cp -p "$HISTFILE" "$backup_dir/zsh_history_backup_${ts}"
}
