sealed class HomeProductsState {
  const HomeProductsState();
}

final class HomeInitial extends HomeProductsState {}

final class HomeProductsLoadingMore extends HomeProductsState {}

final class HomeProductsFirstLoading extends HomeProductsState {}

final class HomeProductsSuccess extends HomeProductsState {}

final class HomeProductsLoadingMoreFailure extends HomeProductsState {
  final String errorMessage;
  const HomeProductsLoadingMoreFailure({
    required this.errorMessage,
  });
}

final class HomeProductsFirstFetchFailure extends HomeProductsState {
  final String errorMessage;

  const HomeProductsFirstFetchFailure({
    required this.errorMessage,
  });
}

final class HomeProductsEmpty extends HomeProductsState {}
