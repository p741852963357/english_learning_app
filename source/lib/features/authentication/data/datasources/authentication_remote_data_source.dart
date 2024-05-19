import 'dart:convert';

import 'package:client/core/api.dart';
import 'package:client/core/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:client/features/authentication/data/models/user_model.dart';

class AuthenticationRemoteDataSource {
  Future<UserModel> createUser(UserModel userModel) async {
    try {
      const endPoint = '/api/users';
      final user = jsonEncode(userModel.toJson());
      final response = await http.post(
        Uri.parse(URL + endPoint),
        body: user,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return UserModel.fromJson(data['user']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
  
  Future<UserModel> loginUser(String email, String password) async {
    try {
      const endPoint = '/api/users/login';
      final body = jsonEncode({
        'email': email,
        'password': password,
      });
      final response = await http.post(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromJson(data['user']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> generateOTP(String email) async {
    try {
      const endPoint = '/api/users/generate-otp';
      final body = jsonEncode({'email': email});
      final response = await http.post(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> resetPassword(String email, String otp, String newPassword) async {
    try {
      const endPoint = '/api/users/reset-password';
      final body = jsonEncode({
        'email': email,
        'OTP': otp,
        'newPassword': newPassword,
      });
      final response = await http.post(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

}
