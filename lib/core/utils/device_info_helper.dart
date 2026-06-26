import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class DeviceInfoHelper {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static const _storage = FlutterSecureStorage();
  static const _uuidKey = 'device_uuid';

  static Future<String> getDeviceUuid() async {
    try {
      String? uuid = await _storage.read(key: _uuidKey);
      if (uuid == null) {
        uuid = const Uuid().v4();
        await _storage.write(key: _uuidKey, value: uuid);
      }
      return uuid;
    } catch (e) {
      return 'Unknown UUID';
    }
  }

  static Future<String> getBasicDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return 'Android: ${androidInfo.brand} ${androidInfo.model} (API ${androidInfo.version.sdkInt})';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return 'iOS: ${iosInfo.model} [${iosInfo.utsname.machine}] (${iosInfo.systemVersion})';
      }
    } catch (e) {
      return 'Unknown Device Info ($e)';
    }
    return 'Unsupported OS';
  }
}
