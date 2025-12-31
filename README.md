## Flutter Permission Manager 🔐
```
A simple, lightweight, and production-ready Flutter permission manager that helps you request, check, and manage runtime permissions on Android (6–14) and iOS with a clean API.

Designed for real-world apps, good UX, and pub.dev quality.
```

## ✨ Features
```
✅ Request single permission

✅ Request multiple permissions

✅ Check permission status

✅ Handle permanently denied permissions

✅ Auto-open app settings (safe & optional)

✅ Android 13+ notification & media permissions ready

✅ Clean, beginner-friendly API

✅ Works on Android & iOS
```
## 📦 Installation

Add this to your pubspec.yaml:
```
dependencies:
flutter_permission_manager: ^1.0.0
```
Then run:
```
flutter pub get
```
## 🚀 Quick Start

```
import 'package:flutter_permission_manager/flutter_permission_manager.dart';
```
## 🔑 Request a Permission
```
final status = await PermissionManager.requestWithStatus(
AppPermission.camera,
);


if (status.isGranted) {
print('Permission granted');
}
```
## 🔁 Request Multiple Permissions

```
final results = await PermissionManager.requestMultiple([
AppPermission.camera,
AppPermission.microphone,
]);
```
## 🔍 Check Permission Status
```
final isGranted = await PermissionManager.isGranted(
AppPermission.location,
);
```
## 📄 Supported Permissions
```
enum AppPermission {
camera,
storage,
microphone,
location,
notification,
}
```
## 🤖 Android Setup

Add permissions to AndroidManifest.xml:
```
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```
## Android 13+ Media Permissions

Starting from **Android 13 (API 33)**, storage permissions are split into
media-specific permissions.

If your app accesses images, videos, or audio files, add the following
permissions to `AndroidManifest.xml`:

```xml
<!-- Android 13+ -->
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
<uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />
<uses-permission android:name="android.permission.READ_MEDIA_AUDIO" />

<!-- Android 12 and below -->
<uses-permission
    android:name="android.permission.READ_EXTERNAL_STORAGE"
    android:maxSdkVersion="32" />
```
## 🍎 iOS Setup
Add usage descriptions to Info.plist:
```
<key>NSCameraUsageDescription</key>
<string>Camera permission is required</string>


<key>NSMicrophoneUsageDescription</key>
<string>Microphone permission is required</string>


<key>NSLocationWhenInUseUsageDescription</key>
<string>Location permission is required</string>
```
## 📄 License
```
MIT License

Copyright (c) 2025 Excelsior Technologies 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```


