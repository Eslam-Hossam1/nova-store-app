import 'package:nova_store_app/core/entities/category_entity.dart';

sealed class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategorySuccess extends CategoryState {
  final List<CategoryEntity> categories;
  const CategorySuccess({required this.categories});
}

class CategoryFailure extends CategoryState {
  final String message;
  const CategoryFailure({required this.message});
}
