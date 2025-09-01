import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/errors/error_codes.dart';
import 'package:nova_store_app/core/extensions/string_comapre.dart';
import 'package:nova_store_app/core/utils/user_error_messages.dart';
import 'package:nova_store_app/features/auth/domain/usecases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase _signUpUseCase;
  String email = '';
  SignUpCubit({required SignUpUsecase signUpUsecase})
      : _signUpUseCase = signUpUsecase,
        super(SignUpInitial());
  Future<void> signUp() async {
    emit(SignUpLoading());
    final result = await _signUpUseCase.call(SignUpParams(email: email));
    result.fold(
      (failure) {
        if (failure.errorCode.equalsIgnoreCase(ErrorCodes.validationError)) {
          emit(
            SignUpFailure(
              errMsg: UserErrorMessages.invalidEmail,
            ),
          );
        } else {
          emit(
            SignUpFailure(
              errMsg: failure.errMsg,
            ),
          );
        }
      },
      (succes) => emit(SignUpSuccess()),
    );
  }
}
