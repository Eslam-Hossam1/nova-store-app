import 'package:nova_store_app/features/product-details/domain/entities/product_details_entity.dart';
import 'package:nova_store_app/features/product-details/data/models/product_details_model/product_comment_model.dart';
import 'package:nova_store_app/features/product-details/data/models/product_details_model/product_favorite_model.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  
  const ProductDetailsModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.details,
    required super.images,
    required super.price,
    required super.finalPrice,
    required super.discount,
    required super.categoryId,
    required super.stock,
    required super.rateProduct,
    required super.comments,
    required super.isFavorite,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return ProductDetailsModel(
      id: data['_id'] as String,
      userId: data['userId'] as String,
      name: data['name'] as String,
      details: data['details'] as String,
      images: (data['images'] as List<dynamic>)
          .map((e) => (e['url'] as String))
          .toList(),
      price: data['price'] as num,
      finalPrice: data['finalPrice'] as num,
      discount: data['discount'] as num,
      categoryId: data['categoryId'] as String,
      stock: data['stock'] as int,
      rateProduct: data['rateProduct'] as num,
      comments: (data['comments'] as List<dynamic>)
          .map((e) => ProductCommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: checkIsFavourite(data, data['userId'] as String),
    );
  }

  

  static bool checkIsFavourite(Map<String, dynamic> data, final String userId) {
    List<ProductFavoriteModel> favourites = (data['favorites'] as List<dynamic>)
        .map((e) => ProductFavoriteModel.fromJson(e as Map<String, dynamic>))
        .toList();

    for (var favourite in favourites) {
      if (favourite.userId == userId) {
        return true;
      }
    }
    return false;
  }
}
