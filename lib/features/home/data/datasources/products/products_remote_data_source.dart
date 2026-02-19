import 'package:nova_store_app/features/home/data/models/products_response/product_model.dart';

abstract interface class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    required int limit,
    required int page,
  });
}
