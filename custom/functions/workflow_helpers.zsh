# OMZ's tmux plugin defines `tl` as an alias (`tmux list-sessions`), which
# blocks a function of the same name from being defined. Drop it so our
# richer `tl` can be installed.
unalias tl 2>/dev/null

# Prompts the user to confirm creating a new tmux session.
# Returns 0 if confirmed, 1 if declined.
_tmux_confirm_create() {
  read -q "?${1} [y/N] " || { echo; return 1; }
  echo
}

# Attach to a tmux session. With no argument, attaches to the last used session.
# If no sessions exist, prompts to create one.
# Usage: ta [session-name]
ta() {
  local session="$1"
  if [[ -n "$session" ]]; then
    tmux has-session -t "$session" 2>/dev/null \
      || _tmux_confirm_create "No session '$session' found. Create it?" \
      || return 1
    tmux new-session -A -s "$session"
  else
    tmux attach-session 2>/dev/null || {
      echo "No sessions. The void stares back."
      _tmux_confirm_create "Create one?" || return 1
      tmux new-session
    }
  fi
}

# List all tmux sessions with the active command in each.
# Mirrors `ta` when no session exists: prompts to create one.
tl() {
  if ! tmux has-session 2>/dev/null; then
    echo "No sessions. The void stares back."
    _tmux_confirm_create "Create one?" || return 1
    tmux new-session
    return
  fi
  tmux list-windows -a -F "#{session_name} (#{session_windows}w) [#{window_name}]: #{pane_current_command}" | sort -u
}
