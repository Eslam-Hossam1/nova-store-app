class ProductCommentEntity {
  final String userId;
  final int rate;
  final String comment;

  const ProductCommentEntity({
    required this.userId,
    required this.rate,
    required this.comment,
  });
}
