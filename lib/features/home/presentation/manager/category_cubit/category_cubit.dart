import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:nova_store_app/features/home/presentation/manager/category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoryCubit({required GetCategoriesUseCase getCategoriesUseCase})
      : _getCategoriesUseCase = getCategoriesUseCase,
        super(const CategoryInitial());

  Future<void> getCategories() async {
    emit(const CategoryLoading());
    final result = await _getCategoriesUseCase();
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.errMsg)),
      (categories) => emit(CategorySuccess(categories: categories)),
    );
  }
}
