import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sylva/generated/l10n.dart';

class AppFailures {
  AppFailures._();

  static String mapErrorToMessage({dynamic e}) {
    if (e == null) {
      return S.current.error('Unknown');
    }

    final errorString = e.toString().toLowerCase();

    // 1. Storage & Filesystem
    if (errorString.contains('no space left') ||
        errorString.contains('errno = 28')) {
      return S.current.errorStorageFull;
    }
    if (errorString.contains('permission denied') ||
        errorString.contains('errno = 13')) {
      return S.current.errorPermissionDenied;
    }
    if (e is PathNotFoundException || errorString.contains('path not found')) {
      return S.current.errorFileNotFound;
    }

    // 2. Local Database (Isar)
    if (errorString.contains('database is full')) {
      return S.current.errorDatabaseFull;
    }

    // 3. Platform / System (IAP, Camera, Internet)
    if (e is PlatformException) {
      if (e.code == 'store_unavailable' || e.code == 'billing_unavailable') {
        return S.current.errorStoreUnavailable;
      }
      if (e.code == 'item_already_owned') {
        return S.current.errorAlreadyPurchased;
      }
      if (e.code == 'camera_access_denied' || e.code == 'photo_access_denied') {
        return S.current.errorCameraPermission;
      }
      if (e.code == 'network_error') {
        return S.current.errorNetwork;
      }
      if (e.code == 'user_canceled') {
        return S.current.errorUserCanceled;
      }
    }

    // 4. Memory / Image Processing
    if (errorString.contains('out of memory') ||
        errorString.contains('exhausted memory')) {
      return S.current.errorOutOfMemory;
    }
    if (errorString.contains('invalid image format') ||
        errorString.contains('corrupt')) {
      return S.current.errorInvalidImage;
    }

    // 5. Fallback - Lỗi chung thay thế cho thông báo hệ thống
    return S.current.errorSomethingWentWrong;
  }
}
