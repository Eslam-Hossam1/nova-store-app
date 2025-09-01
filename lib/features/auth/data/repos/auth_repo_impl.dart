import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/errors/dio_api_failure.dart';
import 'package:nova_store_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:nova_store_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl({
    required AuthRemoteDataSource authRemoteDataSource,
  }) : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Either<ApiFailure, void>> login(String email) async {
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
  }

  @override
  Future<Either<ApiFailure, void>> signUp(String email) async {
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
  }
}
