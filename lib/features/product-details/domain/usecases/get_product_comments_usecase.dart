import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';
import 'package:nova_store_app/features/product-details/domain/params/get_product_comments_param.dart';
import 'package:nova_store_app/features/product-details/domain/repos/product_details_repo.dart';

class GetProductCommentsUseCase
    implements
        Usecase<ApiFailure, List<ProductCommentEntity>,
            GetProductCommentsParam> {
  final ProductDetailsRepo _productDetailsRepo;

  GetProductCommentsUseCase({required ProductDetailsRepo productDetailsRepo})
      : _productDetailsRepo = productDetailsRepo;

  @override
  Future<Either<ApiFailure, List<ProductCommentEntity>>> call(
    GetProductCommentsParam params,
  ) {
    return _productDetailsRepo.getProductComments(params);
  }
}
