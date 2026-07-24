import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sylva/core/constants/key_constants.dart';
import 'package:sylva/generated/l10n.dart';

class AppFailures {
  AppFailures._();

  static String mapErrorToMessage({dynamic e}) {
    if (e == null) {
      return S.current.error('Unknown');
    }

    final errorString = e.toString().toLowerCase();

    // 1. Storage & Filesystem
    if (errorString.contains(KeyConstants.errorNoSpaceLeft) ||
        errorString.contains(KeyConstants.errorErrno28)) {
      return S.current.errorStorageFull;
    }
    if (errorString.contains(KeyConstants.errorPermissionDenied) ||
        errorString.contains(KeyConstants.errorErrno13)) {
      return S.current.errorPermissionDenied;
    }
    if (e is PathNotFoundException ||
        errorString.contains(KeyConstants.errorPathNotFound)) {
      return S.current.errorFileNotFound;
    }

    // 2. Local Database (Isar)
    if (errorString.contains(KeyConstants.errorDatabaseFull)) {
      return S.current.errorDatabaseFull;
    }

    // 3. Platform / System (IAP, Camera, Internet)
    if (e is PlatformException) {
      if (e.code == KeyConstants.codeStoreUnavailable ||
          e.code == KeyConstants.codeBillingUnavailable) {
        return S.current.errorStoreUnavailable;
      }
      if (e.code == KeyConstants.codeItemAlreadyOwned) {
        return S.current.errorAlreadyPurchased;
      }
      if (e.code == KeyConstants.codeCameraAccessDenied ||
          e.code == KeyConstants.codePhotoAccessDenied) {
        return S.current.errorCameraPermission;
      }
      if (e.code == KeyConstants.codeNetworkError) {
        return S.current.errorNetwork;
      }
      if (e.code == KeyConstants.codeUserCanceled) {
        return S.current.errorUserCanceled;
      }
    }

    // 4. Memory / Image Processing
    if (errorString.contains(KeyConstants.errorOutOfMemory) ||
        errorString.contains(KeyConstants.errorExhaustedMemory)) {
      return S.current.errorOutOfMemory;
    }
    if (errorString.contains(KeyConstants.errorInvalidImageFormat) ||
        errorString.contains(KeyConstants.errorCorrupt)) {
      return S.current.errorInvalidImage;
    }

    // 5. Fallback for unrecognized errors
    return S.current.errorSomethingWentWrong;
  }
}
