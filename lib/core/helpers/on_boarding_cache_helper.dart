import 'package:nova_store_app/core/cache/shared_pref/shared_pref_keys.dart';
import 'package:nova_store_app/core/cache/shared_pref/shared_prefernce_helper.dart';

class OnBoardingCacheHelper {
  final SharedPreferencesHelper _sharedPreferencesHelper;

  OnBoardingCacheHelper({
    required SharedPreferencesHelper sharedPreferencesHelper,
  }) : _sharedPreferencesHelper = sharedPreferencesHelper;

  Future<void> setOnBoardingCompletedToTrue() async {
    await _sharedPreferencesHelper.setData(
      key: SharedPrefKeys.onboardingCompleted,
      value: true,
    );
  }

  bool isOnBoardingCompleted() {
    bool? isOnBoardingCompleted = _sharedPreferencesHelper.getBool(
      key: SharedPrefKeys.onboardingCompleted,
    );
    return isOnBoardingCompleted == null ? false : true;
  }
}
