import 'package:nova_store_app/features/product-details/domain/entities/product_favorite_entity.dart';

class ProductFavoriteModel extends ProductFavoriteEntity {
  const ProductFavoriteModel({required super.userId});

  factory ProductFavoriteModel.fromJson(Map<String, dynamic> json) {
    return ProductFavoriteModel(userId: json['userId'] as String);
  }
}
