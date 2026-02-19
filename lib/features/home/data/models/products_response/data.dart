import 'pagination.dart';
import 'product_model.dart';

class Data {
  List<ProductModel> products;
  Pagination? pagination;

  Data({required this.products, this.pagination});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: (json['products'] as List<dynamic>)
            .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'products': products.map((e) => e.toJson()).toList(),
        'pagination': pagination?.toJson(),
      };
}
