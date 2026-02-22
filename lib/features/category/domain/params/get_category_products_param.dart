import 'package:nova_store_app/core/entities/category_entity.dart';

class GetCategoryProductsParam {
  final int page;
  final int limit;
  final CategoryEntity category;

  const GetCategoryProductsParam({
    required this.page,
    required this.limit,
    required this.category,
  });
}
