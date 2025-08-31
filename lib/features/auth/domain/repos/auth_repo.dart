import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';

abstract interface class AuthRepo {
  Future<Either<ApiFailure, void>> login(
    String email,
  );
  Future<Either<ApiFailure, void>> signUp(
    String email,
  );
}
