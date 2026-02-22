import 'package:nova_store_app/features/home/data/models/products_response/product_model.dart';
import 'package:nova_store_app/features/home/domain/params/get_products_param.dart';

abstract interface class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    required GetProductsParam getProductsParam,
  });
}
