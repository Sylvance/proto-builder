#!/bin/sh

# Import utils
. ./bin/string_manipulation.sh

# Utility function for running scripts

runner() {
  case "$1" in
    to_lowercase)
        to_lowercase $2
        ;;
    to_uppercase)
        to_uppercase $2
        ;;
    to_titlecase)
        to_titlecase $2
        ;;
    to_camelcase)
        to_camelcase $2
        ;;
    to_snakecase)
        to_snakecase $2
        ;;
    to_pascalcase)
        to_pascalcase $2
        ;;
    *)
        echo -n "Unknown"
        ;;
  esac
}
