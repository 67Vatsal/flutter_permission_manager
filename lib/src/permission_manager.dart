import 'package:flutter_permission_manager/src/permission_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'permission_mapper.dart';


class PermissionManager {

  /// Request permission and return full status
  static Future<PermissionStatus> requestWithStatus(
      AppPermission permission) async {
    final permissionObj = PermissionMapper.map(permission);
    final status = await permissionObj.request();
    return status;
  }

  /// Request permission (simple true/false)
  static Future<bool> request(AppPermission permission) async {
    final status = await requestWithStatus(permission);
    return status.isGranted;
  }

  /// Check if permission already granted
  static Future<bool> isGranted(AppPermission permission) async {
    final status =
    await PermissionMapper.map(permission).status;
    return status.isGranted;
  }

  /// Open app settings
  static Future<void> openSettings() async {
    await openAppSettings();
  }
}
