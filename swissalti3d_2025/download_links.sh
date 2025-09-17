#!/bin/bash

# download_urls_with_curl.sh - Robust URL downloader using curl
# Handles edge cases: missing trailing newline, empty lines, invalid URLs, network errors

set -euo pipefail  # Fail fast on errors, undefined vars, pipe failures

SCRIPT_NAME="${0##*/}"

show_usage() {
    echo "Usage: $SCRIPT_NAME <url_file> [output_directory]"
    echo "  Downloads each URL in the file using curl."
    echo "  Optional: specify output directory (default: current directory)"
    echo
    echo "Example:"
    echo "  $SCRIPT_NAME urls.txt"
    echo "  $SCRIPT_NAME urls.txt ./downloads"
}

# === Argument parsing ===
if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    show_usage
    exit 0
fi

URL_FILE="$1"
OUTPUT_DIR="${2:-.}"  # Default to current dir if not specified

# === Validation ===
if [ ! -f "$URL_FILE" ]; then
    echo "❌ Error: File '$URL_FILE' not found!" >&2
    exit 1
fi

if [ ! -r "$URL_FILE" ]; then
    echo "❌ Error: File '$URL_FILE' is not readable!" >&2
    exit 1
fi

if [ ! -d "$OUTPUT_DIR" ]; then
    echo "📁 Creating output directory: $OUTPUT_DIR"
    mkdir -p "$OUTPUT_DIR" || {
        echo "❌ Failed to create directory: $OUTPUT_DIR" >&2
        exit 1
    }
fi

if [ ! -w "$OUTPUT_DIR" ]; then
    echo "❌ Error: Output directory '$OUTPUT_DIR' is not writable!" >&2
    exit 1
fi

# === Main processing ===
echo "📥 Reading URLs from: $URL_FILE"
echo "📁 Saving to: $OUTPUT_DIR"
echo "🚀 Starting downloads..."

cd "$OUTPUT_DIR"  # All downloads happen here

line_number=1
success_count=0
failure_count=0

# Robust line reading — handles files without trailing newline!
while IFS= read -r url || [ -n "${url:-}" ]; do

    # Trim leading/trailing whitespace
    url=$(echo "$url" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Skip empty or whitespace-only lines
    if [ -z "$url" ]; then
        echo "⏭️  Line $line_number: Skipping empty line"
        ((line_number++))
        continue
    fi

    # Basic URL validation
    if [[ ! "$url" =~ ^https?:// ]]; then
        echo "⚠️  Line $line_number: Skipping invalid URL: '$url'"
        ((line_number++))
        continue
    fi

    echo "⬇️  Line $line_number: Downloading: $url"

    # Use curl with:
    # -L: follow redirects
    # -O: save as remote filename
    # -J: use remote filename from Content-Disposition (if available)
    # --retry 3: retry on failure
    # --retry-delay 2: wait 2s between retries
    # --connect-timeout 10: fail fast on connection issues
    # --max-time 60: overall timeout per download
    if curl -f -L -O -J \
           --retry 3 \
           --retry-delay 2 \
           --connect-timeout 10 \
           --max-time 60 \
           --user-agent "Mozilla/5.0 (download script)" \
           "$url" 2>/dev/null; then

        downloaded_file=$(curl -sI -L -o /dev/null -w '%{filename_effective}' "$url" 2>/dev/null)
        echo "✅ Line $line_number: Success → ${downloaded_file:-[filename unknown]}"
        ((success_count++))
    else
        echo "❌ Line $line_number: FAILED to download: $url"
        ((failure_count++))
    fi

    echo "---"
    ((line_number++))

done < "$URL_FILE"

# === Summary ===
echo
echo "📊 DOWNLOAD SUMMARY"
echo "   Total URLs processed: $((line_number - 1))"
echo "   Successful: $success_count"
echo "   Failed:     $failure_count"

if [ $failure_count -gt 0 ]; then
    echo "⚠️  Some downloads failed. Check output above for details."
    exit 1  # Exit with error if any failed (optional — remove if you want partial success to be OK)
else
    echo "🎉 All downloads completed successfully!"
fi