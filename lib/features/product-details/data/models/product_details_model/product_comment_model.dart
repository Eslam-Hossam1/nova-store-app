import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';

class ProductCommentModel extends ProductCommentEntity {
  const ProductCommentModel({
    required super.userId,
    required super.rate,
    required super.comment,
  });

  factory ProductCommentModel.fromJson(Map<String, dynamic> json) {
    return ProductCommentModel(
      userId: json['userId'] as String,
      rate: json['rate'] as int,
      comment: json['comment'] as String,
    );
  }
}
