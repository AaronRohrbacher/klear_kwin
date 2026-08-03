#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PACKAGE_ID=klear
INSTALL_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/kwin/scripts"
INSTALLED_PACKAGE="$INSTALL_ROOT/$PACKAGE_ID"

if ! command -v kpackagetool6 >/dev/null 2>&1; then
    printf 'kpackagetool6 is required to install Klear.\n' >&2
    exit 1
fi

mkdir -p "$INSTALL_ROOT"
if [ -d "$INSTALLED_PACKAGE" ]; then
    kpackagetool6 --type KWin/Script --upgrade "$ROOT"
else
    kpackagetool6 --type KWin/Script --install "$ROOT"
fi

# Generate the settings from this user's desktop files after the package has
# been copied. This also installs the lightweight watcher used for later app
# installs/removals.
KLEAR_FORCE=1 "$INSTALLED_PACKAGE/build-applist.sh" "$INSTALLED_PACKAGE"

printf 'Installed Klear with the current application list.\n'
