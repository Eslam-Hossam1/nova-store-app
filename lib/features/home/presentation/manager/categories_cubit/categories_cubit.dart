import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:nova_store_app/features/home/presentation/manager/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesCubit({required GetCategoriesUseCase getCategoriesUseCase})
      : _getCategoriesUseCase = getCategoriesUseCase,
        super(const CategoriesInitial());

  Future<void> getCategories() async {
    emit(const CategoriesLoading());
    final result = await _getCategoriesUseCase();
    result.fold(
      (failure) => emit(CategoriesFailure(message: failure.errMsg)),
      (categories) => emit(CategoriesSuccess(categories: categories)),
    );
  }
}
