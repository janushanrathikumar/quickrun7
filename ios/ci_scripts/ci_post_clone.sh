#!/bin.sh

# Exit if any command fails
set -e

# 1. Install Flutter
echo "Cloning Flutter SDK..."
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# 2. Install CocoaPods using Homebrew
echo "Installing CocoaPods..."
brew install cocoapods

# 3. Download Flutter dependencies
echo "Running Flutter pub get..."
flutter pub get

# 4. Navigate to the ios directory and run pod install
echo "Running pod install..."
cd ios
pod install

echo "Script execution finished."