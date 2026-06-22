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

  /// Request camera permission
  Future<bool> requestCameraPermission(BuildContext context) async {
    final status = await ph.Permission.camera.request();

    if (status.isGranted) {
      return true;
    }

    if (!context.mounted) return false;

    if (status.isPermanentlyDenied) {
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

  /// Check current camera permission status
  Future<bool> checkCameraStatus() async {
    return await ph.Permission.camera.isGranted;
  }

  /// Open app settings
  void openAppSettings() {
    PhotoManager.openSetting();
  }
}
