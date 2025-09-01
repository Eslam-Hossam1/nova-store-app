import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/errors/error_codes.dart';
import 'package:nova_store_app/core/extensions/string_comapre.dart';
import 'package:nova_store_app/core/utils/user_error_messages.dart';
import 'package:nova_store_app/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;
  String email = '';

  LoginCubit({required LoginUsecase loginUsecase})
      : _loginUsecase = loginUsecase,
        super(LoginInitial());
  Future<void> login() async {
    emit(LoginLoading());
    final result = await _loginUsecase.call(LoginParams(email: email));
    result.fold(
      (failure) {
        if (failure.errorCode.equalsIgnoreCase(ErrorCodes.validationError)) {
          emit(
            LoginFailure(
              errMsg: UserErrorMessages.invalidEmail,
            ),
          );
        } else {
          emit(
            LoginFailure(
              errMsg: failure.errMsg,
            ),
          );
        }
      },
      (succes) => emit(LoginSuccess()),
    );
  }
}
