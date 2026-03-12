import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/product-details/domain/params/add_comment_param.dart';
import 'package:nova_store_app/features/product-details/domain/repos/product_details_repo.dart';

class AddCommentUseCase implements Usecase<ApiFailure, void, AddCommentParam> {
  final ProductDetailsRepo _productDetailsRepo;

  AddCommentUseCase({required ProductDetailsRepo productDetailsRepo})
      : _productDetailsRepo = productDetailsRepo;

  @override
  Future<Either<ApiFailure, void>> call(AddCommentParam params) {
    return _productDetailsRepo.addComment(params);
  }
}
