import 'package:flutter/material.dart';
import 'package:nova_store_app/core/cache/config/app_initializer.dart';
import 'package:nova_store_app/nova_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.initialize();

  runApp(
    const NovaStoreApp(),
  );
}
