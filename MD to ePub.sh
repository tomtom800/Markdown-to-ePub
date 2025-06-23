#!/bin/bash

# =============================================================================
# USER DEFINED FOLDERS 
# =============================================================================
# This is where your completed ePub will export to:
destFolder="<your/file/path>"
# If you want to keep your original markdown file, put an output folder for it here. If you delete this line the file will be deleted:
markdownFolder="<your/file/path>"
# The folder that Obsidian Local Images Plus uses, which the script will empty when its done:
imagesFolder="<your/file/path>"
# The path to your Calibre install:
calibrePath="<your/file/path>"

# =============================================================================
# SCRIPT EXECUTION
# =============================================================================

# A 10 second wait to allow the Obsidian Local Images Plus plugin time to work
sleep 10

# Set the source file provided by Hazel
theFile="$1"

# Ensure the destination folder exists
mkdir -p "$destFolder"

# Extract the filename without the path and extension
fileName=$(basename "$theFile")
fileNameWithoutExtension="${fileName%.md}"

# Sanitize the filename by removing problematic characters
sanitizedFileName=$(echo "$fileNameWithoutExtension" | tr -d '\\/:*?"<>|')

# Define the output EPUB file path
outputFile="$destFolder/$sanitizedFileName.epub"

# Convert using Calibre's ebook-convert tool
"$calibrePath" "$theFile" "$outputFile" \
    --title "$sanitizedFileName" \
    --no-default-epub-cover \
    --markdown-extensions nl2br \
    --input-encoding UTF-8 \
    --level1-toc "//h:h1" \
    --level2-toc "//h:h2" \
    --level3-toc "//h:h3"

# Check if the conversion was successful
if [ -e "$outputFile" ]; then
    # Handle the original Markdown file
    if [ -n "$markdownFolder" ] && [ "$markdownFolder" != "" ]; then
        # Move the original Markdown file to the Markdown Folder
        mv "$theFile" "$markdownFolder"
    else
        # Delete the original Markdown file if no folder is defined
        rm "$theFile"
    fi
    
    # Clean up images folder by deleting all contents
    if [ -d "$imagesFolder" ]; then
        rm -rf "$imagesFolder"/*
    fi
else
    echo "Conversion failed for: $fileName"
    exit 1
fi