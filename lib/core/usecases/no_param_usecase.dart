import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/failures.dart';

abstract interface class NoParamUsecase<FailureType extends Failure, T> {
  Future<Either<FailureType, T>> call();
}
