#!/bin/bash

# This script updates the .SRCINFO file with the latest version information
set -e

# Get the current version from PKGBUILD
CURRENT_VERSION=$(grep -oP '^pkgver=\K.*' PKGBUILD)

# Get the latest version from GitHub
LATEST_VERSION=$(curl -s "https://api.github.com/repos/Nerimity/nerimity-desktop/releases/latest" | jq -r .tag_name | sed 's/^v//g')

# Check if we need to update
if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
  echo "Updating from version $CURRENT_VERSION to $LATEST_VERSION"
  
  # Update the PKGBUILD with the latest version
  sed -i "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" PKGBUILD
  
  # Reset pkgrel to 1 since this is a new version
  sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
  
  # Generate a new .SRCINFO file
  makepkg --printsrcinfo > .SRCINFO
  
  # If git is available and this is a git repository, commit and push the changes
  if command -v git >/dev/null 2>&1 && [ -d .git ]; then
    git add PKGBUILD .SRCINFO
    git commit -m "Update to version ${LATEST_VERSION}"
    
    # Uncomment the next line to automatically push changes
    # git push
    
    echo "Changes committed. Run 'git push' to update the remote repository."
  fi
  
  echo "Updated PKGBUILD and .SRCINFO with version ${LATEST_VERSION}"
else
  echo "Already at the latest version: ${CURRENT_VERSION}"
fi 