#!/bin/bash

# Set source and destination directories
SOURCE_DIR="/Users/stefan/tmp/dtm_2025/dtm"          # Change this to your input directory
DEST_DIR="/Users/stefan/tmp/dtm_2025/dtm_slope"           # Change this to your output directory

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Check if gdaldem is available
if ! command -v gdaldem &> /dev/null; then
    echo "Error: gdaldem command not found. Please install GDAL."
    exit 1
fi

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Process each .tif file
echo "Processing .tif files from: $SOURCE_DIR"
echo "Output will be saved to: $DEST_DIR"

for tif_file in "$SOURCE_DIR"/*.tif; do
    # Skip if no .tif files found
    if [ ! -f "$tif_file" ]; then
        echo "No .tif files found in $SOURCE_DIR"
        break
    fi
    
    # Get filename without path
    filename=$(basename "$tif_file")
    
    # Create output filename (add _hillshade before extension)
    output_file="$DEST_DIR/${filename%.tif}_hillshade.tif"
    
    echo "Processing: $filename"
    
    # Run gdaldem hillshade command
    gdaldem slope -compute_edges "$tif_file" "$output_file"
    
    # Check if command was successful
    if [ $? -eq 0 ]; then
        echo "✓ Created: $output_file"
    else
        echo "✗ Failed to process: $filename"
    fi
    echo "---"
done

echo "Processing complete!"