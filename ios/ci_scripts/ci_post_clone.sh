#!/bin/zsh
set -e

echo "Cloning Flutter SDK..."
git clone https://github.com/flutter/flutter.git /Users/local/flutter

# IMPORTANT: keep existing PATH
export PATH="/Users/local/flutter/bin:$PATH"

echo "Flutter precache"
flutter precache --ios

echo "Flutter doctor"
flutter doctor

echo "ci_post_clone script completed."
