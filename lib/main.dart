import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nova_store_app/core/cache/config/app_initializer.dart';
import 'package:nova_store_app/nova_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Run all initializations
  await AppInitializer.initialize();

  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => const NovaStoreApp(),
    ),
  );
}
