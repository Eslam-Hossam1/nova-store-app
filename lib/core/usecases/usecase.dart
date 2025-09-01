import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/failures.dart';

abstract interface class Usecase<FailureType extends Failure, T, Params> {
  Future<Either<FailureType, T>> call(Params params);
}
