cd ..
flutter clean
dart pub run intl_utils:generate
dart run build_runner build
dart format ./lib
flutter build appbundle --release