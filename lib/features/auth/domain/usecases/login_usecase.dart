import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/network_failure.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/auth/domain/repos/auth_repo.dart';

class LoginUsecase implements Usecase<NetworkFailure,void, LoginParams> {
  final AuthRepo authRepo;

  LoginUsecase({required this.authRepo});

  @override
  Future<Either<NetworkFailure, void>> call(LoginParams params) async {
    return await authRepo.login(params.email);
  }
}

class LoginParams {
  final String email;

  LoginParams({required this.email});
}
