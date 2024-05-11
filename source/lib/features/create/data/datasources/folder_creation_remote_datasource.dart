import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:client/features/create/data/models/folder_model.dart';

import '../../../../core/api.dart';
import '../../../../core/app_exception.dart';

class FolderCreationRemoteDataSource {
  Future<FolderModel> createFolder(String title, String email) async {
    try {
      final body = jsonEncode({"title": title, "email": email});
      const endPoint = '/api/folders';
      final response = await http.post(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return FolderModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
