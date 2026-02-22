import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';

class CategoryProductsEntity {
  final List<ProductEntity> products;
  final int totalProducts;
  final int currentPage;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  const CategoryProductsEntity({
    required this.products,
    required this.totalProducts,
    required this.currentPage,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });
}
