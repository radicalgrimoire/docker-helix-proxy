#!/usr/bin/env bash

set -euo pipefail

# Set this to the depot file or directory revision to preload.
DEPOT_PATH="//depot/path/to/preload/..."

# Override these when the proxy is not exposed at localhost:1777.
P4PORT="${P4PORT:-ssl:localhost:1777}"
P4USER="${P4USER:-}"

if [[ "$DEPOT_PATH" == "//depot/path/to/preload/..." ]]; then
    echo "Set DEPOT_PATH in this script before running it." >&2
    exit 1
fi

if ! command -v p4 >/dev/null 2>&1; then
    echo "The p4 CLI must be installed on the host." >&2
    exit 1
fi

command=(p4 -p "$P4PORT")
if [[ -n "$P4USER" ]]; then
    command+=(-u "$P4USER")
fi

"${command[@]}" sync -Z proxyload "$DEPOT_PATH"