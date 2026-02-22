import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/errors/dio_api_failure.dart';
import 'package:nova_store_app/features/category/data/datasources/category_products_remote_data_source/category_products_remote_data_source.dart';
import 'package:nova_store_app/features/category/domain/entities/category_products_entity.dart';
import 'package:nova_store_app/features/category/domain/params/get_category_products_param.dart';
import 'package:nova_store_app/features/category/domain/repos/category_products_repo.dart';

class CategoryProductsRepoImpl implements CategoryProductsRepo {
  final CategoryProductsRemoteDataSource _remoteDataSource;

  CategoryProductsRepoImpl({
    required CategoryProductsRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<ApiFailure, CategoryProductsEntity>> fetchCategoryProducts({
    required GetCategoryProductsParam params,
  }) async {
    try {
      final model = await _remoteDataSource.getCategoryProducts(params: params);
      return Right(model.toEntity());
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
