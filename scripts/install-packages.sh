#!/usr/bin/env bash
# Install the system packages gud-zsh expects: the shell itself plus the
# binaries that OMZ plugins (fzf, gh, zoxide, gpg-agent) invoke.
#
# macOS:         Homebrew must already be installed.
# Debian/Ubuntu: uses apt. Requires sudo.
#
# Safe to re-run: brew/apt both skip packages that are already present.

set -euo pipefail

PACKAGES_MACOS=(
    zsh
    git
    make
    curl
    fzf
    gh
    zoxide
    gnupg        # gpg-agent plugin
)

PACKAGES_DEBIAN=(
    zsh
    git
    make
    curl
    fzf
    gh
    zoxide
    gnupg        # gpg-agent plugin
)

die() { printf 'install-packages: %s\n' "$*" >&2; exit 1; }

case "$(uname -s)" in
    Darwin)
        command -v brew >/dev/null 2>&1 || die "brew not found. Install Homebrew first: https://brew.sh"
        echo "==> brew install ${PACKAGES_MACOS[*]}"
        brew install "${PACKAGES_MACOS[@]}"
        ;;
    Linux)
        if ! command -v apt-get >/dev/null 2>&1; then
            die "only apt-based distros are handled. Your PM is not apt."
        fi
        echo "==> apt-get install ${PACKAGES_DEBIAN[*]}"
        sudo apt-get update
        sudo apt-get install -y "${PACKAGES_DEBIAN[@]}"
        ;;
    *)
        die "unsupported OS: $(uname -s)"
        ;;
esac

echo
echo "Done. If zsh is not yet your login shell:"
echo "  sudo chsh -s \"\$(command -v zsh)\" \"\$USER\""
