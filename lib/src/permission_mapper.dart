import 'package:flutter_permission_manager/src/permission_type.dart';
import 'package:permission_handler/permission_handler.dart';


class PermissionMapper {
  static Permission map(AppPermission permission) {
    switch (permission) {
      case AppPermission.camera:
        return Permission.camera;
      case AppPermission.storage:
        return Permission.storage;
      case AppPermission.microphone:
        return Permission.microphone;
      case AppPermission.location:
        return Permission.locationWhenInUse;
      case AppPermission.notification:
        return Permission.notification;
    }
  }
}
