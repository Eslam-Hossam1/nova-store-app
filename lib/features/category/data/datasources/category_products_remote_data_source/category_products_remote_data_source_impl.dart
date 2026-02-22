import 'package:nova_store_app/core/api/api_consumer.dart';
import 'package:nova_store_app/core/api/end_points.dart';
import 'package:nova_store_app/features/category/data/datasources/category_products_remote_data_source/category_products_remote_data_source.dart';
import 'package:nova_store_app/features/category/data/models/category_products_response/category_products_response_model.dart';
import 'package:nova_store_app/features/category/domain/params/get_category_products_param.dart';

class CategoryProductsRemoteDataSourceImpl
    implements CategoryProductsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CategoryProductsRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<CategoryProductsResponseModel> getCategoryProducts({
    required GetCategoryProductsParam params,
  }) async {
    final response = await _apiConsumer.get(
      EndPoints.products,
      queryParameters: {
        'page': params.page,
        'limit': params.limit,
        'category': params.category.id,
      },
    );
    return CategoryProductsResponseModel.fromJson(response);
  }
}
