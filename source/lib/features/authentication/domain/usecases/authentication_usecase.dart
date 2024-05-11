import 'package:client/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:client/features/authentication/data/models/user_model.dart';

class AuthenticationUseCase {
  AuthenticationRemoteDataSource authenticationRemoteDataSource = AuthenticationRemoteDataSource();

  Future<UserModel> createUser(String email, String password) async {
    try {
      return await authenticationRemoteDataSource.createUser(UserModel(email, password));
    } catch (e) {
      return Future.error(e);
    }
  }
}
