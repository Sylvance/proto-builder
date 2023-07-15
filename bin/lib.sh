#!/bin/bash

# Import utilities relative to root
. ./bin/runner.sh

# Main function
#
# $1 command
# $N command_arguments

runner $1 $2
