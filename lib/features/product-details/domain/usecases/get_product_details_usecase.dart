import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_details_entity.dart';
import 'package:nova_store_app/features/product-details/domain/params/get_product_details_param.dart';
import 'package:nova_store_app/features/product-details/domain/repos/product_details_repo.dart';

class GetProductDetailsUseCase
    implements
        Usecase<ApiFailure, ProductDetailsEntity, GetProductDetailsParam> {
  final ProductDetailsRepo _productDetailsRepo;

  GetProductDetailsUseCase({required ProductDetailsRepo productDetailsRepo})
      : _productDetailsRepo = productDetailsRepo;

  @override
  Future<Either<ApiFailure, ProductDetailsEntity>> call(
    GetProductDetailsParam params,
  ) {
    return _productDetailsRepo.getProductDetails(params);
  }
}
