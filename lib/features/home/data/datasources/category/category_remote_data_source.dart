import 'package:nova_store_app/core/api/api_consumer.dart';
import 'package:nova_store_app/core/api/end_points.dart';
import 'package:nova_store_app/features/home/data/models/category_model.dart';

abstract interface class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CategoryRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiConsumer.get(EndPoints.categories);
    final List<dynamic> categoriesJson = response['data']['category'];
    return categoriesJson.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
