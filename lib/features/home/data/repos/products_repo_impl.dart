import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/errors/dio_api_failure.dart';
import 'package:nova_store_app/features/home/data/datasources/products/products_remote_data_source.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';
import 'package:nova_store_app/features/home/domain/params/get_products_param.dart';
import 'package:nova_store_app/features/home/domain/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  ProductsRepoImpl({required ProductsRemoteDataSource productsRemoteDataSource})
      : _productsRemoteDataSource = productsRemoteDataSource;

  @override
  Future<Either<ApiFailure, List<ProductEntity>>> fetchProducts({
    required GetProductsParam params,
  }) async {
    try {
      final products = await _productsRemoteDataSource.getProducts(
        limit: params.limit,
        page: params.page,
      );
      return Right(products.map((e) => e.toEntity()).toList());
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
          DioApiFailure.fromDioException(e),
        );
      }
      return Left(
        DioApiFailure.unknownException(
          unKnownExceptionMsg: e.toString(),
        ),
      );
    }
  }
}
