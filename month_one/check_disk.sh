#!/bin/bash

THRESHOLD=85
MOUNT="/"

# Read the usage percentage for the root filesystem, digits only
USAGE=$(df "$MOUNT" --output=pcent | tail -1 | tr -dc '0-9')

# Stop if the threshold isn't a whole number
if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]]; then
  echo "ERROR: THRESHOLD must be a whole number, got '$THRESHOLD'"
  exit 2
fi

# Stop if the usage couldn't be read
if ! [[ "$USAGE" =~ ^[0-9]+$ ]]; then
  echo "ERROR: could not read disk usage for $MOUNT"
  exit 2
fi

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "WARNING: disk usage is ${USAGE}% (limit ${THRESHOLD}%)"
  exit 1
else
  echo "OK: disk usage is ${USAGE}%"
  exit 0
fi
