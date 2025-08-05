#!/bin/bash

# Set browser process name (can be chrome, chromium, brave, etc.)
BROWSER_PROCESS="chrome"

# Get user profile dir for extensions
EXT_DIR="$HOME/.config/google-chrome/Default/Extensions"

# Print header
echo "🧠 Chrome Extensions by Memory Usage (Descending)"
echo "------------------------------------------------"

# Get Chrome extension processes and sort by memory
ps -eo pid,pmem,pcpu,comm,args --sort=-pmem | grep "$BROWSER_PROCESS" | grep -- '--extension-process' | while read -r pid mem cpu cmd args; do
    # Extract extension ID (assumes it's in the args)
    EXT_ID=$(echo "$args" | grep -oP '[a-p]{32}')

    if [ -n "$EXT_ID" ]; then
        # Try to get extension name from manifest.json
        MANIFEST_PATH="$EXT_DIR/$EXT_ID/manifest.json"
        if [ -f "$MANIFEST_PATH" ]; then
            NAME=$(jq -r '.name' "$MANIFEST_PATH")
        else
            NAME="Unknown ($EXT_ID)"
        fi
    else
        NAME="Unknown"
    fi

    echo "PID: $pid | Mem: $mem% | CPU: $cpu% | Extension: $NAME"
done
echo "------------------------------------------------"
echo "Total extensions found: $(ps -eo pid,comm | grep "$BROWSER_PROCESS" | grep -- '--extension-process' | wc -l)"
echo "Note: Memory usage is approximate and may vary."
echo "------------------------------------------------"
echo "Run this script with appropriate permissions to view all extensions."
echo "------------------------------------------------"