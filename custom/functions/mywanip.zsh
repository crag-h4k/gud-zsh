#!/usr/bin/env zsh
# Print the public IPv4 (as seen by an external endpoint), cached to avoid
# hammering a remote service on every new shell.
#
# Env:
#   MYWANIP_TTL  cache lifetime in seconds (default: 300 = 5 min)
function mywanip() {
    local cache="${TMPDIR:-/tmp}/.wan-ip-$UID"
    local ttl=${MYWANIP_TTL:-300}

    if [[ -f "$cache" ]]; then
        local now mtime
        now=$(date +%s)
        mtime=$(stat -f %m "$cache" 2>/dev/null || stat -c %Y "$cache" 2>/dev/null)
        if [[ -n "$mtime" ]] && (( now - mtime < ttl )); then
            cat "$cache"
            return 0
        fi
    fi

    local ip endpoints=(
        https://icanhazip.com
        https://checkip.amazonaws.com
    )
    for url in $endpoints; do
        ip=$(curl -s -4 --max-time 2 "$url" 2>/dev/null | tr -d '[:space:]')
        [[ -n "$ip" ]] && break
    done

    if [[ -n "$ip" ]]; then
        print -r -- "$ip" > "$cache"
        print -r -- "$ip"
    else
        echo "<offline>"
    fi
}
