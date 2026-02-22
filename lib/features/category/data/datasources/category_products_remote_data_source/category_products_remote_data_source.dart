import 'package:nova_store_app/features/category/data/models/category_products_response/category_products_response_model.dart';
import 'package:nova_store_app/features/category/domain/params/get_category_products_param.dart';

abstract interface class CategoryProductsRemoteDataSource {
  Future<CategoryProductsResponseModel> getCategoryProducts({
    required GetCategoryProductsParam params,
  });
}
