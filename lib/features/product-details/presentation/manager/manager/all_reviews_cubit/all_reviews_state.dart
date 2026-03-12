part of 'all_reviews_cubit.dart';

sealed class AllReviewsState {
  const AllReviewsState();
}

final class AllReviewsLoading extends AllReviewsState {
  const AllReviewsLoading();
}

final class AllReviewsSuccess extends AllReviewsState {
  final List<ProductCommentEntity> comments;
  const AllReviewsSuccess({required this.comments});
}

final class AllReviewsFailure extends AllReviewsState {
  final String errorMessage;
  const AllReviewsFailure({required this.errorMessage});
}
