#!/bin/bash

# Specify the starting folder. Replace "/path/to/start" with your starting folder path.
START_DIR="."

# Use the find command to search for .terragrunt-cache directories recursively
# and delete each one along with its contents.
find "$START_DIR" -type d -name '.terragrunt-cache' -prune -exec rm -rf {} +

echo "Cleanup complete."

