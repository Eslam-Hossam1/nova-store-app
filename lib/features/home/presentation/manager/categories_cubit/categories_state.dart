import 'package:nova_store_app/core/entities/category_entity.dart';

sealed class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryEntity> categories;
  const CategoriesSuccess({required this.categories});
}

class CategoriesFailure extends CategoriesState {
  final String message;
  const CategoriesFailure({required this.message});
}
