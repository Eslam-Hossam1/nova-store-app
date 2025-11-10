import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nova_store_app/core/auth/auth_credentials_manager.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/utils/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

class AppInitializer {
  static Future<void> initialize() async {
    await _initBlocObserver();

    await _initServiceLocator();

    await _initAuthCredentialsManager();
    await _initHydratedBloc();
  }

  static Future<void> _initBlocObserver() async {
    Bloc.observer = AppBlocObserver();
  }

  static Future<void> _initServiceLocator() async {
    await setupServiceLocator();
  }

  static Future<void> _initHydratedBloc() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }

  static Future<void> _initAuthCredentialsManager() async {
    await getIt<AuthCredentialsManager>().init();
  }
}
