#!/bin/bash
set -e

echo "=== Running Dart Format ==="
dart format --set-exit-if-changed ./lib

echo "=== Running Dart Analyze ==="
dart analyze

echo "=== Running Flutter Test ==="
flutter test

echo "✅ All quality checks passed!"