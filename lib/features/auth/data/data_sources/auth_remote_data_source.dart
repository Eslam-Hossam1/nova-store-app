abstract interface class AuthRemoteDataSource{
  Future<void> login({required String email});
  Future<void> signUp({required String email});
}