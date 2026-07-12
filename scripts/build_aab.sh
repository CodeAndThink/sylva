cd ..
flutter clean
dart pub run intl_utils:generate
dart run build_runner build --delete-conflicting-outputs
dart format ./lib
flutter build appbundle --release