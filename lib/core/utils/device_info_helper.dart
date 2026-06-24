import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoHelper {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<String> getBasicDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return 'Android: ${androidInfo.brand} ${androidInfo.model} (API ${androidInfo.version.sdkInt})';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return 'iOS: ${iosInfo.name} [${iosInfo.utsname.machine}] (${iosInfo.systemVersion})';
      }
    } catch (e) {
      return 'Unknown Device Info ($e)';
    }
    return 'Unsupported OS';
  }
}
