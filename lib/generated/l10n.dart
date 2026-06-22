// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sylva`
  String get appName {
    return Intl.message('Sylva', name: 'appName', desc: '', args: []);
  }

  /// `Error: {message}`
  String error(Object message) {
    return Intl.message(
      'Error: $message',
      name: 'error',
      desc: '',
      args: [message],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Delete photo`
  String get deletePhoto {
    return Intl.message(
      'Delete photo',
      name: 'deletePhoto',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Awesome!`
  String get awesome {
    return Intl.message('Awesome!', name: 'awesome', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `files`
  String get files {
    return Intl.message('files', name: 'files', desc: '', args: []);
  }

  /// `file`
  String get file {
    return Intl.message('file', name: 'file', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Please double-check one last time!\nThis action cannot be undone.`
  String get delete_confirm_message {
    return Intl.message(
      'Please double-check one last time!\nThis action cannot be undone.',
      name: 'delete_confirm_message',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Brightness`
  String get brightness {
    return Intl.message('Brightness', name: 'brightness', desc: '', args: []);
  }

  /// `Luminance`
  String get luminance {
    return Intl.message('Luminance', name: 'luminance', desc: '', args: []);
  }

  /// `Arrow`
  String get arrow {
    return Intl.message('Arrow', name: 'arrow', desc: '', args: []);
  }

  /// `Line`
  String get line {
    return Intl.message('Line', name: 'line', desc: '', args: []);
  }

  /// `Rectangle`
  String get rectangle {
    return Intl.message('Rectangle', name: 'rectangle', desc: '', args: []);
  }

  /// `Circle`
  String get circle {
    return Intl.message('Circle', name: 'circle', desc: '', args: []);
  }

  /// `Color`
  String get color {
    return Intl.message('Color', name: 'color', desc: '', args: []);
  }

  /// `Fill`
  String get fill {
    return Intl.message('Fill', name: 'fill', desc: '', args: []);
  }

  /// `Align text`
  String get textAlign {
    return Intl.message('Align text', name: 'textAlign', desc: '', args: []);
  }

  /// `Ratio`
  String get ratio {
    return Intl.message('Ratio', name: 'ratio', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Paint`
  String get paint {
    return Intl.message('Paint', name: 'paint', desc: '', args: []);
  }

  /// `Text`
  String get text {
    return Intl.message('Text', name: 'text', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Blur`
  String get blur {
    return Intl.message('Blur', name: 'blur', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Permission Required`
  String get permissionRequired {
    return Intl.message(
      'Permission Required',
      name: 'permissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Twinfix needs access to your photo library to scan and clean duplicate photos.`
  String get permissionDescription {
    return Intl.message(
      'Twinfix needs access to your photo library to scan and clean duplicate photos.',
      name: 'permissionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Scan Limit`
  String get scanLimit {
    return Intl.message('Scan Limit', name: 'scanLimit', desc: '', args: []);
  }

  /// `Level {level}`
  String level(Object level) {
    return Intl.message('Level $level', name: 'level', desc: '', args: [level]);
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `Duplicates`
  String get duplicates {
    return Intl.message('Duplicates', name: 'duplicates', desc: '', args: []);
  }

  /// `Progress`
  String get progress {
    return Intl.message('Progress', name: 'progress', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Mon`
  String get mon {
    return Intl.message('Mon', name: 'mon', desc: '', args: []);
  }

  /// `Wed`
  String get wed {
    return Intl.message('Wed', name: 'wed', desc: '', args: []);
  }

  /// `Thu`
  String get thu {
    return Intl.message('Thu', name: 'thu', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Light`
  String get themeLight {
    return Intl.message('Light', name: 'themeLight', desc: '', args: []);
  }

  /// `Dark`
  String get themeDark {
    return Intl.message('Dark', name: 'themeDark', desc: '', args: []);
  }

  /// `System`
  String get themeSystem {
    return Intl.message('System', name: 'themeSystem', desc: '', args: []);
  }

  /// `Log out`
  String get logout {
    return Intl.message('Log out', name: 'logout', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 2 characters`
  String get nameLength {
    return Intl.message(
      'Name must be at least 2 characters',
      name: 'nameLength',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get emailInvalid {
    return Intl.message(
      'Invalid email format',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters, include uppercase, lowercase, number and special character`
  String get passwordLength {
    return Intl.message(
      'Password must be at least 8 characters, include uppercase, lowercase, number and special character',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm password is required',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak.`
  String get weakPassword {
    return Intl.message(
      'Password is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `User is banned.`
  String get userBanned {
    return Intl.message(
      'User is banned.',
      name: 'userBanned',
      desc: '',
      args: [],
    );
  }

  /// `User not found.`
  String get userNotFound {
    return Intl.message(
      'User not found.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Email is not confirmed.`
  String get emailNotConfirmed {
    return Intl.message(
      'Email is not confirmed.',
      name: 'emailNotConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Replace Original`
  String get replaceOriginal {
    return Intl.message(
      'Replace Original',
      name: 'replaceOriginal',
      desc: '',
      args: [],
    );
  }

  /// `Create New Image`
  String get createNewImage {
    return Intl.message(
      'Create New Image',
      name: 'createNewImage',
      desc: '',
      args: [],
    );
  }

  /// `Image saved successfully!`
  String get imageSaved {
    return Intl.message(
      'Image saved successfully!',
      name: 'imageSaved',
      desc: '',
      args: [],
    );
  }

  /// `Opacity`
  String get opacity {
    return Intl.message('Opacity', name: 'opacity', desc: '', args: []);
  }

  /// `Size`
  String get size {
    return Intl.message('Size', name: 'size', desc: '', args: []);
  }

  /// `Finish`
  String get finish {
    return Intl.message('Finish', name: 'finish', desc: '', args: []);
  }

  /// `GPS location data removed and saved as a new copy.`
  String get gpsRemovedSuccess {
    return Intl.message(
      'GPS location data removed and saved as a new copy.',
      name: 'gpsRemovedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Restore Purchases`
  String get restorePurchases {
    return Intl.message(
      'Restore Purchases',
      name: 'restorePurchases',
      desc: '',
      args: [],
    );
  }

  /// `Could not restore purchases or you don't have a subscription.`
  String get restoreFailureMessage {
    return Intl.message(
      'Could not restore purchases or you don\'t have a subscription.',
      name: 'restoreFailureMessage',
      desc: '',
      args: [],
    );
  }

  /// `Purchase failed or was cancelled.`
  String get purchaseFailureMessage {
    return Intl.message(
      'Purchase failed or was cancelled.',
      name: 'purchaseFailureMessage',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message('Premium', name: 'premium', desc: '', args: []);
  }

  /// `Action Required`
  String get cancelMonthlyTitle {
    return Intl.message(
      'Action Required',
      name: 'cancelMonthlyTitle',
      desc: '',
      args: [],
    );
  }

  /// `You've successfully upgraded to Lifetime! Since you previously had a Monthly subscription, please remember to cancel it in the App Store/Google Play to avoid being charged for both.`
  String get cancelMonthlyMessage {
    return Intl.message(
      'You\'ve successfully upgraded to Lifetime! Since you previously had a Monthly subscription, please remember to cancel it in the App Store/Google Play to avoid being charged for both.',
      name: 'cancelMonthlyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Manage Subscriptions`
  String get manageSubscriptions {
    return Intl.message(
      'Manage Subscriptions',
      name: 'manageSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Add Twinfix Widget`
  String get homeWidgetDialogTitle {
    return Intl.message(
      'Add Twinfix Widget',
      name: 'homeWidgetDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can add Twinfix widget to your home screen to quickly monitor device storage:`
  String get homeWidgetDialogSubtitle {
    return Intl.message(
      'You can add Twinfix widget to your home screen to quickly monitor device storage:',
      name: 'homeWidgetDialogSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `1. Go to your phone's home screen.`
  String get homeWidgetStep1 {
    return Intl.message(
      '1. Go to your phone\'s home screen.',
      name: 'homeWidgetStep1',
      desc: '',
      args: [],
    );
  }

  /// `2. Touch and hold any empty space on the screen.`
  String get homeWidgetStep2 {
    return Intl.message(
      '2. Touch and hold any empty space on the screen.',
      name: 'homeWidgetStep2',
      desc: '',
      args: [],
    );
  }

  /// `3. Select "Widgets".`
  String get homeWidgetStep3 {
    return Intl.message(
      '3. Select "Widgets".',
      name: 'homeWidgetStep3',
      desc: '',
      args: [],
    );
  }

  /// `4. Find Twinfix and drag the widget to the screen.`
  String get homeWidgetStep4 {
    return Intl.message(
      '4. Find Twinfix and drag the widget to the screen.',
      name: 'homeWidgetStep4',
      desc: '',
      args: [],
    );
  }

  /// `GOT IT`
  String get understood {
    return Intl.message('GOT IT', name: 'understood', desc: '', args: []);
  }

  /// `Auto Detect Colors`
  String get autoDetectColors {
    return Intl.message(
      'Auto Detect Colors',
      name: 'autoDetectColors',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load colors`
  String get failedToLoadColors {
    return Intl.message(
      'Failed to load colors',
      name: 'failedToLoadColors',
      desc: '',
      args: [],
    );
  }

  /// `Copied {color} to clipboard`
  String colorCopiedSuccess(Object color) {
    return Intl.message(
      'Copied $color to clipboard',
      name: 'colorCopiedSuccess',
      desc: '',
      args: [color],
    );
  }

  /// `Failed to copy color`
  String get colorCopiedFailure {
    return Intl.message(
      'Failed to copy color',
      name: 'colorCopiedFailure',
      desc: '',
      args: [],
    );
  }

  /// `Save Color`
  String get saveColor {
    return Intl.message('Save Color', name: 'saveColor', desc: '', args: []);
  }

  /// `My Colors`
  String get myColors {
    return Intl.message('My Colors', name: 'myColors', desc: '', args: []);
  }

  /// `Use magnifier to pick colors`
  String get useMagnifierToPickColors {
    return Intl.message(
      'Use magnifier to pick colors',
      name: 'useMagnifierToPickColors',
      desc: '',
      args: [],
    );
  }

  /// `Nothing selected to copy`
  String get nothingSelectedToCopy {
    return Intl.message(
      'Nothing selected to copy',
      name: 'nothingSelectedToCopy',
      desc: '',
      args: [],
    );
  }

  /// `Save to library`
  String get saveToLibrary {
    return Intl.message(
      'Save to library',
      name: 'saveToLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Pick image from gallery`
  String get pickImageFromGallery {
    return Intl.message(
      'Pick image from gallery',
      name: 'pickImageFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `No history yet`
  String get noHistoryYet {
    return Intl.message(
      'No history yet',
      name: 'noHistoryYet',
      desc: '',
      args: [],
    );
  }

  /// `Save as new`
  String get saveAsNew {
    return Intl.message('Save as new', name: 'saveAsNew', desc: '', args: []);
  }

  /// `Replace existing record`
  String get replaceExistingRecord {
    return Intl.message(
      'Replace existing record',
      name: 'replaceExistingRecord',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: '', args: []);
  }

  /// `Last 7 days`
  String get last7Days {
    return Intl.message('Last 7 days', name: 'last7Days', desc: '', args: []);
  }

  /// `Last 30 days`
  String get last30Days {
    return Intl.message('Last 30 days', name: 'last30Days', desc: '', args: []);
  }

  /// `Older`
  String get older {
    return Intl.message('Older', name: 'older', desc: '', args: []);
  }

  /// `Flash Mode`
  String get flashMode {
    return Intl.message('Flash Mode', name: 'flashMode', desc: '', args: []);
  }

  /// `Timer`
  String get timer {
    return Intl.message('Timer', name: 'timer', desc: '', args: []);
  }

  /// `Switch Camera`
  String get switchCamera {
    return Intl.message(
      'Switch Camera',
      name: 'switchCamera',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
