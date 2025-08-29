import 'package:get_it/get_it.dart';
import 'package:nova_store_app/core/cache/shared_pref/shared_prefernce_helper.dart';
import 'package:nova_store_app/core/helpers/on_boarding_cache_helper.dart';
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
}
