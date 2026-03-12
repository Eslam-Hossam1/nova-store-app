import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';

class ProductDetailsEntity {
  final String id;
  final String userId;
  final String name;
  final String details;
  final List<String> images;
  final num price;
  final num finalPrice;
  final num discount;
  final String categoryId;
  final int stock;
  final num rateProduct;
  final List<ProductCommentEntity> comments;
  final bool isFavorite;

  const ProductDetailsEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.details,
    required this.images,
    required this.price,
    required this.finalPrice,
    required this.discount,
    required this.categoryId,
    required this.stock,
    required this.rateProduct,
    required this.comments,
    required this.isFavorite,
  });
}
