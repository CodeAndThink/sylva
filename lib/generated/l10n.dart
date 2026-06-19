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

  /// `Photo Duplicate Cleaner`
  String get appDescription {
    return Intl.message(
      'Photo Duplicate Cleaner',
      name: 'appDescription',
      desc: '',
      args: [],
    );
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

  /// `Got it`
  String get done {
    return Intl.message('Got it', name: 'done', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `files`
  String get files {
    return Intl.message('files', name: 'files', desc: '', args: []);
  }

  /// `file`
  String get file {
    return Intl.message('file', name: 'file', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Calculating...`
  String get calculatingProgress {
    return Intl.message(
      'Calculating...',
      name: 'calculatingProgress',
      desc: '',
      args: [],
    );
  }

  /// `Merge Data`
  String get mergeData {
    return Intl.message('Merge Data', name: 'mergeData', desc: '', args: []);
  }

  /// `Confirm delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
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

  /// `No more photos to delete`
  String get confirmnoMorePhotosToDelete {
    return Intl.message(
      'No more photos to delete',
      name: 'confirmnoMorePhotosToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Live Photos`
  String get livePhotos {
    return Intl.message('Live Photos', name: 'livePhotos', desc: '', args: []);
  }

  /// `Live Photos are animated photos that can play short videos. Clean them up to free up storage.`
  String get livePhotosDescription {
    return Intl.message(
      'Live Photos are animated photos that can play short videos. Clean them up to free up storage.',
      name: 'livePhotosDescription',
      desc: '',
      args: [],
    );
  }

  /// `Screenshots`
  String get screenshots {
    return Intl.message('Screenshots', name: 'screenshots', desc: '', args: []);
  }

  /// `Screenshots are photos that are not animated. Clean them up to free up storage.`
  String get screenshotsDescription {
    return Intl.message(
      'Screenshots are photos that are not animated. Clean them up to free up storage.',
      name: 'screenshotsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get saving {
    return Intl.message('Saving...', name: 'saving', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Tune`
  String get tune {
    return Intl.message('Tune', name: 'tune', desc: '', args: []);
  }

  /// `Brightness`
  String get brightness {
    return Intl.message('Brightness', name: 'brightness', desc: '', args: []);
  }

  /// `Contrast`
  String get contrast {
    return Intl.message('Contrast', name: 'contrast', desc: '', args: []);
  }

  /// `Saturation`
  String get saturation {
    return Intl.message('Saturation', name: 'saturation', desc: '', args: []);
  }

  /// `Exposure`
  String get exposure {
    return Intl.message('Exposure', name: 'exposure', desc: '', args: []);
  }

  /// `Hue`
  String get hue {
    return Intl.message('Hue', name: 'hue', desc: '', args: []);
  }

  /// `Temperature`
  String get temperature {
    return Intl.message('Temperature', name: 'temperature', desc: '', args: []);
  }

  /// `Sharpness`
  String get sharpness {
    return Intl.message('Sharpness', name: 'sharpness', desc: '', args: []);
  }

  /// `Fade`
  String get fade {
    return Intl.message('Fade', name: 'fade', desc: '', args: []);
  }

  /// `Luminance`
  String get luminance {
    return Intl.message('Luminance', name: 'luminance', desc: '', args: []);
  }

  /// `No Filter`
  String get noFilter {
    return Intl.message('No Filter', name: 'noFilter', desc: '', args: []);
  }

  /// `Enter text`
  String get inputHintText {
    return Intl.message(
      'Enter text',
      name: 'inputHintText',
      desc: '',
      args: [],
    );
  }

  /// `Zoom`
  String get moveAndZoom {
    return Intl.message('Zoom', name: 'moveAndZoom', desc: '', args: []);
  }

  /// `Freestyle`
  String get freestyle {
    return Intl.message('Freestyle', name: 'freestyle', desc: '', args: []);
  }

  /// `Freestyle arrow start`
  String get freestyleArrowStart {
    return Intl.message(
      'Freestyle arrow start',
      name: 'freestyleArrowStart',
      desc: '',
      args: [],
    );
  }

  /// `Freestyle arrow end`
  String get freestyleArrowEnd {
    return Intl.message(
      'Freestyle arrow end',
      name: 'freestyleArrowEnd',
      desc: '',
      args: [],
    );
  }

  /// `Freestyle arrow start-end`
  String get freestyleArrowStartEnd {
    return Intl.message(
      'Freestyle arrow start-end',
      name: 'freestyleArrowStartEnd',
      desc: '',
      args: [],
    );
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

  /// `Dash line`
  String get dashLine {
    return Intl.message('Dash line', name: 'dashLine', desc: '', args: []);
  }

  /// `Dash-dot line`
  String get dashDotLine {
    return Intl.message(
      'Dash-dot line',
      name: 'dashDotLine',
      desc: '',
      args: [],
    );
  }

  /// `Hexagon`
  String get hexagon {
    return Intl.message('Hexagon', name: 'hexagon', desc: '', args: []);
  }

  /// `Polygon`
  String get polygon {
    return Intl.message('Polygon', name: 'polygon', desc: '', args: []);
  }

  /// `Pixelate`
  String get pixelate {
    return Intl.message('Pixelate', name: 'pixelate', desc: '', args: []);
  }

  /// `Line width`
  String get lineWidth {
    return Intl.message('Line width', name: 'lineWidth', desc: '', args: []);
  }

  /// `Eraser`
  String get eraser {
    return Intl.message('Eraser', name: 'eraser', desc: '', args: []);
  }

  /// `Toggle fill`
  String get toggleFill {
    return Intl.message('Toggle fill', name: 'toggleFill', desc: '', args: []);
  }

  /// `Change opacity`
  String get changeOpacity {
    return Intl.message(
      'Change opacity',
      name: 'changeOpacity',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get undo {
    return Intl.message('Undo', name: 'undo', desc: '', args: []);
  }

  /// `Redo`
  String get redo {
    return Intl.message('Redo', name: 'redo', desc: '', args: []);
  }

  /// `More`
  String get smallScreenMoreTooltip {
    return Intl.message(
      'More',
      name: 'smallScreenMoreTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message('Color', name: 'color', desc: '', args: []);
  }

  /// `Stroke Width`
  String get strokeWidth {
    return Intl.message(
      'Stroke Width',
      name: 'strokeWidth',
      desc: '',
      args: [],
    );
  }

  /// `Fill`
  String get fill {
    return Intl.message('Fill', name: 'fill', desc: '', args: []);
  }

  /// `Custom 1`
  String get custom1 {
    return Intl.message('Custom 1', name: 'custom1', desc: '', args: []);
  }

  /// `Custom 2`
  String get custom2 {
    return Intl.message('Custom 2', name: 'custom2', desc: '', args: []);
  }

  /// `Custom 3`
  String get custom3 {
    return Intl.message('Custom 3', name: 'custom3', desc: '', args: []);
  }

  /// `Align text`
  String get textAlign {
    return Intl.message('Align text', name: 'textAlign', desc: '', args: []);
  }

  /// `Font scale`
  String get fontScale {
    return Intl.message('Font scale', name: 'fontScale', desc: '', args: []);
  }

  /// `Background mode`
  String get backgroundMode {
    return Intl.message(
      'Background mode',
      name: 'backgroundMode',
      desc: '',
      args: [],
    );
  }

  /// `Rotate`
  String get rotate {
    return Intl.message('Rotate', name: 'rotate', desc: '', args: []);
  }

  /// `Flip`
  String get flip {
    return Intl.message('Flip', name: 'flip', desc: '', args: []);
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

  /// `Crop`
  String get crop {
    return Intl.message('Crop', name: 'crop', desc: '', args: []);
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

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Unable to play media`
  String get error_unable_to_play_media {
    return Intl.message(
      'Unable to play media',
      name: 'error_unable_to_play_media',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported media type`
  String get error_unsupported_media_type {
    return Intl.message(
      'Unsupported media type',
      name: 'error_unsupported_media_type',
      desc: '',
      args: [],
    );
  }

  /// `Personalize interface`
  String get personalCustomizeableTheme {
    return Intl.message(
      'Personalize interface',
      name: 'personalCustomizeableTheme',
      desc: '',
      args: [],
    );
  }

  /// `Sync cleanup progress`
  String get personalProcessSync {
    return Intl.message(
      'Sync cleanup progress',
      name: 'personalProcessSync',
      desc: '',
      args: [],
    );
  }

  /// `1 Month`
  String get packageMonthlyTitle {
    return Intl.message(
      '1 Month',
      name: 'packageMonthlyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Monthly subscription. Cancel anytime.`
  String get packageMonthlyDescription {
    return Intl.message(
      'Monthly subscription. Cancel anytime.',
      name: 'packageMonthlyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Lifetime`
  String get packageLifetimeTitle {
    return Intl.message(
      'Lifetime',
      name: 'packageLifetimeTitle',
      desc: '',
      args: [],
    );
  }

  /// `One-time purchase, keep forever.`
  String get packageLifetimeDescription {
    return Intl.message(
      'One-time purchase, keep forever.',
      name: 'packageLifetimeDescription',
      desc: '',
      args: [],
    );
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

  /// `Nothing found`
  String get nothingFound {
    return Intl.message(
      'Nothing found',
      name: 'nothingFound',
      desc: '',
      args: [],
    );
  }

  /// `Become one of us`
  String get becomeOneOfUs {
    return Intl.message(
      'Become one of us',
      name: 'becomeOneOfUs',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get pleaseFillAllFields {
    return Intl.message(
      'Please fill all fields',
      name: 'pleaseFillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get changePasswordSuccess {
    return Intl.message(
      'Password changed successfully',
      name: 'changePasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `7 Days`
  String get sevenDays {
    return Intl.message('7 Days', name: 'sevenDays', desc: '', args: []);
  }

  /// `7 Weeks`
  String get sevenWeeks {
    return Intl.message('7 Weeks', name: 'sevenWeeks', desc: '', args: []);
  }

  /// `W.`
  String get weekShort {
    return Intl.message('W.', name: 'weekShort', desc: '', args: []);
  }

  /// `An error occurred. Please try again.`
  String get defaultErrorMessage {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'defaultErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Twinfix`
  String get onboardingWelcomeTitle {
    return Intl.message(
      'Welcome to Twinfix',
      name: 'onboardingWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start Scanning`
  String get onboardingStartScan {
    return Intl.message(
      'Start Scanning',
      name: 'onboardingStartScan',
      desc: '',
      args: [],
    );
  }

  /// `Swipe Left to Delete`
  String get onboardingDemoSwipeLeft {
    return Intl.message(
      'Swipe Left to Delete',
      name: 'onboardingDemoSwipeLeft',
      desc: '',
      args: [],
    );
  }

  /// `Swipe Right to Keep`
  String get onboardingDemoSwipeRight {
    return Intl.message(
      'Swipe Right to Keep',
      name: 'onboardingDemoSwipeRight',
      desc: '',
      args: [],
    );
  }

  /// `Start a quick scan`
  String get startQuickScan {
    return Intl.message(
      'Start a quick scan',
      name: 'startQuickScan',
      desc: '',
      args: [],
    );
  }

  /// `Use this button to scan your library and detect duplicates in one flow.`
  String get startQuickScanDescription {
    return Intl.message(
      'Use this button to scan your library and detect duplicates in one flow.',
      name: 'startQuickScanDescription',
      desc: '',
      args: [],
    );
  }

  /// `Open Gallery Manager`
  String get openGalleryManager {
    return Intl.message(
      'Open Gallery Manager',
      name: 'openGalleryManager',
      desc: '',
      args: [],
    );
  }

  /// `If you want to clean manually by media type, go here. Tap the highlighted button to open it.`
  String get openGalleryManagerDescription {
    return Intl.message(
      'If you want to clean manually by media type, go here. Tap the highlighted button to open it.',
      name: 'openGalleryManagerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Scanning device...`
  String get scanningDevice {
    return Intl.message(
      'Scanning device...',
      name: 'scanningDevice',
      desc: '',
      args: [],
    );
  }

  /// `Scanning document...`
  String get scanningDocument {
    return Intl.message(
      'Scanning document...',
      name: 'scanningDocument',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get tabScan {
    return Intl.message('Scan', name: 'tabScan', desc: '', args: []);
  }

  /// `Perfect!`
  String get perfect {
    return Intl.message('Perfect!', name: 'perfect', desc: '', args: []);
  }

  /// `Your device is very clean.`
  String get deviceIsClean {
    return Intl.message(
      'Your device is very clean.',
      name: 'deviceIsClean',
      desc: '',
      args: [],
    );
  }

  /// `Detected {count} duplicate groups`
  String detectedDuplicateGroups(Object count) {
    return Intl.message(
      'Detected $count duplicate groups',
      name: 'detectedDuplicateGroups',
      desc: '',
      args: [count],
    );
  }

  /// `Group {index} ({count} photos)`
  String groupIndex(Object index, Object count) {
    return Intl.message(
      'Group $index ($count photos)',
      name: 'groupIndex',
      desc: '',
      args: [index, count],
    );
  }

  /// `Scan results`
  String get scanResults {
    return Intl.message(
      'Scan results',
      name: 'scanResults',
      desc: '',
      args: [],
    );
  }

  /// `Scan Limit`
  String get scanLimit {
    return Intl.message('Scan Limit', name: 'scanLimit', desc: '', args: []);
  }

  /// `All`
  String get scanLimitAll {
    return Intl.message('All', name: 'scanLimitAll', desc: '', args: []);
  }

  /// `Scanning all photos may take a long time and use more battery.`
  String get scanLimitWarning {
    return Intl.message(
      'Scanning all photos may take a long time and use more battery.',
      name: 'scanLimitWarning',
      desc: '',
      args: [],
    );
  }

  /// `Gallery Manager`
  String get galleryManager {
    return Intl.message(
      'Gallery Manager',
      name: 'galleryManager',
      desc: '',
      args: [],
    );
  }

  /// `{count} photos`
  String totalPhotos(Object count) {
    return Intl.message(
      '$count photos',
      name: 'totalPhotos',
      desc: '',
      args: [count],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message('Sort', name: 'sort', desc: '', args: []);
  }

  /// `Date Descending`
  String get dateDesc {
    return Intl.message(
      'Date Descending',
      name: 'dateDesc',
      desc: '',
      args: [],
    );
  }

  /// `Date Ascending`
  String get dateAsc {
    return Intl.message('Date Ascending', name: 'dateAsc', desc: '', args: []);
  }

  /// `Size Descending`
  String get sizeDesc {
    return Intl.message(
      'Size Descending',
      name: 'sizeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Size Ascending`
  String get sizeAsc {
    return Intl.message('Size Ascending', name: 'sizeAsc', desc: '', args: []);
  }

  /// `Count Descending`
  String get countDesc {
    return Intl.message(
      'Count Descending',
      name: 'countDesc',
      desc: '',
      args: [],
    );
  }

  /// `Count Ascending`
  String get countAsc {
    return Intl.message(
      'Count Ascending',
      name: 'countAsc',
      desc: '',
      args: [],
    );
  }

  /// `Successfully cleaned {num} {unit} ({size})`
  String cleanedSpaceSuccess(Object num, Object unit, Object size) {
    return Intl.message(
      'Successfully cleaned $num $unit ($size)',
      name: 'cleanedSpaceSuccess',
      desc: '',
      args: [num, unit, size],
    );
  }

  /// `Photo`
  String get media_photo {
    return Intl.message('Photo', name: 'media_photo', desc: '', args: []);
  }

  /// `Video`
  String get media_video {
    return Intl.message('Video', name: 'media_video', desc: '', args: []);
  }

  /// `Audio`
  String get media_audio {
    return Intl.message('Audio', name: 'media_audio', desc: '', args: []);
  }

  /// `All`
  String get media_other {
    return Intl.message('All', name: 'media_other', desc: '', args: []);
  }

  /// `Media Type Selection`
  String get media_type_selection {
    return Intl.message(
      'Media Type Selection',
      name: 'media_type_selection',
      desc: '',
      args: [],
    );
  }

  /// `Long press to select all`
  String get longPressToSelectAll {
    return Intl.message(
      'Long press to select all',
      name: 'longPressToSelectAll',
      desc: '',
      args: [],
    );
  }

  /// `Select all`
  String get selectAll {
    return Intl.message('Select all', name: 'selectAll', desc: '', args: []);
  }

  /// `Clear selection`
  String get clearSelection {
    return Intl.message(
      'Clear selection',
      name: 'clearSelection',
      desc: '',
      args: [],
    );
  }

  /// `Delete ({count})`
  String deleteSelected(Object count) {
    return Intl.message(
      'Delete ($count)',
      name: 'deleteSelected',
      desc: '',
      args: [count],
    );
  }

  /// `Total: {count} {mediaType} (last 7 days)`
  String totalPhotosLast7Days(Object count, Object mediaType) {
    return Intl.message(
      'Total: $count $mediaType (last 7 days)',
      name: 'totalPhotosLast7Days',
      desc: '',
      args: [count, mediaType],
    );
  }

  /// `Total: {count} {mediaType} (last 7 weeks)`
  String totalPhotosLast7Weeks(Object count, Object mediaType) {
    return Intl.message(
      'Total: $count $mediaType (last 7 weeks)',
      name: 'totalPhotosLast7Weeks',
      desc: '',
      args: [count, mediaType],
    );
  }

  /// `Achievements`
  String get tabDashboard {
    return Intl.message(
      'Achievements',
      name: 'tabDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Level {level}`
  String level(Object level) {
    return Intl.message('Level $level', name: 'level', desc: '', args: [level]);
  }

  /// `{days} Days Streak`
  String streakDays(Object days) {
    return Intl.message(
      '$days Days Streak',
      name: 'streakDays',
      desc: '',
      args: [days],
    );
  }

  /// `Cleaned`
  String get cleaned {
    return Intl.message('Cleaned', name: 'cleaned', desc: '', args: []);
  }

  /// `Streak`
  String get streak {
    return Intl.message('Streak', name: 'streak', desc: '', args: []);
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `Blurry Deleted`
  String get blurryDeleted {
    return Intl.message(
      'Blurry Deleted',
      name: 'blurryDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Duplicates`
  String get duplicates {
    return Intl.message('Duplicates', name: 'duplicates', desc: '', args: []);
  }

  /// `Badges`
  String get badges {
    return Intl.message('Badges', name: 'badges', desc: '', args: []);
  }

  /// `All Badges`
  String get allBadges {
    return Intl.message('All Badges', name: 'allBadges', desc: '', args: []);
  }

  /// `Activity`
  String get activity {
    return Intl.message('Activity', name: 'activity', desc: '', args: []);
  }

  /// `Progress`
  String get progress {
    return Intl.message('Progress', name: 'progress', desc: '', args: []);
  }

  /// `Stats`
  String get stats {
    return Intl.message('Stats', name: 'stats', desc: '', args: []);
  }

  /// `Streaks`
  String get streaks {
    return Intl.message('Streaks', name: 'streaks', desc: '', args: []);
  }

  /// `Items Deleted`
  String get itemsDeleted {
    return Intl.message(
      'Items Deleted',
      name: 'itemsDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Other Features`
  String get tabOtherFeatures {
    return Intl.message(
      'Other Features',
      name: 'tabOtherFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Cleaning Activity`
  String get activityDetailTitle {
    return Intl.message(
      'Cleaning Activity',
      name: 'activityDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contribution graph`
  String get contributionGraph {
    return Intl.message(
      'Contribution graph',
      name: 'contributionGraph',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `No cleaning activity yet`
  String get noActivity {
    return Intl.message(
      'No cleaning activity yet',
      name: 'noActivity',
      desc: '',
      args: [],
    );
  }

  /// `Deleted {count} items`
  String deletedItemsCount(Object count) {
    return Intl.message(
      'Deleted $count items',
      name: 'deletedItemsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Unlocked`
  String get earned {
    return Intl.message('Unlocked', name: 'earned', desc: '', args: []);
  }

  /// `Requirements not met`
  String get notEarned {
    return Intl.message(
      'Requirements not met',
      name: 'notEarned',
      desc: '',
      args: [],
    );
  }

  /// `How to earn?`
  String get howToEarn {
    return Intl.message('How to earn?', name: 'howToEarn', desc: '', args: []);
  }

  /// `You need to perform more system cleaning steps or invite friends to get this prestigious badge.`
  String get howToEarnDescription {
    return Intl.message(
      'You need to perform more system cleaning steps or invite friends to get this prestigious badge.',
      name: 'howToEarnDescription',
      desc: '',
      args: [],
    );
  }

  /// `New Badge!`
  String get congratsBadgeTitle {
    return Intl.message(
      'New Badge!',
      name: 'congratsBadgeTitle',
      desc: '',
      args: [],
    );
  }

  /// `You just earned the "{badgeName}" badge!`
  String congratsBadgeMessage(Object badgeName) {
    return Intl.message(
      'You just earned the "$badgeName" badge!',
      name: 'congratsBadgeMessage',
      desc: '',
      args: [badgeName],
    );
  }

  /// `You just earned {count} new badges!`
  String congratsMultipleBadgesMessage(Object count) {
    return Intl.message(
      'You just earned $count new badges!',
      name: 'congratsMultipleBadgesMessage',
      desc: '',
      args: [count],
    );
  }

  /// `View full history`
  String get viewFullHistory {
    return Intl.message(
      'View full history',
      name: 'viewFullHistory',
      desc: '',
      args: [],
    );
  }

  /// `View detail`
  String get viewDetail {
    return Intl.message('View detail', name: 'viewDetail', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Mon`
  String get mon {
    return Intl.message('Mon', name: 'mon', desc: '', args: []);
  }

  /// `Tue`
  String get tue {
    return Intl.message('Tue', name: 'tue', desc: '', args: []);
  }

  /// `Wed`
  String get wed {
    return Intl.message('Wed', name: 'wed', desc: '', args: []);
  }

  /// `Thu`
  String get thu {
    return Intl.message('Thu', name: 'thu', desc: '', args: []);
  }

  /// `Fri`
  String get fri {
    return Intl.message('Fri', name: 'fri', desc: '', args: []);
  }

  /// `Sat`
  String get sat {
    return Intl.message('Sat', name: 'sat', desc: '', args: []);
  }

  /// `Sun`
  String get sun {
    return Intl.message('Sun', name: 'sun', desc: '', args: []);
  }

  /// `No badges earned yet`
  String get noBadgesEarnedYet {
    return Intl.message(
      'No badges earned yet',
      name: 'noBadgesEarnedYet',
      desc: '',
      args: [],
    );
  }

  /// `View All Badges`
  String get viewAllBadges {
    return Intl.message(
      'View All Badges',
      name: 'viewAllBadges',
      desc: '',
      args: [],
    );
  }

  /// `Newbie Cleaner`
  String get badgeNewbieName {
    return Intl.message(
      'Newbie Cleaner',
      name: 'badgeNewbieName',
      desc: '',
      args: [],
    );
  }

  /// `Delete your first photo and start the journey to free your storage.`
  String get badgeNewbieDesc {
    return Intl.message(
      'Delete your first photo and start the journey to free your storage.',
      name: 'badgeNewbieDesc',
      desc: '',
      args: [],
    );
  }

  /// `First Clean`
  String get badgeFirstCleanName {
    return Intl.message(
      'First Clean',
      name: 'badgeFirstCleanName',
      desc: '',
      args: [],
    );
  }

  /// `Delete your very first photos.`
  String get badgeFirstCleanDesc {
    return Intl.message(
      'Delete your very first photos.',
      name: 'badgeFirstCleanDesc',
      desc: '',
      args: [],
    );
  }

  /// `Apprentice Cleaner`
  String get badgeCleaner10Name {
    return Intl.message(
      'Apprentice Cleaner',
      name: 'badgeCleaner10Name',
      desc: '',
      args: [],
    );
  }

  /// `Delete a total of 10 photos.`
  String get badgeCleaner10Desc {
    return Intl.message(
      'Delete a total of 10 photos.',
      name: 'badgeCleaner10Desc',
      desc: '',
      args: [],
    );
  }

  /// `Expert Cleaner`
  String get badgeCleaner100Name {
    return Intl.message(
      'Expert Cleaner',
      name: 'badgeCleaner100Name',
      desc: '',
      args: [],
    );
  }

  /// `Delete a total of 100 photos.`
  String get badgeCleaner100Desc {
    return Intl.message(
      'Delete a total of 100 photos.',
      name: 'badgeCleaner100Desc',
      desc: '',
      args: [],
    );
  }

  /// `Photo Shredder`
  String get badgeCleaner1000Name {
    return Intl.message(
      'Photo Shredder',
      name: 'badgeCleaner1000Name',
      desc: '',
      args: [],
    );
  }

  /// `Delete a total of 1000 photos.`
  String get badgeCleaner1000Desc {
    return Intl.message(
      'Delete a total of 1000 photos.',
      name: 'badgeCleaner1000Desc',
      desc: '',
      args: [],
    );
  }

  /// `Blur Hunter`
  String get badgeBlurry10Name {
    return Intl.message(
      'Blur Hunter',
      name: 'badgeBlurry10Name',
      desc: '',
      args: [],
    );
  }

  /// `Delete 10 blurry photos.`
  String get badgeBlurry10Desc {
    return Intl.message(
      'Delete 10 blurry photos.',
      name: 'badgeBlurry10Desc',
      desc: '',
      args: [],
    );
  }

  /// `Blur Killer`
  String get badgeBlurryKillerName {
    return Intl.message(
      'Blur Killer',
      name: 'badgeBlurryKillerName',
      desc: '',
      args: [],
    );
  }

  /// `Delete 50 blurry photos.`
  String get badgeBlurryKillerDesc {
    return Intl.message(
      'Delete 50 blurry photos.',
      name: 'badgeBlurryKillerDesc',
      desc: '',
      args: [],
    );
  }

  /// `Blur Destroyer`
  String get badgeBlurry200Name {
    return Intl.message(
      'Blur Destroyer',
      name: 'badgeBlurry200Name',
      desc: '',
      args: [],
    );
  }

  /// `Delete 200 blurry photos.`
  String get badgeBlurry200Desc {
    return Intl.message(
      'Delete 200 blurry photos.',
      name: 'badgeBlurry200Desc',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate Hunter`
  String get badgeDuplicate20Name {
    return Intl.message(
      'Duplicate Hunter',
      name: 'badgeDuplicate20Name',
      desc: '',
      args: [],
    );
  }

  /// `Delete 20 duplicate photos.`
  String get badgeDuplicate20Desc {
    return Intl.message(
      'Delete 20 duplicate photos.',
      name: 'badgeDuplicate20Desc',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate Master`
  String get badgeDuplicate100Name {
    return Intl.message(
      'Duplicate Master',
      name: 'badgeDuplicate100Name',
      desc: '',
      args: [],
    );
  }

  /// `Delete 100 duplicate photos.`
  String get badgeDuplicate100Desc {
    return Intl.message(
      'Delete 100 duplicate photos.',
      name: 'badgeDuplicate100Desc',
      desc: '',
      args: [],
    );
  }

  /// `Storage Novice`
  String get badgeFreed100mbName {
    return Intl.message(
      'Storage Novice',
      name: 'badgeFreed100mbName',
      desc: '',
      args: [],
    );
  }

  /// `Delete a total of 200 photos.`
  String get badgeFreed100mbDesc {
    return Intl.message(
      'Delete a total of 200 photos.',
      name: 'badgeFreed100mbDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cleaning Master`
  String get badgeGigaKingName {
    return Intl.message(
      'Cleaning Master',
      name: 'badgeGigaKingName',
      desc: '',
      args: [],
    );
  }

  /// `Delete a total of 500 photos.`
  String get badgeGigaKingDesc {
    return Intl.message(
      'Delete a total of 500 photos.',
      name: 'badgeGigaKingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Storage Hero`
  String get badgeFreed5gbName {
    return Intl.message(
      'Storage Hero',
      name: 'badgeFreed5gbName',
      desc: '',
      args: [],
    );
  }

  /// `Delete a total of 2000 photos.`
  String get badgeFreed5gbDesc {
    return Intl.message(
      'Delete a total of 2000 photos.',
      name: 'badgeFreed5gbDesc',
      desc: '',
      args: [],
    );
  }

  /// `Disk Legend`
  String get badgeFreed10gbName {
    return Intl.message(
      'Disk Legend',
      name: 'badgeFreed10gbName',
      desc: '',
      args: [],
    );
  }

  /// `Delete a total of 5000 photos.`
  String get badgeFreed10gbDesc {
    return Intl.message(
      'Delete a total of 5000 photos.',
      name: 'badgeFreed10gbDesc',
      desc: '',
      args: [],
    );
  }

  /// `Dedicated`
  String get badgeStreak3Name {
    return Intl.message(
      'Dedicated',
      name: 'badgeStreak3Name',
      desc: '',
      args: [],
    );
  }

  /// `Clean up for 3 consecutive days.`
  String get badgeStreak3Desc {
    return Intl.message(
      'Clean up for 3 consecutive days.',
      name: 'badgeStreak3Desc',
      desc: '',
      args: [],
    );
  }

  /// `Never Give Up`
  String get badgeStreak7Name {
    return Intl.message(
      'Never Give Up',
      name: 'badgeStreak7Name',
      desc: '',
      args: [],
    );
  }

  /// `Clean up for 7 consecutive days.`
  String get badgeStreak7Desc {
    return Intl.message(
      'Clean up for 7 consecutive days.',
      name: 'badgeStreak7Desc',
      desc: '',
      args: [],
    );
  }

  /// `Speed Cleaner`
  String get badgeSpeedCleanName {
    return Intl.message(
      'Speed Cleaner',
      name: 'badgeSpeedCleanName',
      desc: '',
      args: [],
    );
  }

  /// `Delete 50 photos in a single session.`
  String get badgeSpeedCleanDesc {
    return Intl.message(
      'Delete 50 photos in a single session.',
      name: 'badgeSpeedCleanDesc',
      desc: '',
      args: [],
    );
  }

  /// `AI Assistant`
  String get badgeAiCleanerName {
    return Intl.message(
      'AI Assistant',
      name: 'badgeAiCleanerName',
      desc: '',
      args: [],
    );
  }

  /// `Use the automatic cleanup feature.`
  String get badgeAiCleanerDesc {
    return Intl.message(
      'Use the automatic cleanup feature.',
      name: 'badgeAiCleanerDesc',
      desc: '',
      args: [],
    );
  }

  /// `Perfectionist`
  String get badgePerfectionistName {
    return Intl.message(
      'Perfectionist',
      name: 'badgePerfectionistName',
      desc: '',
      args: [],
    );
  }

  /// `Delete over 80% of blurry photos on your device.`
  String get badgePerfectionistDesc {
    return Intl.message(
      'Delete over 80% of blurry photos on your device.',
      name: 'badgePerfectionistDesc',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get historyToday {
    return Intl.message('Today', name: 'historyToday', desc: '', args: []);
  }

  /// `Yesterday`
  String get historyYesterday {
    return Intl.message(
      'Yesterday',
      name: 'historyYesterday',
      desc: '',
      args: [],
    );
  }

  /// `Last 7 Days`
  String get historyLast7Days {
    return Intl.message(
      'Last 7 Days',
      name: 'historyLast7Days',
      desc: '',
      args: [],
    );
  }

  /// `This Month`
  String get historyThisMonth {
    return Intl.message(
      'This Month',
      name: 'historyThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Earlier`
  String get historyEarlier {
    return Intl.message('Earlier', name: 'historyEarlier', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Settings`
  String get tabSettings {
    return Intl.message('Settings', name: 'tabSettings', desc: '', args: []);
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

  /// `Background Style`
  String get backgroundStyle {
    return Intl.message(
      'Background Style',
      name: 'backgroundStyle',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message('Vietnamese', name: 'vietnamese', desc: '', args: []);
  }

  /// `Chinese`
  String get chinese {
    return Intl.message('Chinese', name: 'chinese', desc: '', args: []);
  }

  /// `Japanese`
  String get japanese {
    return Intl.message('Japanese', name: 'japanese', desc: '', args: []);
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Not logged in (Guest)`
  String get notLoggedIn {
    return Intl.message(
      'Not logged in (Guest)',
      name: 'notLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Log in to sync your progress across devices`
  String get loginToSync {
    return Intl.message(
      'Log in to sync your progress across devices',
      name: 'loginToSync',
      desc: '',
      args: [],
    );
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

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account? Register`
  String get noAccountRegister {
    return Intl.message(
      'Do not have an account? Register',
      name: 'noAccountRegister',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPasswordQuestion {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordQuestion',
      desc: '',
      args: [],
    );
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

  /// `Already have an account? Login`
  String get alreadyHaveAccountLogin {
    return Intl.message(
      'Already have an account? Login',
      name: 'alreadyHaveAccountLogin',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset link sent to your email!`
  String get resetLinkSent {
    return Intl.message(
      'Reset link sent to your email!',
      name: 'resetLinkSent',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send reset link`
  String get failedToSendResetLink {
    return Intl.message(
      'Failed to send reset link',
      name: 'failedToSendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a link to reset your password.`
  String get forgotPasswordDescription {
    return Intl.message(
      'Enter your email address and we will send you a link to reset your password.',
      name: 'forgotPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Unknown User`
  String get unknownUser {
    return Intl.message(
      'Unknown User',
      name: 'unknownUser',
      desc: '',
      args: [],
    );
  }

  /// `No email provided`
  String get noEmailProvided {
    return Intl.message(
      'No email provided',
      name: 'noEmailProvided',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful`
  String get registerSuccess {
    return Intl.message(
      'Registration successful',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Account sync active`
  String get accountSyncActive {
    return Intl.message(
      'Account sync active',
      name: 'accountSyncActive',
      desc: '',
      args: [],
    );
  }

  /// `Link guest data?`
  String get syncDataTitle {
    return Intl.message(
      'Link guest data?',
      name: 'syncDataTitle',
      desc: '',
      args: [],
    );
  }

  /// `We found some local cleaning data from your guest session. Would you like to merge it into your new account?`
  String get syncDataMessage {
    return Intl.message(
      'We found some local cleaning data from your guest session. Would you like to merge it into your new account?',
      name: 'syncDataMessage',
      desc: '',
      args: [],
    );
  }

  /// `Keep Local Data`
  String get keepLocalData {
    return Intl.message(
      'Keep Local Data',
      name: 'keepLocalData',
      desc: '',
      args: [],
    );
  }

  /// `Restore from Cloud`
  String get restoreFromCloud {
    return Intl.message(
      'Restore from Cloud',
      name: 'restoreFromCloud',
      desc: '',
      args: [],
    );
  }

  /// `What are Sync Options?`
  String get syncExplainTitle {
    return Intl.message(
      'What are Sync Options?',
      name: 'syncExplainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Combines local guest statistics and achievements with existing account data. You won't lose any progress.`
  String get syncExplainMergeDesc {
    return Intl.message(
      'Combines local guest statistics and achievements with existing account data. You won\'t lose any progress.',
      name: 'syncExplainMergeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Keeps current guest data on this device and overwrites existing cloud data.`
  String get syncExplainKeepLocalDesc {
    return Intl.message(
      'Keeps current guest data on this device and overwrites existing cloud data.',
      name: 'syncExplainKeepLocalDesc',
      desc: '',
      args: [],
    );
  }

  /// `Discards current guest session data and restores previous account data from the cloud.`
  String get syncExplainRestoreDesc {
    return Intl.message(
      'Discards current guest session data and restores previous account data from the cloud.',
      name: 'syncExplainRestoreDesc',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
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

  /// `Login failed. Please try again.`
  String get loginFailureMessage {
    return Intl.message(
      'Login failed. Please try again.',
      name: 'loginFailureMessage',
      desc: '',
      args: [],
    );
  }

  /// `Google sign in successfully!`
  String get googleLoginSuccessfully {
    return Intl.message(
      'Google sign in successfully!',
      name: 'googleLoginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Login successfully!`
  String get loginSuccessfully {
    return Intl.message(
      'Login successfully!',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Google sign in failed. Please try again.`
  String get googleLoginFailed {
    return Intl.message(
      'Google sign in failed. Please try again.',
      name: 'googleLoginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Data synchronized successfully`
  String get dataSynchronizedSuccessfully {
    return Intl.message(
      'Data synchronized successfully',
      name: 'dataSynchronizedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email to verify your account before logging in.`
  String get registerSuccessMessage {
    return Intl.message(
      'Please check your email to verify your account before logging in.',
      name: 'registerSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordTooShort {
    return Intl.message(
      'Password is too short',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Failed to change password. Please try again.`
  String get failedToChangePassword {
    return Intl.message(
      'Failed to change password. Please try again.',
      name: 'failedToChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load user profile. Please check your connection.`
  String get failedToLoadProfile {
    return Intl.message(
      'Failed to load user profile. Please check your connection.',
      name: 'failedToLoadProfile',
      desc: '',
      args: [],
    );
  }

  /// `Registration failed. Please try again.`
  String get failedToRegister {
    return Intl.message(
      'Registration failed. Please try again.',
      name: 'failedToRegister',
      desc: '',
      args: [],
    );
  }

  /// `Email is already in use.`
  String get emailAlreadyInUse {
    return Intl.message(
      'Email is already in use.',
      name: 'emailAlreadyInUse',
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

  /// `Too many requests. Please try again later.`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests. Please try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Send us your feedback`
  String get sendFeedbackTitle {
    return Intl.message(
      'Send us your feedback',
      name: 'sendFeedbackTitle',
      desc: '',
      args: [],
    );
  }

  /// `We would love to hear from you!`
  String get sendFeedbackSubtitle {
    return Intl.message(
      'We would love to hear from you!',
      name: 'sendFeedbackSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Feedback Type`
  String get feedbackTypeLabel {
    return Intl.message(
      'Feedback Type',
      name: 'feedbackTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get feedbackTitleLabel {
    return Intl.message(
      'Title',
      name: 'feedbackTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter feedback title...`
  String get feedbackTitleHint {
    return Intl.message(
      'Enter feedback title...',
      name: 'feedbackTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter title`
  String get feedbackTitleRequired {
    return Intl.message(
      'Please enter title',
      name: 'feedbackTitleRequired',
      desc: '',
      args: [],
    );
  }

  /// `Detailed Content`
  String get feedbackContentLabel {
    return Intl.message(
      'Detailed Content',
      name: 'feedbackContentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter details of the bug or improvement suggestion here...`
  String get feedbackContentHint {
    return Intl.message(
      'Enter details of the bug or improvement suggestion here...',
      name: 'feedbackContentHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter detailed content`
  String get feedbackContentRequired {
    return Intl.message(
      'Please enter detailed content',
      name: 'feedbackContentRequired',
      desc: '',
      args: [],
    );
  }

  /// `Submit Feedback`
  String get submitFeedback {
    return Intl.message(
      'Submit Feedback',
      name: 'submitFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Bug`
  String get feedbackTypeBug {
    return Intl.message('Bug', name: 'feedbackTypeBug', desc: '', args: []);
  }

  /// `Improvement`
  String get feedbackTypeImprovement {
    return Intl.message(
      'Improvement',
      name: 'feedbackTypeImprovement',
      desc: '',
      args: [],
    );
  }

  /// `Question`
  String get feedbackTypeQuestion {
    return Intl.message(
      'Question',
      name: 'feedbackTypeQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get feedbackTypeOther {
    return Intl.message('Other', name: 'feedbackTypeOther', desc: '', args: []);
  }

  /// `Opening email app to send feedback...`
  String get openingEmailApp {
    return Intl.message(
      'Opening email app to send feedback...',
      name: 'openingEmailApp',
      desc: '',
      args: [],
    );
  }

  /// `Could not open email app. Support email: {email}`
  String couldNotOpenEmailApp(Object email) {
    return Intl.message(
      'Could not open email app. Support email: $email',
      name: 'couldNotOpenEmailApp',
      desc: '',
      args: [email],
    );
  }

  /// `Error email not found`
  String get errorEmailNotFound {
    return Intl.message(
      'Error email not found',
      name: 'errorEmailNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Add Watermark`
  String get addWaterMark {
    return Intl.message(
      'Add Watermark',
      name: 'addWaterMark',
      desc: '',
      args: [],
    );
  }

  /// `Add watermark to photos.`
  String get addWaterMarkDescription {
    return Intl.message(
      'Add watermark to photos.',
      name: 'addWaterMarkDescription',
      desc: '',
      args: [],
    );
  }

  /// `Watermark Text`
  String get watermarkText {
    return Intl.message(
      'Watermark Text',
      name: 'watermarkText',
      desc: '',
      args: [],
    );
  }

  /// `Select Template`
  String get selectTemplate {
    return Intl.message(
      'Select Template',
      name: 'selectTemplate',
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

  /// `Enter watermark text`
  String get enterWatermarkText {
    return Intl.message(
      'Enter watermark text',
      name: 'enterWatermarkText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter watermark text`
  String get pleaseEnterWatermarkText {
    return Intl.message(
      'Please enter watermark text',
      name: 'pleaseEnterWatermarkText',
      desc: '',
      args: [],
    );
  }

  /// `Failed to save image. Please try again.`
  String get failedToSaveImage {
    return Intl.message(
      'Failed to save image. Please try again.',
      name: 'failedToSaveImage',
      desc: '',
      args: [],
    );
  }

  /// `Blurry Photos`
  String get blurryPhotos {
    return Intl.message(
      'Blurry Photos',
      name: 'blurryPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Detect and clean out photos that are blurry or have motion blur.`
  String get blurryPhotosDescription {
    return Intl.message(
      'Detect and clean out photos that are blurry or have motion blur.',
      name: 'blurryPhotosDescription',
      desc: '',
      args: [],
    );
  }

  /// `Remove GPS`
  String get removeGPS {
    return Intl.message('Remove GPS', name: 'removeGPS', desc: '', args: []);
  }

  /// `Remove GPS information from photos.`
  String get removeGPSDescription {
    return Intl.message(
      'Remove GPS information from photos.',
      name: 'removeGPSDescription',
      desc: '',
      args: [],
    );
  }

  /// `Blur Face`
  String get blurFace {
    return Intl.message('Blur Face', name: 'blurFace', desc: '', args: []);
  }

  /// `Blur face in photos.`
  String get blurFaceDescription {
    return Intl.message(
      'Blur face in photos.',
      name: 'blurFaceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Document Detection`
  String get document {
    return Intl.message(
      'Document Detection',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `Identify and manage images containing text.`
  String get documentDescription {
    return Intl.message(
      'Identify and manage images containing text.',
      name: 'documentDescription',
      desc: '',
      args: [],
    );
  }

  /// `No images with text found.`
  String get noDocumentsFound {
    return Intl.message(
      'No images with text found.',
      name: 'noDocumentsFound',
      desc: '',
      args: [],
    );
  }

  /// `Edit image`
  String get editDescription {
    return Intl.message(
      'Edit image',
      name: 'editDescription',
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

  /// `Density`
  String get density {
    return Intl.message('Density', name: 'density', desc: '', args: []);
  }

  /// `Finish`
  String get finish {
    return Intl.message('Finish', name: 'finish', desc: '', args: []);
  }

  /// `Edit another photo`
  String get editAnotherPhoto {
    return Intl.message(
      'Edit another photo',
      name: 'editAnotherPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Solid`
  String get solid {
    return Intl.message('Solid', name: 'solid', desc: '', args: []);
  }

  /// `Emoji`
  String get emoji {
    return Intl.message('Emoji', name: 'emoji', desc: '', args: []);
  }

  /// `Failed to convert image`
  String get convertImageFailed {
    return Intl.message(
      'Failed to convert image',
      name: 'convertImageFailed',
      desc: '',
      args: [],
    );
  }

  /// `Glasses`
  String get glasses {
    return Intl.message('Glasses', name: 'glasses', desc: '', args: []);
  }

  /// `Eye Bar`
  String get eyeBar {
    return Intl.message('Eye Bar', name: 'eyeBar', desc: '', args: []);
  }

  /// `Intensity`
  String get intensity {
    return Intl.message('Intensity', name: 'intensity', desc: '', args: []);
  }

  /// `Select Emoji`
  String get selectEmoji {
    return Intl.message(
      'Select Emoji',
      name: 'selectEmoji',
      desc: '',
      args: [],
    );
  }

  /// `Tap to change style`
  String get tapToChangeStyle {
    return Intl.message(
      'Tap to change style',
      name: 'tapToChangeStyle',
      desc: '',
      args: [],
    );
  }

  /// `No faces detected in this photo.`
  String get noFacesDetected {
    return Intl.message(
      'No faces detected in this photo.',
      name: 'noFacesDetected',
      desc: '',
      args: [],
    );
  }

  /// `No images with location data found.`
  String get noPhotosWithGPSFound {
    return Intl.message(
      'No images with location data found.',
      name: 'noPhotosWithGPSFound',
      desc: '',
      args: [],
    );
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

  /// `Enjoy all professional features without limits.`
  String get paywallSubtitle {
    return Intl.message(
      'Enjoy all professional features without limits.',
      name: 'paywallSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No advertisements`
  String get premiumFeatureNoAds {
    return Intl.message(
      'No advertisements',
      name: 'premiumFeatureNoAds',
      desc: '',
      args: [],
    );
  }

  /// `Unlock all AI tools`
  String get premiumFeatureAiTools {
    return Intl.message(
      'Unlock all AI tools',
      name: 'premiumFeatureAiTools',
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

  /// `MOST POPULAR`
  String get popular {
    return Intl.message('MOST POPULAR', name: 'popular', desc: '', args: []);
  }

  /// `Premium upgrade successful!`
  String get purchaseSuccess {
    return Intl.message(
      'Premium upgrade successful!',
      name: 'purchaseSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Could not connect to store.`
  String get purchaseErrorStoreConnection {
    return Intl.message(
      'Could not connect to store.',
      name: 'purchaseErrorStoreConnection',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade to Premium`
  String get upgradeToPremium {
    return Intl.message(
      'Upgrade to Premium',
      name: 'upgradeToPremium',
      desc: '',
      args: [],
    );
  }

  /// `Premium Plan`
  String get premiumPlan {
    return Intl.message(
      'Premium Plan',
      name: 'premiumPlan',
      desc: '',
      args: [],
    );
  }

  /// `Free Plan`
  String get freePlan {
    return Intl.message('Free Plan', name: 'freePlan', desc: '', args: []);
  }

  /// `Current Plan`
  String get currentPlan {
    return Intl.message(
      'Current Plan',
      name: 'currentPlan',
      desc: '',
      args: [],
    );
  }

  /// `Included in Lifetime`
  String get includedInLifetime {
    return Intl.message(
      'Included in Lifetime',
      name: 'includedInLifetime',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Premium`
  String get paywallWelcomeTitle {
    return Intl.message(
      'Welcome to Premium',
      name: 'paywallWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unlock the full potential of your gallery with AI-powered tools and an ad-free experience.`
  String get paywallWelcomeSubtitle {
    return Intl.message(
      'Unlock the full potential of your gallery with AI-powered tools and an ad-free experience.',
      name: 'paywallWelcomeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Free Version`
  String get continueWithFreeVersion {
    return Intl.message(
      'Continue with Free Version',
      name: 'continueWithFreeVersion',
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

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Version {version}`
  String appVersion(Object version) {
    return Intl.message(
      'Version $version',
      name: 'appVersion',
      desc: '',
      args: [version],
    );
  }

  /// `Twinfix is a powerful tool designed to help you organize and clean up your photo gallery with ease using AI.`
  String get aboutDescription {
    return Intl.message(
      'Twinfix is a powerful tool designed to help you organize and clean up your photo gallery with ease using AI.',
      name: 'aboutDescription',
      desc: '',
      args: [],
    );
  }

  /// `Key Features`
  String get featuresTitle {
    return Intl.message(
      'Key Features',
      name: 'featuresTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fast Scanning`
  String get featureScan {
    return Intl.message(
      'Fast Scanning',
      name: 'featureScan',
      desc: '',
      args: [],
    );
  }

  /// `Efficient Cleaning`
  String get featureClean {
    return Intl.message(
      'Efficient Cleaning',
      name: 'featureClean',
      desc: '',
      args: [],
    );
  }

  /// `Modern User Interface`
  String get featureModernUI {
    return Intl.message(
      'Modern User Interface',
      name: 'featureModernUI',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
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

  /// `Contact Us`
  String get footerTitle {
    return Intl.message('Contact Us', name: 'footerTitle', desc: '', args: []);
  }

  /// `Storage almost full!`
  String get memoryWarning {
    return Intl.message(
      'Storage almost full!',
      name: 'memoryWarning',
      desc: '',
      args: [],
    );
  }

  /// `Storage almost full ({percent}%), clean up now!`
  String storageAlmostFull(Object percent) {
    return Intl.message(
      'Storage almost full ($percent%), clean up now!',
      name: 'storageAlmostFull',
      desc: '',
      args: [percent],
    );
  }

  /// `Failed to load storage information.`
  String get failedToLoadStorageInfo {
    return Intl.message(
      'Failed to load storage information.',
      name: 'failedToLoadStorageInfo',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load deletion history.`
  String get failedToLoadHistory {
    return Intl.message(
      'Failed to load deletion history.',
      name: 'failedToLoadHistory',
      desc: '',
      args: [],
    );
  }

  /// `Media Timeline`
  String get mediaTimeline {
    return Intl.message(
      'Media Timeline',
      name: 'mediaTimeline',
      desc: '',
      args: [],
    );
  }

  /// `View your media categorized by time.`
  String get mediaTimelineDescription {
    return Intl.message(
      'View your media categorized by time.',
      name: 'mediaTimelineDescription',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get timelineDay {
    return Intl.message('Day', name: 'timelineDay', desc: '', args: []);
  }

  /// `Month`
  String get timelineMonth {
    return Intl.message('Month', name: 'timelineMonth', desc: '', args: []);
  }

  /// `Year`
  String get timelineYear {
    return Intl.message('Year', name: 'timelineYear', desc: '', args: []);
  }

  /// `Home Screen Widget`
  String get homeWidgetSuggestionTitle {
    return Intl.message(
      'Home Screen Widget',
      name: 'homeWidgetSuggestionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add widget to home screen for quick access and storage tracking.`
  String get homeWidgetSuggestionSubtitle {
    return Intl.message(
      'Add widget to home screen for quick access and storage tracking.',
      name: 'homeWidgetSuggestionSubtitle',
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

  /// `I understand the consequences and want to delete my account`
  String get iUnderstandDeleteConsequences {
    return Intl.message(
      'I understand the consequences and want to delete my account',
      name: 'iUnderstandDeleteConsequences',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message('Information', name: 'information', desc: '', args: []);
  }

  /// `Deselect All`
  String get deselectAll {
    return Intl.message(
      'Deselect All',
      name: 'deselectAll',
      desc: '',
      args: [],
    );
  }

  /// `{percent}% Used`
  String storageUsedPercent(Object percent) {
    return Intl.message(
      '$percent% Used',
      name: 'storageUsedPercent',
      desc: '',
      args: [percent],
    );
  }

  /// `Profile Settings`
  String get profileSettings {
    return Intl.message(
      'Profile Settings',
      name: 'profileSettings',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? All your data will be permanently deleted.`
  String get deleteAccountConfirm {
    return Intl.message(
      'Are you sure you want to delete your account? All your data will be permanently deleted.',
      name: 'deleteAccountConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccountWarningTitle {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccountWarningTitle',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone. All your data and personal information will be permanently deleted from our system.\n\nImportant: Deleting your account will NOT automatically cancel active subscriptions. Please manage and cancel your subscriptions in the app store before proceeding to avoid unexpected charges.`
  String get deleteAccountWarningMessage {
    return Intl.message(
      'This action cannot be undone. All your data and personal information will be permanently deleted from our system.\n\nImportant: Deleting your account will NOT automatically cancel active subscriptions. Please manage and cancel your subscriptions in the app store before proceeding to avoid unexpected charges.',
      name: 'deleteAccountWarningMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorTitle {
    return Intl.message('Error', name: 'errorTitle', desc: '', args: []);
  }

  /// `Invalid or expired token.`
  String get invalidTokenOrExpired {
    return Intl.message(
      'Invalid or expired token.',
      name: 'invalidTokenOrExpired',
      desc: '',
      args: [],
    );
  }

  /// `Verification successful!`
  String get verificationSuccess {
    return Intl.message(
      'Verification successful!',
      name: 'verificationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get unknownError {
    return Intl.message(
      'An unknown error occurred.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Please wait while we are redirecting you...`
  String get pleaseWaitWhileWeAreRedirectingYou {
    return Intl.message(
      'Please wait while we are redirecting you...',
      name: 'pleaseWaitWhileWeAreRedirectingYou',
      desc: '',
      args: [],
    );
  }

  /// `Please double-check one last time!\nPhotos will be moved to the device's Trash and can be recovered within 30 days.`
  String get delete_confirm_message_trash {
    return Intl.message(
      'Please double-check one last time!\nPhotos will be moved to the device\'s Trash and can be recovered within 30 days.',
      name: 'delete_confirm_message_trash',
      desc: '',
      args: [],
    );
  }

  /// `Please double-check one last time!\nThis action cannot be undone. Photos will be permanently deleted from the device.`
  String get delete_confirm_message_permanent {
    return Intl.message(
      'Please double-check one last time!\nThis action cannot be undone. Photos will be permanently deleted from the device.',
      name: 'delete_confirm_message_permanent',
      desc: '',
      args: [],
    );
  }

  /// `Tap to select, long press to choose another image`
  String get customThemeDescription {
    return Intl.message(
      'Tap to select, long press to choose another image',
      name: 'customThemeDescription',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get bgNone {
    return Intl.message('None', name: 'bgNone', desc: '', args: []);
  }

  /// `Nature 1`
  String get bgNature1 {
    return Intl.message('Nature 1', name: 'bgNature1', desc: '', args: []);
  }

  /// `Nature 2`
  String get bgNature2 {
    return Intl.message('Nature 2', name: 'bgNature2', desc: '', args: []);
  }

  /// `Nature 3`
  String get bgNature3 {
    return Intl.message('Nature 3', name: 'bgNature3', desc: '', args: []);
  }

  /// `Nature 4`
  String get bgNature4 {
    return Intl.message('Nature 4', name: 'bgNature4', desc: '', args: []);
  }

  /// `Custom`
  String get bgCustom {
    return Intl.message('Custom', name: 'bgCustom', desc: '', args: []);
  }

  /// `Scanning photos...`
  String get notifScanningTitle {
    return Intl.message(
      'Scanning photos...',
      name: 'notifScanningTitle',
      desc: '',
      args: [],
    );
  }

  /// `{current}/{total} photos scanned`
  String notifScanningBody(Object current, Object total) {
    return Intl.message(
      '$current/$total photos scanned',
      name: 'notifScanningBody',
      desc: '',
      args: [current, total],
    );
  }

  /// `Found {count} duplicate photos. Tap to review.`
  String notifScanCompleteDuplicates(Object count) {
    return Intl.message(
      'Found $count duplicate photos. Tap to review.',
      name: 'notifScanCompleteDuplicates',
      desc: '',
      args: [count],
    );
  }

  /// `Found {count} blurry photos. Tap to review.`
  String notifScanCompleteBlurry(Object count) {
    return Intl.message(
      'Found $count blurry photos. Tap to review.',
      name: 'notifScanCompleteBlurry',
      desc: '',
      args: [count],
    );
  }

  /// `Found {count} documents. Tap to review.`
  String notifScanCompleteDocuments(Object count) {
    return Intl.message(
      'Found $count documents. Tap to review.',
      name: 'notifScanCompleteDocuments',
      desc: '',
      args: [count],
    );
  }

  /// `Found {count} photos with GPS data. Tap to review.`
  String notifScanCompleteGPS(Object count) {
    return Intl.message(
      'Found $count photos with GPS data. Tap to review.',
      name: 'notifScanCompleteGPS',
      desc: '',
      args: [count],
    );
  }

  /// `Scan complete!`
  String get notifScanCompleteTitle {
    return Intl.message(
      'Scan complete!',
      name: 'notifScanCompleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `No issues found. Your gallery is clean!`
  String get notifScanCompleteNone {
    return Intl.message(
      'No issues found. Your gallery is clean!',
      name: 'notifScanCompleteNone',
      desc: '',
      args: [],
    );
  }

  /// `Enable Notifications`
  String get enableNotification {
    return Intl.message(
      'Enable Notifications',
      name: 'enableNotification',
      desc: '',
      args: [],
    );
  }

  /// `Receive scan progress and completion alerts.`
  String get enableNotificationDescription {
    return Intl.message(
      'Receive scan progress and completion alerts.',
      name: 'enableNotificationDescription',
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
