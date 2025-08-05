# Chrome Extensions Checker

A simple Bash script to list Google Chrome (or Chromium-based) browser extensions by their memory usage.

## Features
- Lists all running Chrome extension processes, sorted by memory usage (descending).
- Displays PID, memory %, CPU %, and extension name (if available).
- Attempts to resolve extension names from their `manifest.json` files.
- Shows total number of extension processes found.

## Requirements
- Linux
- Bash
- `jq` (for parsing JSON)
- Google Chrome or Chromium (or compatible browser)

## Usage
1. Make the script executable:
   ```bash
   chmod +x chrome-ext-inspector.sh
   ```
2. Run the script:
   ```bash
   ./chrome-ext-inspector.sh
   ```
   You may need to run with appropriate permissions to see all processes:
   ```bash
   sudo ./chrome-ext-inspector.sh
   ```

## Notes
- The script assumes the default Chrome user profile directory: `~/.config/google-chrome/Default/Extensions`. Adjust the `EXT_DIR` variable if you use a different browser or profile.
- Memory usage is approximate and may vary.
- Only works while Chrome/Chromium is running and extensions are active.

## Customization
- To use with Chromium or Brave, change the `BROWSER_PROCESS` and `EXT_DIR` variables at the top of the script.

## License
MIT
