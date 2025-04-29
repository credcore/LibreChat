#!/bin/bash

# Path to your .env file
ENV_FILE=".env"

# Check if the file exists
if [ ! -f "$ENV_FILE" ]; then
    echo "$ENV_FILE file not found!"
    exit 1
fi

# Export each variable
export $(grep -v '^#' "$ENV_FILE" | xargs)

# Optional: Show exported variables
echo "Exported variables:"
grep -v '^#' "$ENV_FILE" | sed 's/=/=/g'
