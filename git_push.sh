#!/bin/bash

# A script to add, commit, and push changes to Git

# Ask for a commit message
echo "Enter your commit message:"
read COMMIT_MESSAGE

# Add all changes
git add .

# Commit changes with the provided message
git commit -m "$COMMIT_MESSAGE"

# Push changes to the 'main' branch, forcing the update
git push origin main --force

# Confirm completion
echo "Changes have been pushed to the 'main' branch."

