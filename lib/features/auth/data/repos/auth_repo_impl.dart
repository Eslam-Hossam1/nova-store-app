import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nova_store_app/core/api/internet_checker.dart';
import 'package:nova_store_app/core/errors/dio_api_failure.dart';
import 'package:nova_store_app/core/errors/network_failure.dart';
import 'package:nova_store_app/core/errors/no_internet_connection_failure.dart';
import 'package:nova_store_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:nova_store_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final InternetChecker _internetChecker;

  AuthRepoImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required InternetChecker internetConnectionChecker,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _internetChecker = internetConnectionChecker;

  @override
  Future<Either<NetworkFailure, void>> login(String email) async {
    if (await _internetChecker.isConnected()) {
      try {
        await _authRemoteDataSource.login(email: email);
        return const Right(null);
      } on Exception catch (e) {
        if (e is DioException) {
          return Left(DioApiFailure.fromDioException(e));
        }
        return Left(
          NetworkFailure.unknown(
            unKnownExceptionMsg: e.toString(),
          ),
        );
      }
    } else {
      return const Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<NetworkFailure, void>> signUp(String email) async {
    if (await _internetChecker.isConnected()) {
      try {
        await _authRemoteDataSource.signUp(email: email);
        return const Right(null);
      } on Exception catch (e) {
        if (e is DioException) {
          return Left(DioApiFailure.fromDioException(e));
        }
        return Left(
          NetworkFailure.unknown(
            unKnownExceptionMsg: e.toString(),
          ),
        );
      }
    } else {
      return const Left(NoInternetConnectionFailure());
    }
  }
}
