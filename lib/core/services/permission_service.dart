import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:photo_manager/photo_manager.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/dialogs/app_dialog.dart';

@lazySingleton
class PermissionService {
  /// Request photo library permission using photo_manager
  /// Returns true if permission is granted or limited, false otherwise.
  Future<bool> requestPhotoPermission(BuildContext context) async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    // For iOS 14+, 'limited' is also considered a success since we can scan the allowed photos.
    if (ps.isAuth || ps.hasAccess) {
      return true;
    }

    if (!context.mounted) return false;

    if (ps == PermissionState.restricted) {
      await AppDialog(context).showConfirm(
        title: S.current.permissionRequired,
        message: S.current.permissionDescription,
        rightText: S.current.ok,
        leftText: S.current.cancel,
        onRight: () {
          openAppSettings();
        },
      );
    } else {
      await AppDialog(context).showError(
        title: S.current.permissionRequired,
        message: S.current.permissionDescription,
      );
    }

    return false;
  }

  /// Check current permission status
  Future<PermissionState> checkPermissionStatus() async {
    return await PhotoManager.requestPermissionExtend();
  }

  /// Request notification permission (for Android 13+)
  Future<bool> requestNotificationPermission() async {
    final status = await ph.Permission.notification.request();
    return status.isGranted;
  }

  /// Check current notification permission status
  Future<bool> checkNotificationStatus() async {
    return await ph.Permission.notification.isGranted;
  }

  /// Open app settings
  void openAppSettings() {
    PhotoManager.openSetting();
  }
}
