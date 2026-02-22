import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nova_store_app/core/api/dio_consumer.dart';
import 'package:nova_store_app/core/api/network_connection_checker_impl.dart';
import 'package:nova_store_app/core/auth/auth_credentials_manager.dart';
import 'package:nova_store_app/core/auth/jwt_decoder/jwt_decoder_service_impl.dart';
import 'package:nova_store_app/core/cache/secure_storage_helper.dart/secure_storage_helper.dart';
import 'package:nova_store_app/core/cache/shared_pref/shared_prefernce_helper.dart';
import 'package:nova_store_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:nova_store_app/features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:nova_store_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:nova_store_app/features/category/data/datasources/category_products_remote_data_source/category_products_remote_data_source_impl.dart';
import 'package:nova_store_app/features/category/data/repos/category_products_repo_impl.dart';
import 'package:nova_store_app/features/category/domain/usecases/get_category_products_usecase.dart';
import 'package:nova_store_app/features/home/data/datasources/category/category_remote_data_source.dart';
import 'package:nova_store_app/features/home/data/datasources/products/products_remote_data_source_impl.dart';
import 'package:nova_store_app/features/home/data/repos/category_repo_impl.dart';
import 'package:nova_store_app/features/home/data/repos/products_repo_impl.dart';
import 'package:nova_store_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:nova_store_app/features/home/domain/usecases/get_products_usecase.dart';
import 'package:nova_store_app/features/otp/data/data_sources/otp_remote_data_source_impl.dart';
import 'package:nova_store_app/features/otp/data/repos/otp_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  await _setupCaching();
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

  getIt.registerSingleton<NetworkConnectionCheckerImpl>(
    NetworkConnectionCheckerImpl(
      connectivity: Connectivity(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      authRemoteDataSource:
          AuthRemoteDataSourceImpl(apiConsumer: getIt<DioConsumer>()),
    ),
  );
  getIt.registerSingleton<OtpRepoImpl>(
    OtpRepoImpl(
      otpRemoteDataSource:
          OtpRemoteDataSourceImpl(apiConsumer: getIt<DioConsumer>()),
    ),
  );
  getIt.registerSingleton<GetProductsUseCase>(
    GetProductsUseCase(
      productsRepo: ProductsRepoImpl(
        productsRemoteDataSource: ProductsRemoteDataSourceImpl(
          apiConsumer: getIt<DioConsumer>(),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(
      categoryRepo: CategoryRepoImpl(
        categoryRemoteDataSource: CategoryRemoteDataSourceImpl(
          apiConsumer: getIt<DioConsumer>(),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<GetCategoryProductsUseCase>(
    () => GetCategoryProductsUseCase(
      categoryProductsRepo: CategoryProductsRepoImpl(
        remoteDataSource: CategoryProductsRemoteDataSourceImpl(
          apiConsumer: getIt<DioConsumer>(),
        ),
      ),
    ),
  );
}

Future<void> _setupCaching() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(sharedPreferences),
  );

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  final secureStorage = FlutterSecureStorage(
    aOptions: getAndroidOptions(),
  );

  getIt.registerSingleton<SecureStorageHelper>(
    SecureStorageHelper(secureStorage),
  );

  getIt.registerSingleton<AuthCredentialsManager>(
    AuthCredentialsManager(
        secureStorageHelper: getIt<SecureStorageHelper>(),
        jwtDecoder: JwtDecoderServiceImpl()),
  );
}
