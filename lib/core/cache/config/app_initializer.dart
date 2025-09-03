import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/auth/auth_credentials_manager.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/utils/app_bloc_observer.dart';

class AppInitializer {
  static Future<void> initialize() async {
    await _initBlocObserver();

    await _initServiceLocator();

    await _initAuthCredentialsManager();
  }

  static Future<void> _initBlocObserver() async {
    Bloc.observer = AppBlocObserver();
  }

  static Future<void> _initServiceLocator() async {
    await setupServiceLocator();
  }

  static Future<void> _initAuthCredentialsManager() async {
    await getIt<AuthCredentialsManager>().init();
  }
}
