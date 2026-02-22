import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/entities/category_entity.dart';
import 'package:nova_store_app/features/category/domain/params/get_category_products_param.dart';
import 'package:nova_store_app/features/category/domain/usecases/get_category_products_usecase.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit({
    required this.categoryEntity,
    required GetCategoryProductsUseCase getCategoryProductsUseCase,
  })  : _getCategoryProductsUseCase = getCategoryProductsUseCase,
        super(CategoryProductsInitial());

  final CategoryEntity categoryEntity;
  final GetCategoryProductsUseCase _getCategoryProductsUseCase;

  List<ProductEntity> products = [];
  int totalProducts = 0;
  int page = 1;
  final int limit = 25;
  bool isLoading = false;
  bool hasMoreData = true;

  Future<void> firstFetchProducts() async {
    emit(CategoryProductsFirstLoading());
    await _fetchProducts();
  }

  Future<void> refreshProducts() async {
    products.clear();
    totalProducts = 0;
    page = 1;
    hasMoreData = true;
    emit(CategoryProductsFirstLoading());
    await _fetchProducts();
  }

  Future<void> fetchMoreProducts() async {
    if (hasMoreData) {
      emit(CategoryProductsLoadingMore());
      await _fetchProducts();
    }
  }

  Future<void> _fetchProducts() async {
    if (isLoading || !hasMoreData) return;
    isLoading = true;

    final result = await _getCategoryProductsUseCase(
      GetCategoryProductsParam(
        page: page,
        limit: limit,
        category: categoryEntity,
      ),
    );

    result.fold(
      (failure) {
        isLoading = false;
        if (products.isEmpty) {
          emit(CategoryProductsFirstFetchFailure(errorMessage: failure.errMsg));
        } else {
          emit(
              CategoryProductsLoadingMoreFailure(errorMessage: failure.errMsg));
        }
      },
      (categoryProducts) {
        if (categoryProducts.products.isEmpty && products.isEmpty) {
          hasMoreData = false;
          isLoading = false;
          emit(CategoryProductsEmpty());
          return;
        }

        hasMoreData = categoryProducts.hasNext;
        totalProducts = categoryProducts.totalProducts;
        products.addAll(categoryProducts.products);
        page += 1;
        isLoading = false;
        emit(CategoryProductsSuccess());
      },
    );
  }
}
