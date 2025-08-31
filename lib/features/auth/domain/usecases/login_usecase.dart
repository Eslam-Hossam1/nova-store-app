import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/api_failure.dart';
import 'package:nova_store_app/core/errors/failures.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/auth/domain/repos/auth_repo.dart';

class LoginUsecase implements Usecase<ApiFailure,void, LoginParams> {
  final AuthRepo authRepo;

  LoginUsecase({required this.authRepo});

  @override
  Future<Either<ApiFailure, void>> call(LoginParams params) async {
    return await authRepo.login(params.email);
  }
}

class LoginParams {
  final String email;

  LoginParams({required this.email});
}
