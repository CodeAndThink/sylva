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

  static String m0(color) => "Copied ${color} to clipboard";

  static String m1(seconds) =>
      "Please wait ${seconds} seconds before sending again";

  static String m2(author) => "Designed by ${author} from Flaticon";

  static String m3(author) => "Designed by ${author} - Magnific.com";

  static String m4(message) => "Error: ${message}";

  static String m5(level) => "Level ${level}";

  static String m6(version) => "Version ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "aboutDescription": MessageLookupByLibrary.simpleMessage(
      "Want to learn more about Sylva? Visit our website for the latest updates, features, and more!",
    ),
    "aboutSylvaDescription": MessageLookupByLibrary.simpleMessage(
      "Sylva is a camera application designed to help you capture and discover the world\'s colors effortlessly.",
    ),
    "aboutUs": MessageLookupByLibrary.simpleMessage("About Us"),
    "acknowledgements": MessageLookupByLibrary.simpleMessage(
      "Acknowledgements",
    ),
    "acknowledgementsIntro": MessageLookupByLibrary.simpleMessage(
      "We would like to thank the following creators for their assets used in this application:",
    ),
    "allRecords": MessageLookupByLibrary.simpleMessage("All Records"),
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "arrow": MessageLookupByLibrary.simpleMessage("Arrow"),
    "autoDetectColors": MessageLookupByLibrary.simpleMessage(
      "Auto Detect Colors",
    ),
    "awesome": MessageLookupByLibrary.simpleMessage("Awesome!"),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "blur": MessageLookupByLibrary.simpleMessage("Blur"),
    "brightness": MessageLookupByLibrary.simpleMessage("Brightness"),
    "cameraIcon": MessageLookupByLibrary.simpleMessage("Camera icon"),
    "cameraPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Camera access denied or device has no camera.",
    ),
    "cameraPermissionDescription": MessageLookupByLibrary.simpleMessage(
      "Sylva needs access to your camera to take photos and extract colors.",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Camera Permission Required",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelBtn": MessageLookupByLibrary.simpleMessage("Cancel"),
    "circle": MessageLookupByLibrary.simpleMessage("Circle"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "Clear all history",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear all history? This action cannot be undone.",
    ),
    "clearAllHistorySubtitle": MessageLookupByLibrary.simpleMessage(
      "Delete all saved images and data",
    ),
    "clearColor": MessageLookupByLibrary.simpleMessage("Clear color"),
    "clearUnfavoritedHistory": MessageLookupByLibrary.simpleMessage(
      "Clear unfavorited history",
    ),
    "clearUnfavoritedHistorySubtitle": MessageLookupByLibrary.simpleMessage(
      "Free up space, keep your favorite items",
    ),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "colorCopiedFailure": MessageLookupByLibrary.simpleMessage(
      "Failed to copy color",
    ),
    "colorCopiedSuccess": m0,
    "colorPickMode": MessageLookupByLibrary.simpleMessage("Color Pick Mode"),
    "colorPickerSelectColor": MessageLookupByLibrary.simpleMessage(
      "Select color",
    ),
    "colorPickerSelectShade": MessageLookupByLibrary.simpleMessage(
      "Select color shade",
    ),
    "colorPickerShades": MessageLookupByLibrary.simpleMessage(
      "Selected color and its shades",
    ),
    "colorsIcon": MessageLookupByLibrary.simpleMessage("Colors icon"),
    "confirmClearAll": MessageLookupByLibrary.simpleMessage(
      "Confirm clear all",
    ),
    "confirmClearAllDesc": MessageLookupByLibrary.simpleMessage(
      "All data will be deleted and cannot be recovered. Are you sure?",
    ),
    "confirmDeleteUnfavoritedDesc": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete unfavorited history? This action cannot be undone.",
    ),
    "confirmDeletion": MessageLookupByLibrary.simpleMessage("Confirm deletion"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Confirm password is required",
    ),
    "contact": MessageLookupByLibrary.simpleMessage("Contact"),
    "contactCooldownMessage": m1,
    "contactErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Please fill in all fields",
    ),
    "contactFormAttachDeviceInfo": MessageLookupByLibrary.simpleMessage(
      "Attach Device Info",
    ),
    "contactFormDescription": MessageLookupByLibrary.simpleMessage(
      "Description",
    ),
    "contactFormDescriptionError": MessageLookupByLibrary.simpleMessage(
      "Please enter a description",
    ),
    "contactFormDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Enter description",
    ),
    "contactFormDeviceInfoError": MessageLookupByLibrary.simpleMessage(
      "Please enter device info",
    ),
    "contactFormDeviceInfoHint": MessageLookupByLibrary.simpleMessage(
      "Device info (Model, OS) will be attached to help us support you better.",
    ),
    "contactFormDeviceInfoNotice": MessageLookupByLibrary.simpleMessage(
      "Basic device info (Model, OS) will be attached to help us support you better.",
    ),
    "contactFormTitle": MessageLookupByLibrary.simpleMessage("Title"),
    "contactFormTitleError": MessageLookupByLibrary.simpleMessage(
      "Please enter a title",
    ),
    "contactFormTitleHint": MessageLookupByLibrary.simpleMessage("Enter title"),
    "contactFormTypeBug": MessageLookupByLibrary.simpleMessage("Bug"),
    "contactFormTypeOther": MessageLookupByLibrary.simpleMessage("Other"),
    "contactFormTypeSuggestion": MessageLookupByLibrary.simpleMessage(
      "Suggestion",
    ),
    "contactSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Thank you for your feedback!",
    ),
    "contactType": MessageLookupByLibrary.simpleMessage("Type"),
    "createNewImage": MessageLookupByLibrary.simpleMessage("Create New Image"),
    "createTime": MessageLookupByLibrary.simpleMessage("Time"),
    "days": MessageLookupByLibrary.simpleMessage("Days"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteBtn": MessageLookupByLibrary.simpleMessage("Delete"),
    "deletePhoto": MessageLookupByLibrary.simpleMessage("Delete photo"),
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Please double-check one last time!\nThis action cannot be undone.",
    ),
    "designedByAuthorFromFlaticon": m2,
    "designedByAuthorMagnific": m3,
    "deviceInfo": MessageLookupByLibrary.simpleMessage("Device Info"),
    "donation": MessageLookupByLibrary.simpleMessage("Donation"),
    "duplicates": MessageLookupByLibrary.simpleMessage("Duplicates"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Invalid email format",
    ),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage(
      "Email is not confirmed.",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "error": m4,
    "errorAlreadyPurchased": MessageLookupByLibrary.simpleMessage(
      "You already own this item.",
    ),
    "errorCameraPermission": MessageLookupByLibrary.simpleMessage(
      "App does not have permission. Please go to Settings to grant access.",
    ),
    "errorDatabaseFull": MessageLookupByLibrary.simpleMessage(
      "App storage is full. Cannot save more data.",
    ),
    "errorFileNotFound": MessageLookupByLibrary.simpleMessage(
      "File not found. It may have been deleted or moved.",
    ),
    "errorInvalidImage": MessageLookupByLibrary.simpleMessage(
      "Invalid image format or corrupted file.",
    ),
    "errorNetwork": MessageLookupByLibrary.simpleMessage(
      "Network connection lost. Please check your Internet.",
    ),
    "errorOutOfMemory": MessageLookupByLibrary.simpleMessage(
      "Device does not have enough RAM to process. Please try a smaller image.",
    ),
    "errorPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Please grant access permission to perform this action.",
    ),
    "errorPrefix": MessageLookupByLibrary.simpleMessage("Error"),
    "errorSomethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred. Please try again later.",
    ),
    "errorStorageFull": MessageLookupByLibrary.simpleMessage(
      "Not enough storage space on the device. Please clean up and try again.",
    ),
    "errorStoreUnavailable": MessageLookupByLibrary.simpleMessage(
      "Cannot connect to the app store. Please check your connection.",
    ),
    "errorUserCanceled": MessageLookupByLibrary.simpleMessage(
      "Operation was canceled.",
    ),
    "failedToLoadColors": MessageLookupByLibrary.simpleMessage(
      "Failed to load colors",
    ),
    "file": MessageLookupByLibrary.simpleMessage("file"),
    "files": MessageLookupByLibrary.simpleMessage("files"),
    "fill": MessageLookupByLibrary.simpleMessage("Fill"),
    "filter": MessageLookupByLibrary.simpleMessage("Filter"),
    "finish": MessageLookupByLibrary.simpleMessage("Finish"),
    "flashMode": MessageLookupByLibrary.simpleMessage("Flash Mode"),
    "fontSelection": MessageLookupByLibrary.simpleMessage("Select Font"),
    "fullScreen": MessageLookupByLibrary.simpleMessage("Full Screen"),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "GPS location data removed and saved as a new copy.",
    ),
    "hapticFeedback": MessageLookupByLibrary.simpleMessage("Haptic Feedback"),
    "help": MessageLookupByLibrary.simpleMessage("Help"),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "historySort": MessageLookupByLibrary.simpleMessage("Sort History"),
    "historyView": MessageLookupByLibrary.simpleMessage("Change View"),
    "imageSaved": MessageLookupByLibrary.simpleMessage(
      "Image saved successfully!",
    ),
    "informationAndSupport": MessageLookupByLibrary.simpleMessage(
      "Information & Support",
    ),
    "interactionEffects": MessageLookupByLibrary.simpleMessage(
      "Interaction Effects",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "last30Days": MessageLookupByLibrary.simpleMessage("Last 30 days"),
    "last7Days": MessageLookupByLibrary.simpleMessage("Last 7 days"),
    "letGo": MessageLookupByLibrary.simpleMessage("Let\'s Go"),
    "level": m5,
    "line": MessageLookupByLibrary.simpleMessage("Line"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "logout": MessageLookupByLibrary.simpleMessage("Log out"),
    "luminance": MessageLookupByLibrary.simpleMessage("Luminance"),
    "mon": MessageLookupByLibrary.simpleMessage("Mon"),
    "myColors": MessageLookupByLibrary.simpleMessage("My Colors"),
    "nameLength": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 2 characters",
    ),
    "nameRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noCamerasFound": MessageLookupByLibrary.simpleMessage(
      "No cameras found on device",
    ),
    "noFontsFound": MessageLookupByLibrary.simpleMessage("No fonts found"),
    "noHistoryYet": MessageLookupByLibrary.simpleMessage("No history yet"),
    "noImageToShare": MessageLookupByLibrary.simpleMessage("No image to share"),
    "nothingSelectedToCopy": MessageLookupByLibrary.simpleMessage(
      "Nothing selected to copy",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "older": MessageLookupByLibrary.simpleMessage("Older"),
    "onboardDesc": MessageLookupByLibrary.simpleMessage(
      "Extract, save and manage vibrant colors from any photo you take.",
    ),
    "onboardTitle": MessageLookupByLibrary.simpleMessage("Capture the Colors"),
    "onlyFavorites": MessageLookupByLibrary.simpleMessage("Only Favorites"),
    "opacity": MessageLookupByLibrary.simpleMessage("Opacity"),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "paint": MessageLookupByLibrary.simpleMessage("Paint"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters, include uppercase, lowercase, number and special character",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "permissionDescription": MessageLookupByLibrary.simpleMessage(
      "Sylva needs access to your photo library to select photos and extract colors.",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage(
      "Photo Library Permission Required",
    ),
    "pickImageFromGallery": MessageLookupByLibrary.simpleMessage(
      "Pick image from gallery",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "privacyPolicyContent": MessageLookupByLibrary.simpleMessage(
      "We value your privacy. Sylva processes your camera data locally whenever possible. We do not store or share your personal photos without your explicit consent.",
    ),
    "privacyPolicyContent1": MessageLookupByLibrary.simpleMessage(
      "We do not collect or store any personal photos or camera data on our servers. All camera processing is performed locally on your device.",
    ),
    "privacyPolicyContent2": MessageLookupByLibrary.simpleMessage(
      "Any data processed by Sylva is used solely for providing the camera and color analysis features within the application.",
    ),
    "privacyPolicyContent3": MessageLookupByLibrary.simpleMessage(
      "We implement industry-standard security measures to protect your data. Since your photos remain on your device, you have full control over your privacy.",
    ),
    "privacyPolicyContent4": MessageLookupByLibrary.simpleMessage(
      "We use Firebase Crashlytics to collect anonymized crash reports. This helps us identify bugs and improve the stability of the application. The collected data does not contain personally identifiable information.",
    ),
    "privacyPolicyTitle1": MessageLookupByLibrary.simpleMessage(
      "Information Collection",
    ),
    "privacyPolicyTitle2": MessageLookupByLibrary.simpleMessage(
      "Use of Information",
    ),
    "privacyPolicyTitle3": MessageLookupByLibrary.simpleMessage(
      "Data Security",
    ),
    "privacyPolicyTitle4": MessageLookupByLibrary.simpleMessage(
      "Crash Reporting",
    ),
    "progress": MessageLookupByLibrary.simpleMessage("Progress"),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Purchase failed or was cancelled.",
    ),
    "rainbowHalftoneDotsBackground": MessageLookupByLibrary.simpleMessage(
      "Rainbow halftone dots background",
    ),
    "ratio": MessageLookupByLibrary.simpleMessage("Ratio"),
    "rectangle": MessageLookupByLibrary.simpleMessage("Rectangle"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "replaceExistingRecord": MessageLookupByLibrary.simpleMessage(
      "Replace existing record",
    ),
    "replaceOriginal": MessageLookupByLibrary.simpleMessage("Replace Original"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "restoreFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Could not restore purchases or you don\'t have a subscription.",
    ),
    "restorePurchases": MessageLookupByLibrary.simpleMessage(
      "Restore Purchases",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "roadBlockIcon": MessageLookupByLibrary.simpleMessage("Road block icon"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveAsNew": MessageLookupByLibrary.simpleMessage("Save as new"),
    "saveColor": MessageLookupByLibrary.simpleMessage("Save Color"),
    "saveToLibrary": MessageLookupByLibrary.simpleMessage("Save to library"),
    "savedImagesStorage": MessageLookupByLibrary.simpleMessage(
      "Saved images storage",
    ),
    "scanLimit": MessageLookupByLibrary.simpleMessage("Scan Limit"),
    "searchFont": MessageLookupByLibrary.simpleMessage("Search font"),
    "seedColor": MessageLookupByLibrary.simpleMessage("App Color"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "size": MessageLookupByLibrary.simpleMessage("Size"),
    "soundEffects": MessageLookupByLibrary.simpleMessage("Sound Effects"),
    "storageManagement": MessageLookupByLibrary.simpleMessage(
      "Storage Management",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "switchCamera": MessageLookupByLibrary.simpleMessage("Switch Camera"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "termsOfServiceContent": MessageLookupByLibrary.simpleMessage(
      "By using Sylva, you agree to our Terms of Service. You must not use the application for any illegal or unauthorized purpose. The services and content are provided \"as is\" without warranties of any kind.",
    ),
    "text": MessageLookupByLibrary.simpleMessage("Text"),
    "textAlign": MessageLookupByLibrary.simpleMessage("Align text"),
    "textOptionNone": MessageLookupByLibrary.simpleMessage("None"),
    "textPositionBottom": MessageLookupByLibrary.simpleMessage("Bottom"),
    "textPositionInside": MessageLookupByLibrary.simpleMessage("Inside"),
    "textPositionLeft": MessageLookupByLibrary.simpleMessage("Left"),
    "textPositionRight": MessageLookupByLibrary.simpleMessage("Right"),
    "textPositionTop": MessageLookupByLibrary.simpleMessage("Top"),
    "thanksAndReference": MessageLookupByLibrary.simpleMessage(
      "Thanks & Reference",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Dark"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Light"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("System"),
    "thu": MessageLookupByLibrary.simpleMessage("Thu"),
    "timer": MessageLookupByLibrary.simpleMessage("Timer"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "tosContent1": MessageLookupByLibrary.simpleMessage(
      "By downloading and using Sylva, you agree to these Terms of Service. If you do not agree, please do not use the application.",
    ),
    "tosContent2": MessageLookupByLibrary.simpleMessage(
      "You are responsible for any content you capture or process using Sylva. You agree not to use the application for any unlawful or prohibited activities.",
    ),
    "tosContent3": MessageLookupByLibrary.simpleMessage(
      "Sylva and its creators shall not be held liable for any damages or losses resulting from your use of the application. The service is provided \'as is\'.",
    ),
    "tosContent4": MessageLookupByLibrary.simpleMessage(
      "Sylva utilizes third-party services such as Firebase Crashlytics to monitor application stability and collect crash reports. By using this app, you agree to the collection of anonymized crash and performance data by these services.",
    ),
    "tosTitle1": MessageLookupByLibrary.simpleMessage("Acceptance of Terms"),
    "tosTitle2": MessageLookupByLibrary.simpleMessage("User Responsibilities"),
    "tosTitle3": MessageLookupByLibrary.simpleMessage(
      "Limitation of Liability",
    ),
    "tosTitle4": MessageLookupByLibrary.simpleMessage("Third-Party Services"),
    "tutorialBackDesc": MessageLookupByLibrary.simpleMessage(
      "Discard changes and return to the camera.",
    ),
    "tutorialBackTitle": MessageLookupByLibrary.simpleMessage("Go Back"),
    "tutorialCameraDesc": MessageLookupByLibrary.simpleMessage(
      "Switch between front and rear cameras.",
    ),
    "tutorialCameraTitle": MessageLookupByLibrary.simpleMessage(
      "Switch Camera",
    ),
    "tutorialCaptureDesc": MessageLookupByLibrary.simpleMessage(
      "Take a photo right now.",
    ),
    "tutorialCaptureTitle": MessageLookupByLibrary.simpleMessage("Capture"),
    "tutorialDeleteAllDesc": MessageLookupByLibrary.simpleMessage(
      "Delete all of your previously captured photos.",
    ),
    "tutorialDeleteAllTitle": MessageLookupByLibrary.simpleMessage(
      "Clear History",
    ),
    "tutorialExpandPaletteDesc": MessageLookupByLibrary.simpleMessage(
      "View all extracted and picked colors in a bottom sheet.",
    ),
    "tutorialExpandPaletteTitle": MessageLookupByLibrary.simpleMessage(
      "Expand Palette",
    ),
    "tutorialFavoritesDesc": MessageLookupByLibrary.simpleMessage(
      "Filter your history to only show your favorite photos.",
    ),
    "tutorialFavoritesTitle": MessageLookupByLibrary.simpleMessage(
      "Favorites Only",
    ),
    "tutorialFlashDesc": MessageLookupByLibrary.simpleMessage(
      "Toggle flash modes (Auto, On, Off).",
    ),
    "tutorialFlashTitle": MessageLookupByLibrary.simpleMessage("Flash Mode"),
    "tutorialFullScreenDesc": MessageLookupByLibrary.simpleMessage(
      "Tap here to view the original photo in full screen.",
    ),
    "tutorialFullScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Full Screen",
    ),
    "tutorialGalleryDesc": MessageLookupByLibrary.simpleMessage(
      "Pick an existing photo from your gallery.",
    ),
    "tutorialGalleryTitle": MessageLookupByLibrary.simpleMessage("Gallery"),
    "tutorialHistoryDesc": MessageLookupByLibrary.simpleMessage(
      "View your previously captured photos.",
    ),
    "tutorialHistoryTitle": MessageLookupByLibrary.simpleMessage("History"),
    "tutorialHistoryViewDesc": MessageLookupByLibrary.simpleMessage(
      "Toggle between list and grid views for your history.",
    ),
    "tutorialHistoryViewTitle": MessageLookupByLibrary.simpleMessage(
      "Change View",
    ),
    "tutorialImageDesc": MessageLookupByLibrary.simpleMessage(
      "Pan your finger on the photo to magnify and pick any color.",
    ),
    "tutorialImageTitle": MessageLookupByLibrary.simpleMessage("Photo Preview"),
    "tutorialLibraryDesc": MessageLookupByLibrary.simpleMessage(
      "Export this photo to your device\'s photo gallery.",
    ),
    "tutorialLibraryTitle": MessageLookupByLibrary.simpleMessage(
      "Save to Library",
    ),
    "tutorialNext": MessageLookupByLibrary.simpleMessage("Next"),
    "tutorialPaletteDesc": MessageLookupByLibrary.simpleMessage(
      "Tap a color to filter, long press to copy its hex code.",
    ),
    "tutorialPaletteTitle": MessageLookupByLibrary.simpleMessage(
      "Color Palette",
    ),
    "tutorialSaveDesc": MessageLookupByLibrary.simpleMessage(
      "Save this photo and colors to the app\'s history.",
    ),
    "tutorialSaveTitle": MessageLookupByLibrary.simpleMessage("Save to App"),
    "tutorialSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "Customize your app preferences here.",
    ),
    "tutorialSettingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
    "tutorialShareDesc": MessageLookupByLibrary.simpleMessage(
      "Select colors and create beautiful images",
    ),
    "tutorialShareTitle": MessageLookupByLibrary.simpleMessage("Create Images"),
    "tutorialSkip": MessageLookupByLibrary.simpleMessage("Skip"),
    "tutorialSortDesc": MessageLookupByLibrary.simpleMessage(
      "Sort your history ascending or descending by time.",
    ),
    "tutorialSortTitle": MessageLookupByLibrary.simpleMessage("Sort History"),
    "tutorialTimerDesc": MessageLookupByLibrary.simpleMessage(
      "Set a countdown timer before capturing.",
    ),
    "tutorialTimerTitle": MessageLookupByLibrary.simpleMessage("Timer"),
    "tutorialToggleModeDesc": MessageLookupByLibrary.simpleMessage(
      "Switch between Color Pick mode and Zoom mode. In Color Pick mode, tap on the image to pick colors. In Zoom mode, pinch to zoom and pan the image.",
    ),
    "tutorialToggleModeTitle": MessageLookupByLibrary.simpleMessage(
      "Toggle Mode",
    ),
    "tutorialZoomDesc": MessageLookupByLibrary.simpleMessage(
      "Use these buttons to zoom in or out precisely.",
    ),
    "tutorialZoomTitle": MessageLookupByLibrary.simpleMessage("Zoom"),
    "useMagnifierToPickColors": MessageLookupByLibrary.simpleMessage(
      "Use magnifier to pick colors",
    ),
    "userBanned": MessageLookupByLibrary.simpleMessage("User is banned."),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found."),
    "version": m6,
    "visitOurWebsite": MessageLookupByLibrary.simpleMessage(
      "Visit our website",
    ),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Password is too weak.",
    ),
    "wed": MessageLookupByLibrary.simpleMessage("Wed"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
    "zoomMode": MessageLookupByLibrary.simpleMessage("Zoom Mode"),
  };
}
