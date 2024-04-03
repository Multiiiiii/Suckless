#!/bin/bash

# Read the package list
while IFS= read -r package; do
    # Check if the package is available in the official repositories
    if pacman -Si --needed "$package" >/dev/null 2>&1; then
        echo "Installing $package with pacman..."
        sudo pacman -S --noconfirm "$package"
    else
        echo "Installing $package with paru..."
        paru -S --noconfirm "$package"
    fi
done < packages.txt
