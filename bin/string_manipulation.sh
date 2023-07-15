#!/bin/bash

# Function to convert text to lowercase
function to_lowercase() {
    local input=$1
    local result=$(echo "$input" | tr '[:upper:]' '[:lower:]')
    echo "$result"
}

# Function to convert text to uppercase
function to_uppercase() {
    local input=$1
    local result=$(echo "$input" | tr '[:lower:]' '[:upper:]')
    echo "$result"
}

# Function to convert text to titlecase
function to_titlecase() {
  local input="$1"
  local title_case=""

  IFS=' ' read -ra words <<< "$input"
  for word in "${words[@]}"; do
    first_char=$(to_uppercase "${word:0:1}")
    rest_of_word=$(to_lowercase "${word:1}")
    title_case+=" $first_char$rest_of_word"
  done

  # Remove leading space and print the title case string
  echo "${title_case:1}"
}

# Function to convert text to camelcase
function to_camelcase() {
  local input="$1"
  local camel_case=""

  IFS=' ' read -ra words <<< "$input"
  for word in "${words[@]}"; do
    if [[ -z "$camel_case" ]]; then
      camel_case+=$(to_lowercase "$word")
    else
      camel_case+=$(to_titlecase "$word")
    fi
  done

  echo "$camel_case"
}

# Function to convert text to snake case
function to_snakecase() {
  local input="$1"
  local snake_case=""

  IFS=' ' read -ra words <<< "$input"
  for word in "${words[@]}"; do
    if [[ -z "$snake_case" ]]; then
      snake_case+=$(to_lowercase "$word")
    else
      snake_case+="_$(to_lowercase "$word")"
    fi
  done

  echo "$snake_case"
}

# Function to convert text to PascalCase
function to_pascalcase() {
  local input="$1"
  local pascal_case=""

  IFS=' ' read -ra words <<< "$input"
  for word in "${words[@]}"; do
    pascal_case+=$(to_titlecase "$word")
  done

  echo "$pascal_case"
}

# Usage examples
# input="Hello World"
# echo "Lowercase: $(to_lowercase "$input")"
# echo "Uppercase: $(to_uppercase "$input")"
# echo "Titlecase: $(to_titlecase "$input")"
# echo "Camelcase: $(to_camelcase "$input")"
# echo "Snakecase: $(to_snakecase "$input")"
# echo "Pascalcase: $(to_pascalcase "$input")"
