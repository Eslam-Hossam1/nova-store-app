import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nova_store_app/core/entities/category_entity.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/errors/dio_api_failure.dart';
import 'package:nova_store_app/features/home/data/datasources/category/category_remote_data_source.dart';
import 'package:nova_store_app/features/home/domain/repos/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepoImpl({required CategoryRemoteDataSource categoryRemoteDataSource})
      : _categoryRemoteDataSource = categoryRemoteDataSource;

  @override
  Future<Either<ApiFailure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await _categoryRemoteDataSource.getCategories();
      return Right(categories);
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
