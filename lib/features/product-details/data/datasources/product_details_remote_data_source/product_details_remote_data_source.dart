import 'package:nova_store_app/features/product-details/data/models/product_details_model/product_details_model.dart';

abstract interface class ProductDetailsRemoteDataSource {
  Future<ProductDetailsModel> getProductDetails(String productId);
}
