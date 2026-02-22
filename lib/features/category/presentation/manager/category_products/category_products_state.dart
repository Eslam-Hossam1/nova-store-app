part of 'category_products_cubit.dart';

sealed class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsLoadingMore extends CategoryProductsState {}

final class CategoryProductsFirstLoading extends CategoryProductsState {}

final class CategoryProductsSuccess extends CategoryProductsState {}

final class CategoryProductsLoadingMoreFailure extends CategoryProductsState {
  final String errorMessage;
  CategoryProductsLoadingMoreFailure({
    required this.errorMessage,
  });
}

final class CategoryProductsFirstFetchFailure extends CategoryProductsState {
  final String errorMessage;

  CategoryProductsFirstFetchFailure({
    required this.errorMessage,
  });
}

final class CategoryProductsEmpty extends CategoryProductsState {}
