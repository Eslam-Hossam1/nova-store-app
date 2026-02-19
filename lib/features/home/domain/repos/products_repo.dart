import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';
import 'package:nova_store_app/features/home/domain/params/get_products_param.dart';

abstract class ProductsRepo {
  Future<Either<ApiFailure, List<ProductEntity>>> fetchProducts(
      {required GetProductsParam params});
}
