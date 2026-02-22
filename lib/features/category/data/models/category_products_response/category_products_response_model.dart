import 'package:nova_store_app/features/category/domain/entities/category_products_entity.dart';
import 'package:nova_store_app/features/home/data/models/products_response/product_model.dart';

/// Maps the API JSON for `data` block of the category products endpoint.
/// Re-uses [ProductModel] since the product shape is identical across endpoints.
class CategoryProductsResponseModel {
  final List<ProductModel> products;
  final int totalProducts;
  final int currentPage;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  const CategoryProductsResponseModel({
    required this.products,
    required this.totalProducts,
    required this.currentPage,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory CategoryProductsResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    final pagination = data['pagination'] as Map<String, dynamic>;

    return CategoryProductsResponseModel(
      products: (data['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalProducts: pagination['totalProducts'] as int,
      currentPage: pagination['currentPage'] as int,
      totalPages: pagination['totalPages'] as int,
      hasNext: pagination['hasNext'] as bool,
      hasPrev: pagination['hasPrev'] as bool,
    );
  }

  /// Converts to the domain entity, mapping each [ProductModel] → [ProductEntity].
  CategoryProductsEntity toEntity() {
    return CategoryProductsEntity(
      products: products.map((e) => e.toEntity()).toList(),
      totalProducts: totalProducts,
      currentPage: currentPage,
      totalPages: totalPages,
      hasNext: hasNext,
      hasPrev: hasPrev,
    );
  }
}
