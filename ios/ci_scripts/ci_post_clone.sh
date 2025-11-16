#!/bin/sh

# Fail this script if any command fails
set -e

# --- 1. Flutter Setup ---
echo "Cloning Flutter SDK..."
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# --- 2. Download Flutter Engine (THE FIX) ---
echo "Running Flutter precache for iOS..."
# This command downloads the missing Flutter.xcframework
flutter precache --ios

# --- 3. Run Doctor (Good to check setup) ---
echo "Running Flutter doctor..."
flutter doctor

# --- 4. Install Dependencies ---
echo "Installing CocoaPods..."
brew install cocoapods

# --- 5. Run Pub Get ---
echo "Navigating to project root to run Flutter pub get..."
# Go from ios/ci_scripts up to the project root
cd ../..
flutter pub get

# --- 6. Run Pod Install ---
echo "Navigating to ios directory to run pod install..."
# From the project root, now go back into the ios directory
cd ios
pod install

echo "CI Post-Clone Script finished successfully."