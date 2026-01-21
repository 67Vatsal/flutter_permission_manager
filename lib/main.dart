import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_permission_manager/src/permission_UI_state.dart';
import 'package:flutter_permission_manager/src/permission_manager.dart';
import 'package:flutter_permission_manager/src/permission_type.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PermissionScreen(),
    );
  }
}

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  PermissionUIState _state = PermissionUIState.idle;

  Future<void> requestCameraPermission() async {
    final status =
    await PermissionManager.requestWithStatus(AppPermission.camera);

    setState(() {
      if (status.isGranted) {
        _state = PermissionUIState.granted;
      } else if (status.isPermanentlyDenied) {
        _state = PermissionUIState.permanentlyDenied;
      } else {
        _state = PermissionUIState.denied;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permission Example')),
      body: Center(child: _buildContent()),
    );
  }

  Widget _buildContent() {
    switch (_state) {
      case PermissionUIState.granted:
        return const Text(
          '✅ Permission Granted',
          textAlign: TextAlign.center,
        );

      case PermissionUIState.denied:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('❌ Permission Denied'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: requestCameraPermission,
              child: const Text('Try Again'),
            ),
          ],
        );

      case PermissionUIState.permanentlyDenied:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('⚠ Permission Permanently Denied'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: PermissionManager.openSettings,
              child: const Text('Open Settings'),
            ),
          ],
        );

      case PermissionUIState.idle:
      default:
        return ElevatedButton(
          onPressed: requestCameraPermission,
          child: const Text('Request Camera Permission'),
        );
    }
  }
}
