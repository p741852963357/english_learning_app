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

  Future<UserModel> loginUser(String email, String password) async {
    try {
      return await authenticationRemoteDataSource.loginUser(email, password);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> generateOTP(String email) async {
    try {
      await authenticationRemoteDataSource.generateOTP(email);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> resetPassword(String email, String otp, String newPassword) async {
    try {
      await authenticationRemoteDataSource.resetPassword(email, otp, newPassword);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> changePassword(String email, String currentPassword, String newPassword) async {
    try {
      await authenticationRemoteDataSource.changePassword(email, currentPassword, newPassword);
    } catch (e) {
      return Future.error(e);
    }
  }
}
