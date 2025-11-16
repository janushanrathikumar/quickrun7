#!/bin/zsh

set -e

echo "Setting Flutter SDK path..."
export FLUTTER_GIT_URL=https://github.com/flutter/flutter.git

echo "Cloning Flutter SDK..."
git clone https://github.com/flutter/flutter.git /Users/local/flutter

export PATH="/Users/local/flutter/bin:$PATH"

echo "Running Flutter precache..."
flutter precache --ios

echo "Flutter doctor..."
flutter doctor

echo "Done"
