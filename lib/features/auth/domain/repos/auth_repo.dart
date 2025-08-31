import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/network_failure.dart';

abstract interface class AuthRepo {
  Future<Either<NetworkFailure, void>> login(
    String email,
  );
  Future<Either<NetworkFailure, void>> signUp(
    String email,
  );
}
