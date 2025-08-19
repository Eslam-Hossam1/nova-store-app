import 'package:flutter/material.dart';
import 'package:nova_store_app/core/routing/app_router.dart';

class NovaStoreApp extends StatelessWidget {
  const NovaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}