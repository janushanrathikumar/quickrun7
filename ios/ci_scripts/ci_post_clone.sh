#!/bin/sh

# Fail this script if any command fails
set -e

# --- 1. Flutter Setup ---
echo "Cloning Flutter SDK..."
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Run flutter doctor to confirm setup
flutter doctor

# --- 2. Install Dependencies ---
echo "Installing CocoaPods..."
brew install cocoapods

# --- 3. Run Pub Get ---
echo "Navigating to project root to run Flutter pub get..."
# Go from ios/ci_scripts up to the project root (quickrun7)
cd ../..
flutter pub get

# --- 4. Run Pod Install ---
echo "Navigating to ios directory to run pod install..."
# From the project root, now go back into the ios directory
cd ios
pod install

echo "CI Post-Clone Script finished successfully."