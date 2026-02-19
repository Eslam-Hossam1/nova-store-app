import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';
import 'package:nova_store_app/features/home/domain/params/get_products_param.dart';
import 'package:nova_store_app/features/home/domain/repos/products_repo.dart';

class GetProductsUseCase
    implements Usecase<ApiFailure, List<ProductEntity>, GetProductsParam> {
  final ProductsRepo _productsRepo;

  GetProductsUseCase({required ProductsRepo productsRepo})
      : _productsRepo = productsRepo;

  @override
  Future<Either<ApiFailure, List<ProductEntity>>> call(
      GetProductsParam params) {
    return _productsRepo.fetchProducts(params: params);
  }
}
