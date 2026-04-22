#!/usr/bin/env zsh
# Print the LAN IP of the interface carrying the default route.
# Fresh on every call (not cached at shell start), so it stays correct
# across network changes.
function myip() {
    local iface ip
    case "$OSTYPE" in
        darwin*)
            iface=$(route -n get default 2>/dev/null | awk '/interface:/{print $2}')
            [[ -n "$iface" ]] && ip=$(ipconfig getifaddr "$iface" 2>/dev/null)
            ;;
        linux*)
            ip=$(ip -4 route get 1 2>/dev/null | awk '/src/ {for (i=1;i<=NF;i++) if ($i=="src") {print $(i+1); exit}}')
            ;;
    esac
    echo "${ip:-<offline>}"
}
