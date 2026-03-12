import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';
import 'package:nova_store_app/features/product-details/domain/params/get_product_comments_param.dart';
import 'package:nova_store_app/features/product-details/domain/usecases/get_product_comments_usecase.dart';

part 'all_reviews_state.dart';

class AllReviewsCubit extends Cubit<AllReviewsState> {
  final GetProductCommentsUseCase _getProductCommentsUseCase;
  final String productId;

  AllReviewsCubit({
    required GetProductCommentsUseCase getProductCommentsUseCase,
    required this.productId,
  })  : _getProductCommentsUseCase = getProductCommentsUseCase,
        super(const AllReviewsLoading());

  Future<void> getProductComments() async {
    emit(const AllReviewsLoading());
    final result = await _getProductCommentsUseCase(
      GetProductCommentsParam(productId: productId),
    );
    result.fold(
      (failure) => emit(AllReviewsFailure(errorMessage: failure.errMsg)),
      (comments) => emit(AllReviewsSuccess(comments: comments)),
    );
  }
}
