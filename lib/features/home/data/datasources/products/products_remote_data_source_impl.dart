import 'package:nova_store_app/core/api/api_consumer.dart';
import 'package:nova_store_app/core/api/end_points.dart';
import 'package:nova_store_app/features/home/data/datasources/products/products_remote_data_source.dart';
import 'package:nova_store_app/features/home/data/models/products_response/product_model.dart';
import 'package:nova_store_app/features/home/data/models/products_response/products_response.dart';
import 'package:nova_store_app/features/home/domain/params/get_products_param.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProductsRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<List<ProductModel>> getProducts({
    required GetProductsParam getProductsParam,
  }) async {
    final response = await _apiConsumer.get(
      EndPoints.products,
      queryParameters: {
        'limit': getProductsParam.limit,
        'page': getProductsParam.page,
        'category': getProductsParam.category?.id,
        'bestRated': getProductsParam.bestRated,
        'price': getProductsParam.price,
      },
    );
    final ProductsResponse productsResponse =
        ProductsResponse.fromJson(response);
    return productsResponse.data.products;
  }
}
