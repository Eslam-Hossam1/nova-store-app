import 'package:dartz/dartz.dart';
import 'package:nova_store_app/core/errors/network_failure.dart';
import 'package:nova_store_app/core/usecases/usecase.dart';
import 'package:nova_store_app/features/auth/domain/repos/auth_repo.dart';

class SignUpUsecase implements Usecase<NetworkFailure, void, SignUpParams> {
  final AuthRepo authRepo;

  SignUpUsecase({required this.authRepo});

  @override
  Future<Either<NetworkFailure, void>> call(SignUpParams params) async {
    return await authRepo.signUp(params.email);
  }
}

class SignUpParams {
  final String email;

  SignUpParams({required this.email});
}
