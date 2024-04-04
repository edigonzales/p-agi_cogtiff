#!/bin/bash

# Check if the file path is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Read each line from the file
while IFS= read -r url; do
    # Use curl to download the content from the link
    curl -O "$url"
done < "$1"
