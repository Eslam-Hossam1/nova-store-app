import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nova_store_app/core/api/dio_consumer.dart';
import 'package:nova_store_app/core/api/internet_checker.dart';
import 'package:nova_store_app/core/cache/shared_pref/shared_prefernce_helper.dart';
import 'package:nova_store_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:nova_store_app/features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:nova_store_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(sharedPreferences),
  );
  getIt.registerSingleton<OnBoardingCacheHelper>(
    OnBoardingCacheHelper(
      sharedPreferencesHelper: getIt<SharedPreferencesHelper>(),
    ),
  );
  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<InternetChecker>(
    InternetChecker(
      connectionChecker: InternetConnectionChecker.instance,
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(apiConsumer: getIt()),
      internetChecker: getIt(),
    ),
  );
}
