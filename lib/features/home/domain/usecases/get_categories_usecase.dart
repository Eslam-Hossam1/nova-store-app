import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/entities/category_entity.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/usecases/no_param_usecase.dart';
import 'package:nova_store_app/features/home/domain/repos/category_repo.dart';

class GetCategoriesUseCase
    implements NoParamUsecase<ApiFailure, List<CategoryEntity>> {
  final CategoryRepo _categoryRepo;

  GetCategoriesUseCase({required CategoryRepo categoryRepo})
      : _categoryRepo = categoryRepo;

  @override
  Future<Either<ApiFailure, List<CategoryEntity>>> call() {
    return _categoryRepo.getCategories();
  }
}
