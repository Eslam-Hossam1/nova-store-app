import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';
import 'package:nova_store_app/features/home/domain/params/get_products_param.dart';
import 'package:nova_store_app/features/home/domain/usecases/get_products_usecase.dart';
import 'package:nova_store_app/features/home/presentation/manager/home_products_cubit/home_products_state.dart';

class HomeProductsCubit extends Cubit<HomeProductsState> {
  HomeProductsCubit(this._getProductsUseCase) : super(HomeInitial());
  final GetProductsUseCase _getProductsUseCase;
  List<ProductEntity> products = [];
  int page = 1;
  int limit = 25;
  bool isLoading = false;
  bool hasMoreData = true;

  Future<void> firstFetchProducts() async {
    emit(HomeProductsFirstLoading());
    await fetchProducts();
  }

  Future<void> refreshProducts() async {
    products.clear();
    page = 1;
    hasMoreData = true;
    emit(HomeProductsFirstLoading());

    await fetchProducts();
  }

  Future<void> fetchMoreProducts() async {
    log('fetch more products');
    log('has more data: $hasMoreData');
    if (hasMoreData) {
      emit(HomeProductsLoadingMore());
      await fetchProducts();
    }
  }

  Future<void> fetchProducts() async {
    if (isLoading || !hasMoreData) return;
    isLoading = true;
    var result = await _getProductsUseCase(
      GetProductsParam(
        page: page,
        limit: limit,
      ),
    );
    result.fold(
      (failure) {
        isLoading = false;
        if (products.isEmpty) {
          emit(
            HomeProductsFirstFetchFailure(
              errorMessage: failure.errMsg,
            ),
          );
        } else {
          emit(
            HomeProductsLoadingMoreFailure(
              errorMessage: failure.errMsg,
            ),
          );
        }
      },
      (newProducts) {
        if (newProducts.isEmpty && products.isEmpty) {
          hasMoreData = false;
          isLoading = false;
          emit(HomeProductsEmpty());
          return;
        }

        if (newProducts.length < limit) {
          hasMoreData = false;
        }

        products.addAll(newProducts);
        page += 1;
        isLoading = false;
        emit(HomeProductsSuccess());
      },
    );
  }
}
