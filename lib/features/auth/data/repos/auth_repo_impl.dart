import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nova_store_app/core/api/internet_checker.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/errors/dio_api_failure.dart';

import 'package:nova_store_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:nova_store_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final InternetChecker _internetChecker;

  AuthRepoImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required InternetChecker internetChecker,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _internetChecker = internetChecker;

  @override
  Future<Either<ApiFailure, void>> login(String email) async {
    if (await _internetChecker.isConnected()) {
      try {
        await _authRemoteDataSource.login(email: email);
        return const Right(null);
      } on Exception catch (e) {
        if (e is DioException) {
          return Left(DioApiFailure.fromDioException(e));
        }
        return Left(
          DioApiFailure.unknownException(
            unKnownExceptionMsg: e.toString(),
          ),
        );
      }
    } else {
      return Left(DioApiFailure.noInternetConnection());
    }
  }

  @override
  Future<Either<ApiFailure, void>> signUp(String email) async {
    if (await _internetChecker.isConnected()) {
      try {
        await _authRemoteDataSource.signUp(email: email);
        return const Right(null);
      } on Exception catch (e) {
        if (e is DioException) {
          return Left(DioApiFailure.fromDioException(e));
        }
        return Left(
          DioApiFailure.unknownException(
            unKnownExceptionMsg: e.toString(),
          ),
        );
      }
    } else {
      return  Left(DioApiFailure.noInternetConnection());
    }
  }
}
