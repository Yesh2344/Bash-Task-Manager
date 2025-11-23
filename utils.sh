#!/bin/bash

# Utility functions

# Function to check if a string is a valid integer
is_valid_integer() {
  local num="$1"
  if [[ ! "$num" =~ ^[0-9]+$ ]]; then
    return 1  # Not a valid integer
  else
    return 0  # Valid integer
  fi
}