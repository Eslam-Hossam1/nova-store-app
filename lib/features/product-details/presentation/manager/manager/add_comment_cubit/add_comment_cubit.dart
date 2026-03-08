import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/product-details/domain/params/add_comment_param.dart';
import 'package:nova_store_app/features/product-details/domain/usecases/add_comment_usecase.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  final AddCommentUseCase _addCommentUseCase;

  AddCommentCubit({required AddCommentUseCase addCommentUseCase})
      : _addCommentUseCase = addCommentUseCase,
        super(const AddCommentInitial());

  Future<void> addComment(AddCommentParam params) async {
    emit(const AddCommentLoading());
    final result = await _addCommentUseCase(params);
    result.fold(
      (failure) => emit(AddCommentFailure(errorMessage: failure.errMsg)),
      (_) => emit(const AddCommentSuccess()),
    );
  }
}
