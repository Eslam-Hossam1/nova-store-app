import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/errors/dio_api_failure.dart';
import 'package:nova_store_app/features/product-details/data/datasources/product_details_remote_data_source/product_details_remote_data_source.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_details_entity.dart';
import 'package:nova_store_app/features/product-details/domain/params/add_comment_param.dart';
import 'package:nova_store_app/features/product-details/domain/params/get_product_details_param.dart';
import 'package:nova_store_app/features/product-details/domain/repos/product_details_repo.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsRemoteDataSource _remoteDataSource;

  ProductDetailsRepoImpl({
    required ProductDetailsRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<ApiFailure, ProductDetailsEntity>> getProductDetails(
    GetProductDetailsParam params,
  ) async {
    try {
      final model = await _remoteDataSource.getProductDetails(params.productId);
      return Right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }

  @override
  Future<Either<ApiFailure, void>> addComment(AddCommentParam params) async {
    try {
      await _remoteDataSource.addComment(params);
      return const Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }
}
