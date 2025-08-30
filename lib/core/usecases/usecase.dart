import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/failures.dart';

abstract interface  class Usecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
