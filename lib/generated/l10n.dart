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

  /// `Photo Library Permission Required`
  String get permissionRequired {
    return Intl.message(
      'Photo Library Permission Required',
      name: 'permissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Sylva needs access to your photo library to select photos and extract colors.`
  String get permissionDescription {
    return Intl.message(
      'Sylva needs access to your photo library to select photos and extract colors.',
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

  /// `Settings`
  String get tutorialSettingsTitle {
    return Intl.message(
      'Settings',
      name: 'tutorialSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Customize your app preferences here.`
  String get tutorialSettingsDesc {
    return Intl.message(
      'Customize your app preferences here.',
      name: 'tutorialSettingsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Flash Mode`
  String get tutorialFlashTitle {
    return Intl.message(
      'Flash Mode',
      name: 'tutorialFlashTitle',
      desc: '',
      args: [],
    );
  }

  /// `Toggle flash modes (Auto, On, Off).`
  String get tutorialFlashDesc {
    return Intl.message(
      'Toggle flash modes (Auto, On, Off).',
      name: 'tutorialFlashDesc',
      desc: '',
      args: [],
    );
  }

  /// `Timer`
  String get tutorialTimerTitle {
    return Intl.message(
      'Timer',
      name: 'tutorialTimerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Set a countdown timer before capturing.`
  String get tutorialTimerDesc {
    return Intl.message(
      'Set a countdown timer before capturing.',
      name: 'tutorialTimerDesc',
      desc: '',
      args: [],
    );
  }

  /// `Switch Camera`
  String get tutorialCameraTitle {
    return Intl.message(
      'Switch Camera',
      name: 'tutorialCameraTitle',
      desc: '',
      args: [],
    );
  }

  /// `Switch between front and rear cameras.`
  String get tutorialCameraDesc {
    return Intl.message(
      'Switch between front and rear cameras.',
      name: 'tutorialCameraDesc',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get tutorialHistoryTitle {
    return Intl.message(
      'History',
      name: 'tutorialHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `View your previously captured photos.`
  String get tutorialHistoryDesc {
    return Intl.message(
      'View your previously captured photos.',
      name: 'tutorialHistoryDesc',
      desc: '',
      args: [],
    );
  }

  /// `Capture`
  String get tutorialCaptureTitle {
    return Intl.message(
      'Capture',
      name: 'tutorialCaptureTitle',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo right now.`
  String get tutorialCaptureDesc {
    return Intl.message(
      'Take a photo right now.',
      name: 'tutorialCaptureDesc',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get tutorialGalleryTitle {
    return Intl.message(
      'Gallery',
      name: 'tutorialGalleryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pick an existing photo from your gallery.`
  String get tutorialGalleryDesc {
    return Intl.message(
      'Pick an existing photo from your gallery.',
      name: 'tutorialGalleryDesc',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get tutorialNext {
    return Intl.message('Next', name: 'tutorialNext', desc: '', args: []);
  }

  /// `Skip`
  String get tutorialSkip {
    return Intl.message('Skip', name: 'tutorialSkip', desc: '', args: []);
  }

  /// `Photo Preview`
  String get tutorialImageTitle {
    return Intl.message(
      'Photo Preview',
      name: 'tutorialImageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pan your finger on the photo to magnify and pick any color.`
  String get tutorialImageDesc {
    return Intl.message(
      'Pan your finger on the photo to magnify and pick any color.',
      name: 'tutorialImageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Color Palette`
  String get tutorialPaletteTitle {
    return Intl.message(
      'Color Palette',
      name: 'tutorialPaletteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tap a color to filter, long press to copy its hex code.`
  String get tutorialPaletteDesc {
    return Intl.message(
      'Tap a color to filter, long press to copy its hex code.',
      name: 'tutorialPaletteDesc',
      desc: '',
      args: [],
    );
  }

  /// `Expand Palette`
  String get tutorialExpandPaletteTitle {
    return Intl.message(
      'Expand Palette',
      name: 'tutorialExpandPaletteTitle',
      desc: '',
      args: [],
    );
  }

  /// `View all extracted and picked colors in a bottom sheet.`
  String get tutorialExpandPaletteDesc {
    return Intl.message(
      'View all extracted and picked colors in a bottom sheet.',
      name: 'tutorialExpandPaletteDesc',
      desc: '',
      args: [],
    );
  }

  /// `Go Back`
  String get tutorialBackTitle {
    return Intl.message(
      'Go Back',
      name: 'tutorialBackTitle',
      desc: '',
      args: [],
    );
  }

  /// `Discard changes and return to the camera.`
  String get tutorialBackDesc {
    return Intl.message(
      'Discard changes and return to the camera.',
      name: 'tutorialBackDesc',
      desc: '',
      args: [],
    );
  }

  /// `Save to App`
  String get tutorialSaveTitle {
    return Intl.message(
      'Save to App',
      name: 'tutorialSaveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save this photo and colors to the app's history.`
  String get tutorialSaveDesc {
    return Intl.message(
      'Save this photo and colors to the app\'s history.',
      name: 'tutorialSaveDesc',
      desc: '',
      args: [],
    );
  }

  /// `Save to Library`
  String get tutorialLibraryTitle {
    return Intl.message(
      'Save to Library',
      name: 'tutorialLibraryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Export this photo to your device's photo gallery.`
  String get tutorialLibraryDesc {
    return Intl.message(
      'Export this photo to your device\'s photo gallery.',
      name: 'tutorialLibraryDesc',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get createTime {
    return Intl.message('Time', name: 'createTime', desc: '', args: []);
  }

  /// `Information & Support`
  String get informationAndSupport {
    return Intl.message(
      'Information & Support',
      name: 'informationAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `Donation`
  String get donation {
    return Intl.message('Donation', name: 'donation', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Contact`
  String get contact {
    return Intl.message('Contact', name: 'contact', desc: '', args: []);
  }

  /// `Clear all history`
  String get clearAllHistory {
    return Intl.message(
      'Clear all history',
      name: 'clearAllHistory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear all history? This action cannot be undone.`
  String get clearAllHistoryConfirm {
    return Intl.message(
      'Are you sure you want to clear all history? This action cannot be undone.',
      name: 'clearAllHistoryConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Clear History`
  String get tutorialDeleteAllTitle {
    return Intl.message(
      'Clear History',
      name: 'tutorialDeleteAllTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete all of your previously captured photos.`
  String get tutorialDeleteAllDesc {
    return Intl.message(
      'Delete all of your previously captured photos.',
      name: 'tutorialDeleteAllDesc',
      desc: '',
      args: [],
    );
  }

  /// `Change View`
  String get tutorialHistoryViewTitle {
    return Intl.message(
      'Change View',
      name: 'tutorialHistoryViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Toggle between list and grid views for your history.`
  String get tutorialHistoryViewDesc {
    return Intl.message(
      'Toggle between list and grid views for your history.',
      name: 'tutorialHistoryViewDesc',
      desc: '',
      args: [],
    );
  }

  /// `Favorites Only`
  String get tutorialFavoritesTitle {
    return Intl.message(
      'Favorites Only',
      name: 'tutorialFavoritesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Filter your history to only show your favorite photos.`
  String get tutorialFavoritesDesc {
    return Intl.message(
      'Filter your history to only show your favorite photos.',
      name: 'tutorialFavoritesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Sort History`
  String get tutorialSortTitle {
    return Intl.message(
      'Sort History',
      name: 'tutorialSortTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sort your history ascending or descending by time.`
  String get tutorialSortDesc {
    return Intl.message(
      'Sort your history ascending or descending by time.',
      name: 'tutorialSortDesc',
      desc: '',
      args: [],
    );
  }

  /// `Change View`
  String get historyView {
    return Intl.message('Change View', name: 'historyView', desc: '', args: []);
  }

  /// `Only Favorites`
  String get onlyFavorites {
    return Intl.message(
      'Only Favorites',
      name: 'onlyFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Sort History`
  String get historySort {
    return Intl.message(
      'Sort History',
      name: 'historySort',
      desc: '',
      args: [],
    );
  }

  /// `Capture the Colors`
  String get onboardTitle {
    return Intl.message(
      'Capture the Colors',
      name: 'onboardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Extract, save and manage vibrant colors from any photo you take.`
  String get onboardDesc {
    return Intl.message(
      'Extract, save and manage vibrant colors from any photo you take.',
      name: 'onboardDesc',
      desc: '',
      args: [],
    );
  }

  /// `Let's Go`
  String get letGo {
    return Intl.message('Let\'s Go', name: 'letGo', desc: '', args: []);
  }

  /// `Full Screen`
  String get fullScreen {
    return Intl.message('Full Screen', name: 'fullScreen', desc: '', args: []);
  }

  /// `Zoom`
  String get tutorialZoomTitle {
    return Intl.message('Zoom', name: 'tutorialZoomTitle', desc: '', args: []);
  }

  /// `Use these buttons to zoom in or out precisely.`
  String get tutorialZoomDesc {
    return Intl.message(
      'Use these buttons to zoom in or out precisely.',
      name: 'tutorialZoomDesc',
      desc: '',
      args: [],
    );
  }

  /// `Full Screen`
  String get tutorialFullScreenTitle {
    return Intl.message(
      'Full Screen',
      name: 'tutorialFullScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tap here to view the original photo in full screen.`
  String get tutorialFullScreenDesc {
    return Intl.message(
      'Tap here to view the original photo in full screen.',
      name: 'tutorialFullScreenDesc',
      desc: '',
      args: [],
    );
  }

  /// `Camera Permission Required`
  String get cameraPermissionRequired {
    return Intl.message(
      'Camera Permission Required',
      name: 'cameraPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Sylva needs access to your camera to take photos and extract colors.`
  String get cameraPermissionDescription {
    return Intl.message(
      'Sylva needs access to your camera to take photos and extract colors.',
      name: 'cameraPermissionDescription',
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

  /// `Camera access denied or device has no camera.`
  String get cameraPermissionDenied {
    return Intl.message(
      'Camera access denied or device has no camera.',
      name: 'cameraPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `No cameras found on device`
  String get noCamerasFound {
    return Intl.message(
      'No cameras found on device',
      name: 'noCamerasFound',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorPrefix {
    return Intl.message('Error', name: 'errorPrefix', desc: '', args: []);
  }

  /// `Thanks & Reference`
  String get thanksAndReference {
    return Intl.message(
      'Thanks & Reference',
      name: 'thanksAndReference',
      desc: '',
      args: [],
    );
  }

  /// `Acknowledgements`
  String get acknowledgements {
    return Intl.message(
      'Acknowledgements',
      name: 'acknowledgements',
      desc: '',
      args: [],
    );
  }

  /// `We would like to thank the following creators for their assets used in this application:`
  String get acknowledgementsIntro {
    return Intl.message(
      'We would like to thank the following creators for their assets used in this application:',
      name: 'acknowledgementsIntro',
      desc: '',
      args: [],
    );
  }

  /// `Designed by {author} from Flaticon`
  String designedByAuthorFromFlaticon(String author) {
    return Intl.message(
      'Designed by $author from Flaticon',
      name: 'designedByAuthorFromFlaticon',
      desc: '',
      args: [author],
    );
  }

  /// `Road block icon`
  String get roadBlockIcon {
    return Intl.message(
      'Road block icon',
      name: 'roadBlockIcon',
      desc: '',
      args: [],
    );
  }

  /// `Colors icon`
  String get colorsIcon {
    return Intl.message('Colors icon', name: 'colorsIcon', desc: '', args: []);
  }

  /// `Camera icon`
  String get cameraIcon {
    return Intl.message('Camera icon', name: 'cameraIcon', desc: '', args: []);
  }

  /// `Designed by {author} - Magnific.com`
  String designedByAuthorMagnific(String author) {
    return Intl.message(
      'Designed by $author - Magnific.com',
      name: 'designedByAuthorMagnific',
      desc: '',
      args: [author],
    );
  }

  /// `Rainbow halftone dots background`
  String get rainbowHalftoneDotsBackground {
    return Intl.message(
      'Rainbow halftone dots background',
      name: 'rainbowHalftoneDotsBackground',
      desc: '',
      args: [],
    );
  }

  /// `Sylva is a camera application designed to help you capture and discover the world's colors effortlessly.`
  String get aboutSylvaDescription {
    return Intl.message(
      'Sylva is a camera application designed to help you capture and discover the world\'s colors effortlessly.',
      name: 'aboutSylvaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String version(String version) {
    return Intl.message(
      'Version $version',
      name: 'version',
      desc: '',
      args: [version],
    );
  }

  /// `We value your privacy. Sylva processes your camera data locally whenever possible. We do not store or share your personal photos without your explicit consent.`
  String get privacyPolicyContent {
    return Intl.message(
      'We value your privacy. Sylva processes your camera data locally whenever possible. We do not store or share your personal photos without your explicit consent.',
      name: 'privacyPolicyContent',
      desc: '',
      args: [],
    );
  }

  /// `By using Sylva, you agree to our Terms of Service. You must not use the application for any illegal or unauthorized purpose. The services and content are provided "as is" without warranties of any kind.`
  String get termsOfServiceContent {
    return Intl.message(
      'By using Sylva, you agree to our Terms of Service. You must not use the application for any illegal or unauthorized purpose. The services and content are provided "as is" without warranties of any kind.',
      name: 'termsOfServiceContent',
      desc: '',
      args: [],
    );
  }

  /// `Information Collection`
  String get privacyPolicyTitle1 {
    return Intl.message(
      'Information Collection',
      name: 'privacyPolicyTitle1',
      desc: '',
      args: [],
    );
  }

  /// `We do not collect or store any personal photos or camera data on our servers. All camera processing is performed locally on your device.`
  String get privacyPolicyContent1 {
    return Intl.message(
      'We do not collect or store any personal photos or camera data on our servers. All camera processing is performed locally on your device.',
      name: 'privacyPolicyContent1',
      desc: '',
      args: [],
    );
  }

  /// `Use of Information`
  String get privacyPolicyTitle2 {
    return Intl.message(
      'Use of Information',
      name: 'privacyPolicyTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Any data processed by Sylva is used solely for providing the camera and color analysis features within the application.`
  String get privacyPolicyContent2 {
    return Intl.message(
      'Any data processed by Sylva is used solely for providing the camera and color analysis features within the application.',
      name: 'privacyPolicyContent2',
      desc: '',
      args: [],
    );
  }

  /// `Data Security`
  String get privacyPolicyTitle3 {
    return Intl.message(
      'Data Security',
      name: 'privacyPolicyTitle3',
      desc: '',
      args: [],
    );
  }

  /// `We implement industry-standard security measures to protect your data. Since your photos remain on your device, you have full control over your privacy.`
  String get privacyPolicyContent3 {
    return Intl.message(
      'We implement industry-standard security measures to protect your data. Since your photos remain on your device, you have full control over your privacy.',
      name: 'privacyPolicyContent3',
      desc: '',
      args: [],
    );
  }

  /// `Acceptance of Terms`
  String get tosTitle1 {
    return Intl.message(
      'Acceptance of Terms',
      name: 'tosTitle1',
      desc: '',
      args: [],
    );
  }

  /// `By downloading and using Sylva, you agree to these Terms of Service. If you do not agree, please do not use the application.`
  String get tosContent1 {
    return Intl.message(
      'By downloading and using Sylva, you agree to these Terms of Service. If you do not agree, please do not use the application.',
      name: 'tosContent1',
      desc: '',
      args: [],
    );
  }

  /// `User Responsibilities`
  String get tosTitle2 {
    return Intl.message(
      'User Responsibilities',
      name: 'tosTitle2',
      desc: '',
      args: [],
    );
  }

  /// `You are responsible for any content you capture or process using Sylva. You agree not to use the application for any unlawful or prohibited activities.`
  String get tosContent2 {
    return Intl.message(
      'You are responsible for any content you capture or process using Sylva. You agree not to use the application for any unlawful or prohibited activities.',
      name: 'tosContent2',
      desc: '',
      args: [],
    );
  }

  /// `Limitation of Liability`
  String get tosTitle3 {
    return Intl.message(
      'Limitation of Liability',
      name: 'tosTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Sylva and its creators shall not be held liable for any damages or losses resulting from your use of the application. The service is provided 'as is'.`
  String get tosContent3 {
    return Intl.message(
      'Sylva and its creators shall not be held liable for any damages or losses resulting from your use of the application. The service is provided \'as is\'.',
      name: 'tosContent3',
      desc: '',
      args: [],
    );
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
