import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/features/category/domain/entities/category_products_entity.dart';
import 'package:nova_store_app/features/category/domain/params/get_category_products_param.dart';

abstract interface class CategoryProductsRepo {
  Future<Either<ApiFailure, CategoryProductsEntity>> fetchCategoryProducts({
    required GetCategoryProductsParam params,
  });
}
