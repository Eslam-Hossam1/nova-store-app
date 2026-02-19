import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';

class ProductModel {
  String id;
  String name;
  List<String> images;
  int price;
  int finalPrice;
  int discount;
  int stock;
  int rateProduct;
  List<dynamic> favorites;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.finalPrice,
    required this.discount,
    required this.stock,
    required this.rateProduct,
    required this.favorites,
    required this.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        images: (json['images'] as List<dynamic>)
            .map((e) => e['url'] as String)
            .toList(),
        price: json['price'] as int,
        finalPrice: json['finalPrice'] as int,
        discount: json['discount'] as int,
        stock: json['stock'] as int,
        rateProduct: json['rateProduct'] as int,
        favorites: json['favorites'] as List<dynamic>,
        isFavorite: json['isFavorite'] as bool,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'images': images,
        'price': price,
        'finalPrice': finalPrice,
        'discount': discount,
        'stock': stock,
        'rateProduct': rateProduct,
        'favorites': favorites,
        'isFavorite': isFavorite,
      };

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      images: images,
      price: price,
      finalPrice: finalPrice,
      discount: discount,
      stock: stock,
      rateProduct: rateProduct,
      isFavorite: isFavorite,
    );
  }
}
