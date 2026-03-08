part of 'product_details_cubit.dart';

sealed class ProductDetailsState {
  const ProductDetailsState();
}

final class ProductDetailsInitial extends ProductDetailsState {
  const ProductDetailsInitial();
}

final class ProductDetailsLoading extends ProductDetailsState {
  const ProductDetailsLoading();
}

final class ProductDetailsSuccess extends ProductDetailsState {
  const ProductDetailsSuccess();
}

final class ProductDetailsFailure extends ProductDetailsState {
  final String errorMessage;
  const ProductDetailsFailure({required this.errorMessage});
}
