import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/entities/category_entity.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';

abstract interface class CategoryRepo {
  Future<Either<ApiFailure, List<CategoryEntity>>> getCategories();
}
