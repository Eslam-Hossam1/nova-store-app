import 'package:nova_store_app/features/product-details/domain/entities/product_image_entity.dart';

class ProductImageModel extends ProductImageEntity {
  const ProductImageModel({
    required super.url,
    required super.publicId,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      url: json['url'] as String,
      publicId: json['publicId'] as String,
    );
  }
}
