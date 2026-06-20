// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(version) => "Version ${version}";

  static String m1(num, unit, size) =>
      "Successfully cleaned ${num} ${unit} (${size})";

  static String m2(color) => "Copied ${color} to clipboard";

  static String m3(badgeName) => "You just earned the \"${badgeName}\" badge!";

  static String m4(count) => "You just earned ${count} new badges!";

  static String m5(email) =>
      "Could not open email app. Support email: ${email}";

  static String m6(count) => "Delete (${count})";

  static String m7(count) => "Deleted ${count} items";

  static String m8(count) => "Detected ${count} duplicate groups";

  static String m9(message) => "Error: ${message}";

  static String m10(index, count) => "Group ${index} (${count} photos)";

  static String m11(level) => "Level ${level}";

  static String m12(count) => "Found ${count} blurry photos. Tap to review.";

  static String m13(count) => "Found ${count} documents. Tap to review.";

  static String m14(count) => "Found ${count} duplicate photos. Tap to review.";

  static String m15(count) =>
      "Found ${count} photos with GPS data. Tap to review.";

  static String m16(current, total) => "${current}/${total} photos scanned";

  static String m17(percent) =>
      "Storage almost full (${percent}%), clean up now!";

  static String m18(percent) => "${percent}% Used";

  static String m19(days) => "${days} Days Streak";

  static String m20(count) => "${count} photos";

  static String m21(count, mediaType) =>
      "Total: ${count} ${mediaType} (last 7 days)";

  static String m22(count, mediaType) =>
      "Total: ${count} ${mediaType} (last 7 weeks)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfix is a powerful tool designed to help you organize and clean up your photo gallery with ease using AI.",
    ),
    "aboutUs": MessageLookupByLibrary.simpleMessage("About Us"),
    "accountSyncActive": MessageLookupByLibrary.simpleMessage(
      "Account sync active",
    ),
    "activity": MessageLookupByLibrary.simpleMessage("Activity"),
    "activityDetailTitle": MessageLookupByLibrary.simpleMessage(
      "Cleaning Activity",
    ),
    "addWaterMark": MessageLookupByLibrary.simpleMessage("Add Watermark"),
    "addWaterMarkDescription": MessageLookupByLibrary.simpleMessage(
      "Add watermark to photos.",
    ),
    "allBadges": MessageLookupByLibrary.simpleMessage("All Badges"),
    "alreadyHaveAccountLogin": MessageLookupByLibrary.simpleMessage(
      "Already have an account? Login",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Photo Duplicate Cleaner",
    ),
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "appVersion": m0,
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "arrow": MessageLookupByLibrary.simpleMessage("Arrow"),
    "autoDetectColors": MessageLookupByLibrary.simpleMessage(
      "Auto Detect Colors",
    ),
    "awesome": MessageLookupByLibrary.simpleMessage("Awesome!"),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "backgroundMode": MessageLookupByLibrary.simpleMessage("Background mode"),
    "backgroundStyle": MessageLookupByLibrary.simpleMessage("Background Style"),
    "badgeAiCleanerDesc": MessageLookupByLibrary.simpleMessage(
      "Use the automatic cleanup feature.",
    ),
    "badgeAiCleanerName": MessageLookupByLibrary.simpleMessage("AI Assistant"),
    "badgeBlurry10Desc": MessageLookupByLibrary.simpleMessage(
      "Delete 10 blurry photos.",
    ),
    "badgeBlurry10Name": MessageLookupByLibrary.simpleMessage("Blur Hunter"),
    "badgeBlurry200Desc": MessageLookupByLibrary.simpleMessage(
      "Delete 200 blurry photos.",
    ),
    "badgeBlurry200Name": MessageLookupByLibrary.simpleMessage(
      "Blur Destroyer",
    ),
    "badgeBlurryKillerDesc": MessageLookupByLibrary.simpleMessage(
      "Delete 50 blurry photos.",
    ),
    "badgeBlurryKillerName": MessageLookupByLibrary.simpleMessage(
      "Blur Killer",
    ),
    "badgeCleaner1000Desc": MessageLookupByLibrary.simpleMessage(
      "Delete a total of 1000 photos.",
    ),
    "badgeCleaner1000Name": MessageLookupByLibrary.simpleMessage(
      "Photo Shredder",
    ),
    "badgeCleaner100Desc": MessageLookupByLibrary.simpleMessage(
      "Delete a total of 100 photos.",
    ),
    "badgeCleaner100Name": MessageLookupByLibrary.simpleMessage(
      "Expert Cleaner",
    ),
    "badgeCleaner10Desc": MessageLookupByLibrary.simpleMessage(
      "Delete a total of 10 photos.",
    ),
    "badgeCleaner10Name": MessageLookupByLibrary.simpleMessage(
      "Apprentice Cleaner",
    ),
    "badgeDuplicate100Desc": MessageLookupByLibrary.simpleMessage(
      "Delete 100 duplicate photos.",
    ),
    "badgeDuplicate100Name": MessageLookupByLibrary.simpleMessage(
      "Duplicate Master",
    ),
    "badgeDuplicate20Desc": MessageLookupByLibrary.simpleMessage(
      "Delete 20 duplicate photos.",
    ),
    "badgeDuplicate20Name": MessageLookupByLibrary.simpleMessage(
      "Duplicate Hunter",
    ),
    "badgeFirstCleanDesc": MessageLookupByLibrary.simpleMessage(
      "Delete your very first photos.",
    ),
    "badgeFirstCleanName": MessageLookupByLibrary.simpleMessage("First Clean"),
    "badgeFreed100mbDesc": MessageLookupByLibrary.simpleMessage(
      "Delete a total of 200 photos.",
    ),
    "badgeFreed100mbName": MessageLookupByLibrary.simpleMessage(
      "Storage Novice",
    ),
    "badgeFreed10gbDesc": MessageLookupByLibrary.simpleMessage(
      "Delete a total of 5000 photos.",
    ),
    "badgeFreed10gbName": MessageLookupByLibrary.simpleMessage("Disk Legend"),
    "badgeFreed5gbDesc": MessageLookupByLibrary.simpleMessage(
      "Delete a total of 2000 photos.",
    ),
    "badgeFreed5gbName": MessageLookupByLibrary.simpleMessage("Storage Hero"),
    "badgeGigaKingDesc": MessageLookupByLibrary.simpleMessage(
      "Delete a total of 500 photos.",
    ),
    "badgeGigaKingName": MessageLookupByLibrary.simpleMessage(
      "Cleaning Master",
    ),
    "badgeNewbieDesc": MessageLookupByLibrary.simpleMessage(
      "Delete your first photo and start the journey to free your storage.",
    ),
    "badgeNewbieName": MessageLookupByLibrary.simpleMessage("Newbie Cleaner"),
    "badgePerfectionistDesc": MessageLookupByLibrary.simpleMessage(
      "Delete over 80% of blurry photos on your device.",
    ),
    "badgePerfectionistName": MessageLookupByLibrary.simpleMessage(
      "Perfectionist",
    ),
    "badgeSpeedCleanDesc": MessageLookupByLibrary.simpleMessage(
      "Delete 50 photos in a single session.",
    ),
    "badgeSpeedCleanName": MessageLookupByLibrary.simpleMessage(
      "Speed Cleaner",
    ),
    "badgeStreak3Desc": MessageLookupByLibrary.simpleMessage(
      "Clean up for 3 consecutive days.",
    ),
    "badgeStreak3Name": MessageLookupByLibrary.simpleMessage("Dedicated"),
    "badgeStreak7Desc": MessageLookupByLibrary.simpleMessage(
      "Clean up for 7 consecutive days.",
    ),
    "badgeStreak7Name": MessageLookupByLibrary.simpleMessage("Never Give Up"),
    "badges": MessageLookupByLibrary.simpleMessage("Badges"),
    "becomeOneOfUs": MessageLookupByLibrary.simpleMessage("Become one of us"),
    "bgCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "bgNature1": MessageLookupByLibrary.simpleMessage("Nature 1"),
    "bgNature2": MessageLookupByLibrary.simpleMessage("Nature 2"),
    "bgNature3": MessageLookupByLibrary.simpleMessage("Nature 3"),
    "bgNature4": MessageLookupByLibrary.simpleMessage("Nature 4"),
    "bgNone": MessageLookupByLibrary.simpleMessage("None"),
    "blur": MessageLookupByLibrary.simpleMessage("Blur"),
    "blurFace": MessageLookupByLibrary.simpleMessage("Blur Face"),
    "blurFaceDescription": MessageLookupByLibrary.simpleMessage(
      "Blur face in photos.",
    ),
    "blurryDeleted": MessageLookupByLibrary.simpleMessage("Blurry Deleted"),
    "blurryPhotos": MessageLookupByLibrary.simpleMessage("Blurry Photos"),
    "blurryPhotosDescription": MessageLookupByLibrary.simpleMessage(
      "Detect and clean out photos that are blurry or have motion blur.",
    ),
    "brightness": MessageLookupByLibrary.simpleMessage("Brightness"),
    "calculatingProgress": MessageLookupByLibrary.simpleMessage(
      "Calculating...",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelMonthlyMessage": MessageLookupByLibrary.simpleMessage(
      "You\'ve successfully upgraded to Lifetime! Since you previously had a Monthly subscription, please remember to cancel it in the App Store/Google Play to avoid being charged for both.",
    ),
    "cancelMonthlyTitle": MessageLookupByLibrary.simpleMessage(
      "Action Required",
    ),
    "changeOpacity": MessageLookupByLibrary.simpleMessage("Change opacity"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "changePasswordSuccess": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "chinese": MessageLookupByLibrary.simpleMessage("Chinese"),
    "circle": MessageLookupByLibrary.simpleMessage("Circle"),
    "cleaned": MessageLookupByLibrary.simpleMessage("Cleaned"),
    "cleanedSpaceSuccess": m1,
    "clearSelection": MessageLookupByLibrary.simpleMessage("Clear selection"),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "colorCopiedFailure": MessageLookupByLibrary.simpleMessage(
      "Failed to copy color",
    ),
    "colorCopiedSuccess": m2,
    "confirmDelete": MessageLookupByLibrary.simpleMessage("Confirm delete"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Confirm password is required",
    ),
    "confirmnoMorePhotosToDelete": MessageLookupByLibrary.simpleMessage(
      "No more photos to delete",
    ),
    "congratsBadgeMessage": m3,
    "congratsBadgeTitle": MessageLookupByLibrary.simpleMessage("New Badge!"),
    "congratsMultipleBadgesMessage": m4,
    "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "continueWithFreeVersion": MessageLookupByLibrary.simpleMessage(
      "Continue with Free Version",
    ),
    "contrast": MessageLookupByLibrary.simpleMessage("Contrast"),
    "contributionGraph": MessageLookupByLibrary.simpleMessage(
      "Contribution graph",
    ),
    "convertImageFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to convert image",
    ),
    "couldNotOpenEmailApp": m5,
    "countAsc": MessageLookupByLibrary.simpleMessage("Count Ascending"),
    "countDesc": MessageLookupByLibrary.simpleMessage("Count Descending"),
    "createNewImage": MessageLookupByLibrary.simpleMessage("Create New Image"),
    "crop": MessageLookupByLibrary.simpleMessage("Crop"),
    "currentPlan": MessageLookupByLibrary.simpleMessage("Current Plan"),
    "custom1": MessageLookupByLibrary.simpleMessage("Custom 1"),
    "custom2": MessageLookupByLibrary.simpleMessage("Custom 2"),
    "custom3": MessageLookupByLibrary.simpleMessage("Custom 3"),
    "customThemeDescription": MessageLookupByLibrary.simpleMessage(
      "Tap to select, long press to choose another image",
    ),
    "dashDotLine": MessageLookupByLibrary.simpleMessage("Dash-dot line"),
    "dashLine": MessageLookupByLibrary.simpleMessage("Dash line"),
    "dataSynchronizedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Data synchronized successfully",
    ),
    "dateAsc": MessageLookupByLibrary.simpleMessage("Date Ascending"),
    "dateDesc": MessageLookupByLibrary.simpleMessage("Date Descending"),
    "days": MessageLookupByLibrary.simpleMessage("Days"),
    "defaultErrorMessage": MessageLookupByLibrary.simpleMessage(
      "An error occurred. Please try again.",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account? All your data will be permanently deleted.",
    ),
    "deleteAccountWarningMessage": MessageLookupByLibrary.simpleMessage(
      "This action cannot be undone. All your data and personal information will be permanently deleted from our system.\n\nImportant: Deleting your account will NOT automatically cancel active subscriptions. Please manage and cancel your subscriptions in the app store before proceeding to avoid unexpected charges.",
    ),
    "deleteAccountWarningTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Account",
    ),
    "deleteSelected": m6,
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Please double-check one last time!\nThis action cannot be undone.",
    ),
    "delete_confirm_message_permanent": MessageLookupByLibrary.simpleMessage(
      "Please double-check one last time!\nThis action cannot be undone. Photos will be permanently deleted from the device.",
    ),
    "delete_confirm_message_trash": MessageLookupByLibrary.simpleMessage(
      "Please double-check one last time!\nPhotos will be moved to the device\'s Trash and can be recovered within 30 days.",
    ),
    "deletedItemsCount": m7,
    "density": MessageLookupByLibrary.simpleMessage("Density"),
    "deselectAll": MessageLookupByLibrary.simpleMessage("Deselect All"),
    "detectedDuplicateGroups": m8,
    "deviceIsClean": MessageLookupByLibrary.simpleMessage(
      "Your device is very clean.",
    ),
    "document": MessageLookupByLibrary.simpleMessage("Document Detection"),
    "documentDescription": MessageLookupByLibrary.simpleMessage(
      "Identify and manage images containing text.",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Got it"),
    "duplicates": MessageLookupByLibrary.simpleMessage("Duplicates"),
    "earned": MessageLookupByLibrary.simpleMessage("Unlocked"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editAnotherPhoto": MessageLookupByLibrary.simpleMessage(
      "Edit another photo",
    ),
    "editDescription": MessageLookupByLibrary.simpleMessage("Edit image"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Email is already in use.",
    ),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Invalid email format",
    ),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage(
      "Email is not confirmed.",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "emoji": MessageLookupByLibrary.simpleMessage("Emoji"),
    "enableNotification": MessageLookupByLibrary.simpleMessage(
      "Enable Notifications",
    ),
    "enableNotificationDescription": MessageLookupByLibrary.simpleMessage(
      "Receive scan progress and completion alerts.",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterWatermarkText": MessageLookupByLibrary.simpleMessage(
      "Enter watermark text",
    ),
    "eraser": MessageLookupByLibrary.simpleMessage("Eraser"),
    "error": m9,
    "errorEmailNotFound": MessageLookupByLibrary.simpleMessage(
      "Error email not found",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Error"),
    "error_unable_to_play_media": MessageLookupByLibrary.simpleMessage(
      "Unable to play media",
    ),
    "error_unsupported_media_type": MessageLookupByLibrary.simpleMessage(
      "Unsupported media type",
    ),
    "exposure": MessageLookupByLibrary.simpleMessage("Exposure"),
    "eyeBar": MessageLookupByLibrary.simpleMessage("Eye Bar"),
    "fade": MessageLookupByLibrary.simpleMessage("Fade"),
    "failedToChangePassword": MessageLookupByLibrary.simpleMessage(
      "Failed to change password. Please try again.",
    ),
    "failedToLoadColors": MessageLookupByLibrary.simpleMessage(
      "Failed to load colors",
    ),
    "failedToLoadHistory": MessageLookupByLibrary.simpleMessage(
      "Failed to load deletion history.",
    ),
    "failedToLoadProfile": MessageLookupByLibrary.simpleMessage(
      "Failed to load user profile. Please check your connection.",
    ),
    "failedToLoadStorageInfo": MessageLookupByLibrary.simpleMessage(
      "Failed to load storage information.",
    ),
    "failedToRegister": MessageLookupByLibrary.simpleMessage(
      "Registration failed. Please try again.",
    ),
    "failedToSaveImage": MessageLookupByLibrary.simpleMessage(
      "Failed to save image. Please try again.",
    ),
    "failedToSendResetLink": MessageLookupByLibrary.simpleMessage(
      "Failed to send reset link",
    ),
    "featureClean": MessageLookupByLibrary.simpleMessage("Efficient Cleaning"),
    "featureModernUI": MessageLookupByLibrary.simpleMessage(
      "Modern User Interface",
    ),
    "featureScan": MessageLookupByLibrary.simpleMessage("Fast Scanning"),
    "featuresTitle": MessageLookupByLibrary.simpleMessage("Key Features"),
    "feedbackContentHint": MessageLookupByLibrary.simpleMessage(
      "Enter details of the bug or improvement suggestion here...",
    ),
    "feedbackContentLabel": MessageLookupByLibrary.simpleMessage(
      "Detailed Content",
    ),
    "feedbackContentRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter detailed content",
    ),
    "feedbackTitleHint": MessageLookupByLibrary.simpleMessage(
      "Enter feedback title...",
    ),
    "feedbackTitleLabel": MessageLookupByLibrary.simpleMessage("Title"),
    "feedbackTitleRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter title",
    ),
    "feedbackTypeBug": MessageLookupByLibrary.simpleMessage("Bug"),
    "feedbackTypeImprovement": MessageLookupByLibrary.simpleMessage(
      "Improvement",
    ),
    "feedbackTypeLabel": MessageLookupByLibrary.simpleMessage("Feedback Type"),
    "feedbackTypeOther": MessageLookupByLibrary.simpleMessage("Other"),
    "feedbackTypeQuestion": MessageLookupByLibrary.simpleMessage("Question"),
    "file": MessageLookupByLibrary.simpleMessage("file"),
    "files": MessageLookupByLibrary.simpleMessage("files"),
    "fill": MessageLookupByLibrary.simpleMessage("Fill"),
    "filter": MessageLookupByLibrary.simpleMessage("Filter"),
    "finish": MessageLookupByLibrary.simpleMessage("Finish"),
    "flip": MessageLookupByLibrary.simpleMessage("Flip"),
    "fontScale": MessageLookupByLibrary.simpleMessage("Font scale"),
    "footerTitle": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "forgotPasswordDescription": MessageLookupByLibrary.simpleMessage(
      "Enter your email address and we will send you a link to reset your password.",
    ),
    "forgotPasswordQuestion": MessageLookupByLibrary.simpleMessage(
      "Forgot Password?",
    ),
    "forgotPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Forgot Password",
    ),
    "freePlan": MessageLookupByLibrary.simpleMessage("Free Plan"),
    "freestyle": MessageLookupByLibrary.simpleMessage("Freestyle"),
    "freestyleArrowEnd": MessageLookupByLibrary.simpleMessage(
      "Freestyle arrow end",
    ),
    "freestyleArrowStart": MessageLookupByLibrary.simpleMessage(
      "Freestyle arrow start",
    ),
    "freestyleArrowStartEnd": MessageLookupByLibrary.simpleMessage(
      "Freestyle arrow start-end",
    ),
    "fri": MessageLookupByLibrary.simpleMessage("Fri"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "galleryManager": MessageLookupByLibrary.simpleMessage("Gallery Manager"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "glasses": MessageLookupByLibrary.simpleMessage("Glasses"),
    "googleLoginFailed": MessageLookupByLibrary.simpleMessage(
      "Google sign in failed. Please try again.",
    ),
    "googleLoginSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Google sign in successfully!",
    ),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "GPS location data removed and saved as a new copy.",
    ),
    "groupIndex": m10,
    "hexagon": MessageLookupByLibrary.simpleMessage("Hexagon"),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "historyEarlier": MessageLookupByLibrary.simpleMessage("Earlier"),
    "historyLast7Days": MessageLookupByLibrary.simpleMessage("Last 7 Days"),
    "historyThisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
    "historyToday": MessageLookupByLibrary.simpleMessage("Today"),
    "historyYesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
    "homeWidgetDialogSubtitle": MessageLookupByLibrary.simpleMessage(
      "You can add Twinfix widget to your home screen to quickly monitor device storage:",
    ),
    "homeWidgetDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Add Twinfix Widget",
    ),
    "homeWidgetStep1": MessageLookupByLibrary.simpleMessage(
      "1. Go to your phone\'s home screen.",
    ),
    "homeWidgetStep2": MessageLookupByLibrary.simpleMessage(
      "2. Touch and hold any empty space on the screen.",
    ),
    "homeWidgetStep3": MessageLookupByLibrary.simpleMessage(
      "3. Select \"Widgets\".",
    ),
    "homeWidgetStep4": MessageLookupByLibrary.simpleMessage(
      "4. Find Twinfix and drag the widget to the screen.",
    ),
    "homeWidgetSuggestionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Add widget to home screen for quick access and storage tracking.",
    ),
    "homeWidgetSuggestionTitle": MessageLookupByLibrary.simpleMessage(
      "Home Screen Widget",
    ),
    "howToEarn": MessageLookupByLibrary.simpleMessage("How to earn?"),
    "howToEarnDescription": MessageLookupByLibrary.simpleMessage(
      "You need to perform more system cleaning steps or invite friends to get this prestigious badge.",
    ),
    "hue": MessageLookupByLibrary.simpleMessage("Hue"),
    "iUnderstandDeleteConsequences": MessageLookupByLibrary.simpleMessage(
      "I understand the consequences and want to delete my account",
    ),
    "imageSaved": MessageLookupByLibrary.simpleMessage(
      "Image saved successfully!",
    ),
    "includedInLifetime": MessageLookupByLibrary.simpleMessage(
      "Included in Lifetime",
    ),
    "information": MessageLookupByLibrary.simpleMessage("Information"),
    "inputHintText": MessageLookupByLibrary.simpleMessage("Enter text"),
    "intensity": MessageLookupByLibrary.simpleMessage("Intensity"),
    "invalidTokenOrExpired": MessageLookupByLibrary.simpleMessage(
      "Invalid or expired token.",
    ),
    "itemsDeleted": MessageLookupByLibrary.simpleMessage("Items Deleted"),
    "japanese": MessageLookupByLibrary.simpleMessage("Japanese"),
    "keepLocalData": MessageLookupByLibrary.simpleMessage("Keep Local Data"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "level": m11,
    "line": MessageLookupByLibrary.simpleMessage("Line"),
    "lineWidth": MessageLookupByLibrary.simpleMessage("Line width"),
    "livePhotos": MessageLookupByLibrary.simpleMessage("Live Photos"),
    "livePhotosDescription": MessageLookupByLibrary.simpleMessage(
      "Live Photos are animated photos that can play short videos. Clean them up to free up storage.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Login failed. Please try again.",
    ),
    "loginSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Login successfully!",
    ),
    "loginToSync": MessageLookupByLibrary.simpleMessage(
      "Log in to sync your progress across devices",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Log out"),
    "longPressToSelectAll": MessageLookupByLibrary.simpleMessage(
      "Long press to select all",
    ),
    "luminance": MessageLookupByLibrary.simpleMessage("Luminance"),
    "manageSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Manage Subscriptions",
    ),
    "mediaTimeline": MessageLookupByLibrary.simpleMessage("Media Timeline"),
    "mediaTimelineDescription": MessageLookupByLibrary.simpleMessage(
      "View your media categorized by time.",
    ),
    "media_audio": MessageLookupByLibrary.simpleMessage("Audio"),
    "media_other": MessageLookupByLibrary.simpleMessage("All"),
    "media_photo": MessageLookupByLibrary.simpleMessage("Photo"),
    "media_type_selection": MessageLookupByLibrary.simpleMessage(
      "Media Type Selection",
    ),
    "media_video": MessageLookupByLibrary.simpleMessage("Video"),
    "memoryWarning": MessageLookupByLibrary.simpleMessage(
      "Storage almost full!",
    ),
    "mergeData": MessageLookupByLibrary.simpleMessage("Merge Data"),
    "mon": MessageLookupByLibrary.simpleMessage("Mon"),
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "moveAndZoom": MessageLookupByLibrary.simpleMessage("Zoom"),
    "nameLength": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 2 characters",
    ),
    "nameRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noAccountRegister": MessageLookupByLibrary.simpleMessage(
      "Do not have an account? Register",
    ),
    "noActivity": MessageLookupByLibrary.simpleMessage(
      "No cleaning activity yet",
    ),
    "noBadgesEarnedYet": MessageLookupByLibrary.simpleMessage(
      "No badges earned yet",
    ),
    "noDocumentsFound": MessageLookupByLibrary.simpleMessage(
      "No images with text found.",
    ),
    "noEmailProvided": MessageLookupByLibrary.simpleMessage(
      "No email provided",
    ),
    "noFacesDetected": MessageLookupByLibrary.simpleMessage(
      "No faces detected in this photo.",
    ),
    "noFilter": MessageLookupByLibrary.simpleMessage("No Filter"),
    "noPhotosWithGPSFound": MessageLookupByLibrary.simpleMessage(
      "No images with location data found.",
    ),
    "notEarned": MessageLookupByLibrary.simpleMessage("Requirements not met"),
    "notLoggedIn": MessageLookupByLibrary.simpleMessage(
      "Not logged in (Guest)",
    ),
    "nothingFound": MessageLookupByLibrary.simpleMessage("Nothing found"),
    "notifScanCompleteBlurry": m12,
    "notifScanCompleteDocuments": m13,
    "notifScanCompleteDuplicates": m14,
    "notifScanCompleteGPS": m15,
    "notifScanCompleteNone": MessageLookupByLibrary.simpleMessage(
      "No issues found. Your gallery is clean!",
    ),
    "notifScanCompleteTitle": MessageLookupByLibrary.simpleMessage(
      "Scan complete!",
    ),
    "notifScanningBody": m16,
    "notifScanningTitle": MessageLookupByLibrary.simpleMessage(
      "Scanning photos...",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "oldPassword": MessageLookupByLibrary.simpleMessage("Old Password"),
    "onboardingDemoSwipeLeft": MessageLookupByLibrary.simpleMessage(
      "Swipe Left to Delete",
    ),
    "onboardingDemoSwipeRight": MessageLookupByLibrary.simpleMessage(
      "Swipe Right to Keep",
    ),
    "onboardingStartScan": MessageLookupByLibrary.simpleMessage(
      "Start Scanning",
    ),
    "onboardingWelcomeTitle": MessageLookupByLibrary.simpleMessage(
      "Welcome to Twinfix",
    ),
    "opacity": MessageLookupByLibrary.simpleMessage("Opacity"),
    "openGalleryManager": MessageLookupByLibrary.simpleMessage(
      "Open Gallery Manager",
    ),
    "openGalleryManagerDescription": MessageLookupByLibrary.simpleMessage(
      "If you want to clean manually by media type, go here. Tap the highlighted button to open it.",
    ),
    "openingEmailApp": MessageLookupByLibrary.simpleMessage(
      "Opening email app to send feedback...",
    ),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "packageLifetimeDescription": MessageLookupByLibrary.simpleMessage(
      "One-time purchase, keep forever.",
    ),
    "packageLifetimeTitle": MessageLookupByLibrary.simpleMessage("Lifetime"),
    "packageMonthlyDescription": MessageLookupByLibrary.simpleMessage(
      "Monthly subscription. Cancel anytime.",
    ),
    "packageMonthlyTitle": MessageLookupByLibrary.simpleMessage("1 Month"),
    "paint": MessageLookupByLibrary.simpleMessage("Paint"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters, include uppercase, lowercase, number and special character",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Password is too short",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "paywallSubtitle": MessageLookupByLibrary.simpleMessage(
      "Enjoy all professional features without limits.",
    ),
    "paywallWelcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Unlock the full potential of your gallery with AI-powered tools and an ad-free experience.",
    ),
    "paywallWelcomeTitle": MessageLookupByLibrary.simpleMessage(
      "Welcome to Premium",
    ),
    "perfect": MessageLookupByLibrary.simpleMessage("Perfect!"),
    "permissionDescription": MessageLookupByLibrary.simpleMessage(
      "Twinfix needs access to your photo library to scan and clean duplicate photos.",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage(
      "Permission Required",
    ),
    "personalCustomizeableTheme": MessageLookupByLibrary.simpleMessage(
      "Personalize interface",
    ),
    "personalProcessSync": MessageLookupByLibrary.simpleMessage(
      "Sync cleanup progress",
    ),
    "pixelate": MessageLookupByLibrary.simpleMessage("Pixelate"),
    "pleaseEnterWatermarkText": MessageLookupByLibrary.simpleMessage(
      "Please enter watermark text",
    ),
    "pleaseFillAllFields": MessageLookupByLibrary.simpleMessage(
      "Please fill all fields",
    ),
    "pleaseWaitWhileWeAreRedirectingYou": MessageLookupByLibrary.simpleMessage(
      "Please wait while we are redirecting you...",
    ),
    "polygon": MessageLookupByLibrary.simpleMessage("Polygon"),
    "popular": MessageLookupByLibrary.simpleMessage("MOST POPULAR"),
    "premium": MessageLookupByLibrary.simpleMessage("Premium"),
    "premiumFeatureAiTools": MessageLookupByLibrary.simpleMessage(
      "Unlock all AI tools",
    ),
    "premiumFeatureNoAds": MessageLookupByLibrary.simpleMessage(
      "No advertisements",
    ),
    "premiumPlan": MessageLookupByLibrary.simpleMessage("Premium Plan"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileSettings": MessageLookupByLibrary.simpleMessage("Profile Settings"),
    "progress": MessageLookupByLibrary.simpleMessage("Progress"),
    "purchaseErrorStoreConnection": MessageLookupByLibrary.simpleMessage(
      "Could not connect to store.",
    ),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Purchase failed or was cancelled.",
    ),
    "purchaseSuccess": MessageLookupByLibrary.simpleMessage(
      "Premium upgrade successful!",
    ),
    "ratio": MessageLookupByLibrary.simpleMessage("Ratio"),
    "rectangle": MessageLookupByLibrary.simpleMessage("Rectangle"),
    "redo": MessageLookupByLibrary.simpleMessage("Redo"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerSuccess": MessageLookupByLibrary.simpleMessage(
      "Registration successful",
    ),
    "registerSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Please check your email to verify your account before logging in.",
    ),
    "removeGPS": MessageLookupByLibrary.simpleMessage("Remove GPS"),
    "removeGPSDescription": MessageLookupByLibrary.simpleMessage(
      "Remove GPS information from photos.",
    ),
    "replaceOriginal": MessageLookupByLibrary.simpleMessage("Replace Original"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetLinkSent": MessageLookupByLibrary.simpleMessage(
      "Reset link sent to your email!",
    ),
    "restoreFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Could not restore purchases or you don\'t have a subscription.",
    ),
    "restoreFromCloud": MessageLookupByLibrary.simpleMessage(
      "Restore from Cloud",
    ),
    "restorePurchases": MessageLookupByLibrary.simpleMessage(
      "Restore Purchases",
    ),
    "rotate": MessageLookupByLibrary.simpleMessage("Rotate"),
    "sat": MessageLookupByLibrary.simpleMessage("Sat"),
    "saturation": MessageLookupByLibrary.simpleMessage("Saturation"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saving": MessageLookupByLibrary.simpleMessage("Saving..."),
    "scanLimit": MessageLookupByLibrary.simpleMessage("Scan Limit"),
    "scanLimitAll": MessageLookupByLibrary.simpleMessage("All"),
    "scanLimitWarning": MessageLookupByLibrary.simpleMessage(
      "Scanning all photos may take a long time and use more battery.",
    ),
    "scanResults": MessageLookupByLibrary.simpleMessage("Scan results"),
    "scanningDevice": MessageLookupByLibrary.simpleMessage(
      "Scanning device...",
    ),
    "scanningDocument": MessageLookupByLibrary.simpleMessage(
      "Scanning document...",
    ),
    "screenshots": MessageLookupByLibrary.simpleMessage("Screenshots"),
    "screenshotsDescription": MessageLookupByLibrary.simpleMessage(
      "Screenshots are photos that are not animated. Clean them up to free up storage.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Select all"),
    "selectEmoji": MessageLookupByLibrary.simpleMessage("Select Emoji"),
    "selectTemplate": MessageLookupByLibrary.simpleMessage("Select Template"),
    "sendFeedbackSubtitle": MessageLookupByLibrary.simpleMessage(
      "We would love to hear from you!",
    ),
    "sendFeedbackTitle": MessageLookupByLibrary.simpleMessage(
      "Send us your feedback",
    ),
    "sendResetLink": MessageLookupByLibrary.simpleMessage("Send Reset Link"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "sevenDays": MessageLookupByLibrary.simpleMessage("7 Days"),
    "sevenWeeks": MessageLookupByLibrary.simpleMessage("7 Weeks"),
    "sharpness": MessageLookupByLibrary.simpleMessage("Sharpness"),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign in with Google",
    ),
    "size": MessageLookupByLibrary.simpleMessage("Size"),
    "sizeAsc": MessageLookupByLibrary.simpleMessage("Size Ascending"),
    "sizeDesc": MessageLookupByLibrary.simpleMessage("Size Descending"),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "smallScreenMoreTooltip": MessageLookupByLibrary.simpleMessage("More"),
    "solid": MessageLookupByLibrary.simpleMessage("Solid"),
    "sort": MessageLookupByLibrary.simpleMessage("Sort"),
    "startQuickScan": MessageLookupByLibrary.simpleMessage(
      "Start a quick scan",
    ),
    "startQuickScanDescription": MessageLookupByLibrary.simpleMessage(
      "Use this button to scan your library and detect duplicates in one flow.",
    ),
    "stats": MessageLookupByLibrary.simpleMessage("Stats"),
    "storageAlmostFull": m17,
    "storageUsedPercent": m18,
    "streak": MessageLookupByLibrary.simpleMessage("Streak"),
    "streakDays": m19,
    "streaks": MessageLookupByLibrary.simpleMessage("Streaks"),
    "strokeWidth": MessageLookupByLibrary.simpleMessage("Stroke Width"),
    "submitFeedback": MessageLookupByLibrary.simpleMessage("Submit Feedback"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "sun": MessageLookupByLibrary.simpleMessage("Sun"),
    "syncDataMessage": MessageLookupByLibrary.simpleMessage(
      "We found some local cleaning data from your guest session. Would you like to merge it into your new account?",
    ),
    "syncDataTitle": MessageLookupByLibrary.simpleMessage("Link guest data?"),
    "syncExplainKeepLocalDesc": MessageLookupByLibrary.simpleMessage(
      "Keeps current guest data on this device and overwrites existing cloud data.",
    ),
    "syncExplainMergeDesc": MessageLookupByLibrary.simpleMessage(
      "Combines local guest statistics and achievements with existing account data. You won\'t lose any progress.",
    ),
    "syncExplainRestoreDesc": MessageLookupByLibrary.simpleMessage(
      "Discards current guest session data and restores previous account data from the cloud.",
    ),
    "syncExplainTitle": MessageLookupByLibrary.simpleMessage(
      "What are Sync Options?",
    ),
    "tabDashboard": MessageLookupByLibrary.simpleMessage("Achievements"),
    "tabOtherFeatures": MessageLookupByLibrary.simpleMessage("Other Features"),
    "tabScan": MessageLookupByLibrary.simpleMessage("Scan"),
    "tabSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "tapToChangeStyle": MessageLookupByLibrary.simpleMessage(
      "Tap to change style",
    ),
    "temperature": MessageLookupByLibrary.simpleMessage("Temperature"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "text": MessageLookupByLibrary.simpleMessage("Text"),
    "textAlign": MessageLookupByLibrary.simpleMessage("Align text"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Dark"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Light"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("System"),
    "thu": MessageLookupByLibrary.simpleMessage("Thu"),
    "timelineDay": MessageLookupByLibrary.simpleMessage("Day"),
    "timelineMonth": MessageLookupByLibrary.simpleMessage("Month"),
    "timelineYear": MessageLookupByLibrary.simpleMessage("Year"),
    "toggleFill": MessageLookupByLibrary.simpleMessage("Toggle fill"),
    "tooManyRequests": MessageLookupByLibrary.simpleMessage(
      "Too many requests. Please try again later.",
    ),
    "totalPhotos": m20,
    "totalPhotosLast7Days": m21,
    "totalPhotosLast7Weeks": m22,
    "tue": MessageLookupByLibrary.simpleMessage("Tue"),
    "tune": MessageLookupByLibrary.simpleMessage("Tune"),
    "understood": MessageLookupByLibrary.simpleMessage("GOT IT"),
    "undo": MessageLookupByLibrary.simpleMessage("Undo"),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An unknown error occurred.",
    ),
    "unknownUser": MessageLookupByLibrary.simpleMessage("Unknown User"),
    "upgradeToPremium": MessageLookupByLibrary.simpleMessage(
      "Upgrade to Premium",
    ),
    "userBanned": MessageLookupByLibrary.simpleMessage("User is banned."),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found."),
    "verificationSuccess": MessageLookupByLibrary.simpleMessage(
      "Verification successful!",
    ),
    "vietnamese": MessageLookupByLibrary.simpleMessage("Vietnamese"),
    "viewAllBadges": MessageLookupByLibrary.simpleMessage("View All Badges"),
    "viewDetail": MessageLookupByLibrary.simpleMessage("View detail"),
    "viewFullHistory": MessageLookupByLibrary.simpleMessage(
      "View full history",
    ),
    "watermarkText": MessageLookupByLibrary.simpleMessage("Watermark Text"),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Password is too weak.",
    ),
    "wed": MessageLookupByLibrary.simpleMessage("Wed"),
    "weekShort": MessageLookupByLibrary.simpleMessage("W."),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome Back"),
  };
}
