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

  static String m1(message) => "Error: ${message}";

  static String m2(level) => "Level ${level}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appName": MessageLookupByLibrary.simpleMessage("Sylva"),
    "arrow": MessageLookupByLibrary.simpleMessage("Arrow"),
    "autoDetectColors": MessageLookupByLibrary.simpleMessage(
      "Auto Detect Colors",
    ),
    "awesome": MessageLookupByLibrary.simpleMessage("Awesome!"),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "blur": MessageLookupByLibrary.simpleMessage("Blur"),
    "brightness": MessageLookupByLibrary.simpleMessage("Brightness"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelMonthlyMessage": MessageLookupByLibrary.simpleMessage(
      "You\'ve successfully upgraded to Lifetime! Since you previously had a Monthly subscription, please remember to cancel it in the App Store/Google Play to avoid being charged for both.",
    ),
    "cancelMonthlyTitle": MessageLookupByLibrary.simpleMessage(
      "Action Required",
    ),
    "circle": MessageLookupByLibrary.simpleMessage("Circle"),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "colorCopiedFailure": MessageLookupByLibrary.simpleMessage(
      "Failed to copy color",
    ),
    "colorCopiedSuccess": m0,
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Confirm password is required",
    ),
    "createNewImage": MessageLookupByLibrary.simpleMessage("Create New Image"),
    "days": MessageLookupByLibrary.simpleMessage("Days"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deletePhoto": MessageLookupByLibrary.simpleMessage("Delete photo"),
    "delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Please double-check one last time!\nThis action cannot be undone.",
    ),
    "duplicates": MessageLookupByLibrary.simpleMessage("Duplicates"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Invalid email format",
    ),
    "emailNotConfirmed": MessageLookupByLibrary.simpleMessage(
      "Email is not confirmed.",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "error": m1,
    "failedToLoadColors": MessageLookupByLibrary.simpleMessage(
      "Failed to load colors",
    ),
    "file": MessageLookupByLibrary.simpleMessage("file"),
    "files": MessageLookupByLibrary.simpleMessage("files"),
    "fill": MessageLookupByLibrary.simpleMessage("Fill"),
    "filter": MessageLookupByLibrary.simpleMessage("Filter"),
    "finish": MessageLookupByLibrary.simpleMessage("Finish"),
    "gpsRemovedSuccess": MessageLookupByLibrary.simpleMessage(
      "GPS location data removed and saved as a new copy.",
    ),
    "history": MessageLookupByLibrary.simpleMessage("History"),
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
    "imageSaved": MessageLookupByLibrary.simpleMessage(
      "Image saved successfully!",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "level": m2,
    "line": MessageLookupByLibrary.simpleMessage("Line"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "logout": MessageLookupByLibrary.simpleMessage("Log out"),
    "luminance": MessageLookupByLibrary.simpleMessage("Luminance"),
    "manageSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Manage Subscriptions",
    ),
    "mon": MessageLookupByLibrary.simpleMessage("Mon"),
    "myColors": MessageLookupByLibrary.simpleMessage("My Colors"),
    "nameLength": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 2 characters",
    ),
    "nameRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noHistoryYet": MessageLookupByLibrary.simpleMessage("No history yet"),
    "nothingSelectedToCopy": MessageLookupByLibrary.simpleMessage(
      "Nothing selected to copy",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
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
      "Twinfix needs access to your photo library to scan and clean duplicate photos.",
    ),
    "permissionRequired": MessageLookupByLibrary.simpleMessage(
      "Permission Required",
    ),
    "pickImageFromGallery": MessageLookupByLibrary.simpleMessage(
      "Pick image from gallery",
    ),
    "premium": MessageLookupByLibrary.simpleMessage("Premium"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "progress": MessageLookupByLibrary.simpleMessage("Progress"),
    "purchaseFailureMessage": MessageLookupByLibrary.simpleMessage(
      "Purchase failed or was cancelled.",
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
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveAsNew": MessageLookupByLibrary.simpleMessage("Save as new"),
    "saveColor": MessageLookupByLibrary.simpleMessage("Save Color"),
    "saveToLibrary": MessageLookupByLibrary.simpleMessage("Save to library"),
    "scanLimit": MessageLookupByLibrary.simpleMessage("Scan Limit"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "size": MessageLookupByLibrary.simpleMessage("Size"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "text": MessageLookupByLibrary.simpleMessage("Text"),
    "textAlign": MessageLookupByLibrary.simpleMessage("Align text"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Dark"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Light"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("System"),
    "thu": MessageLookupByLibrary.simpleMessage("Thu"),
    "understood": MessageLookupByLibrary.simpleMessage("GOT IT"),
    "useMagnifierToPickColors": MessageLookupByLibrary.simpleMessage(
      "Use magnifier to pick colors",
    ),
    "userBanned": MessageLookupByLibrary.simpleMessage("User is banned."),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found."),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Password is too weak.",
    ),
    "wed": MessageLookupByLibrary.simpleMessage("Wed"),
  };
}
