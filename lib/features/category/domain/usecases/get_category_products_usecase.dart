import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/category/domain/entities/category_products_entity.dart';
import 'package:nova_store_app/features/category/domain/params/get_category_products_param.dart';
import 'package:nova_store_app/features/category/domain/repos/category_products_repo.dart';

class GetCategoryProductsUseCase
    implements
        Usecase<ApiFailure, CategoryProductsEntity, GetCategoryProductsParam> {
  final CategoryProductsRepo _categoryProductsRepo;

  GetCategoryProductsUseCase(
      {required CategoryProductsRepo categoryProductsRepo})
      : _categoryProductsRepo = categoryProductsRepo;

  @override
  Future<Either<ApiFailure, CategoryProductsEntity>> call(
      GetCategoryProductsParam params) {
    return _categoryProductsRepo.fetchCategoryProducts(params: params);
  }
}
