import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/auth/domain/usecases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase _signUpUseCase;
  SignUpCubit({required SignUpUsecase signUpUsecase})
      : _signUpUseCase = signUpUsecase,
        super(SignUpInitial());
  Future<void> signUp(String email) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase.call(SignUpParams(email: email));
    result.fold(
      (failure) => emit(SignUpFailure(errMsg: failure.errMsg)),
      (succes) => emit(SignUpSuccess(email: email)),
    );
  }
}
