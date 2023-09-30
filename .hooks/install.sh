#!/bin/bash

# Install git hooks by modifying the hooks path
echo "Updating git hooksPath to use project's hooks"
git config --local core.hooksPath .hooks
