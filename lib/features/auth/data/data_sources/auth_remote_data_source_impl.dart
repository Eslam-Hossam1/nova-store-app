import 'package:nova_store_app/core/api/api_consumer.dart';
import 'package:nova_store_app/core/api/api_keys.dart';
import 'package:nova_store_app/core/api/end_points.dart';
import 'package:nova_store_app/features/auth/data/data_sources/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AuthRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  /// Common method for both login and sign up
  Future<void> _auth({required String email}) async {
    await _apiConsumer.post(
      EndPoints.auth,
      data: {
        ApiKeys.email: email,
        ApiKeys.isAdmin: false,
      },
    );
  }

  @override
  Future<void> login({required String email}) => _auth(email: email);

  @override
  Future<void> signUp({required String email}) => _auth(email: email);
}
