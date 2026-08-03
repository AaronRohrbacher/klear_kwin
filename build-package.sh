#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
OUTPUT="$ROOT/klear.kwinscript"

PACKAGE_FILES=(
    metadata.json
    LICENSE
    icon.png
    contents
    build-applist.sh
    klear-applist.service
    klear-applist.path
    autostart
)

for path in "${PACKAGE_FILES[@]}"; do
    if [ ! -e "$ROOT/$path" ]; then
        printf 'Missing package input: %s\n' "$path" >&2
        exit 1
    fi
done

TEMP_OUTPUT="$OUTPUT.tmp"
rm -f "$TEMP_OUTPUT"
trap 'rm -f "$TEMP_OUTPUT"' EXIT
(
    cd "$ROOT"
    bsdtar --format zip -cf "$TEMP_OUTPUT" "${PACKAGE_FILES[@]}"
)
mv "$TEMP_OUTPUT" "$OUTPUT"
trap - EXIT

printf 'Built %s\n' "$OUTPUT"
