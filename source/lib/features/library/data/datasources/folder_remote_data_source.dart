import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/api.dart';
import '../../../../core/app_exception.dart';
import '../models/folder_list_model.dart';

class FolderRemoteDataSource {
  Future<FolderListModel> getFolders(String email) async {
    try {
      const endPoint = '/api/folders';
      final queryParameters = {'email': email};
      final response = await http.get(
        Uri.parse(
          URL + endPoint,
        ).replace(queryParameters: queryParameters),
      );
      final data = jsonDecode(response.body);

      print(data);
      if (response.statusCode == 200) {
        return FolderListModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
