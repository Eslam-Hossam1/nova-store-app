import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_details_entity.dart';
import 'package:nova_store_app/features/product-details/domain/params/get_product_details_param.dart';

abstract interface class ProductDetailsRepo {
  Future<Either<ApiFailure, ProductDetailsEntity>> getProductDetails(
    GetProductDetailsParam params,
  );
}
