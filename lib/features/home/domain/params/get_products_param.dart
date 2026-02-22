import 'package:nova_store_app/core/entities/category_entity.dart';

class GetProductsParam {
  final int limit;
  final int page;
  final CategoryEntity? category;
  final bool? bestRated;
  final String? price;
  GetProductsParam({
    required this.limit,
    required this.page,
    this.category,
    this.bestRated,
    this.price,
  });
}
