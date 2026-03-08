import 'package:nova_store_app/core/api/api_consumer.dart';
import 'package:nova_store_app/core/api/end_points.dart';
import 'package:nova_store_app/features/product-details/data/datasources/product_details_remote_data_source/product_details_remote_data_source.dart';
import 'package:nova_store_app/features/product-details/data/models/product_details_model/product_details_model.dart';
import 'package:nova_store_app/features/product-details/domain/params/add_comment_param.dart';

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProductDetailsRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<ProductDetailsModel> getProductDetails(String productId) async {
    final response = await _apiConsumer.get(
      EndPoints.getProductDetails(productId),
    );
    return ProductDetailsModel.fromJson(response);
  }

  @override
  Future<void> addComment(AddCommentParam params) async {
    await _apiConsumer.post(
      EndPoints.addComment(params.productId),
      data: {
        'comment': params.comment,
        'rate': params.rate,
      },
    );
  }
}
