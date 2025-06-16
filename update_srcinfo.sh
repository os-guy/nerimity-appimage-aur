#!/bin/bash

# This script updates the .SRCINFO file with the latest version information

# Get the latest version from GitHub
LATEST_VERSION=$(curl -s "https://api.github.com/repos/Nerimity/nerimity-desktop/releases/latest" | jq -r .tag_name | sed 's/^v//g')

# Update the PKGBUILD with the latest version
sed -i "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" PKGBUILD

# Generate a new .SRCINFO file
makepkg --printsrcinfo > .SRCINFO

echo "Updated PKGBUILD and .SRCINFO with version ${LATEST_VERSION}" 