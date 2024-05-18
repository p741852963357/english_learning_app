import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/api.dart';
import '../../../../core/app_exception.dart';
import '../../../create/data/models/folder_model.dart';
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
      if (response.statusCode == 200) {
        return FolderListModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> deleteFolder(String id) async {
    try {
      final body = jsonEncode({"id": id});
      const endPoint = '/api/folders/delete';
      final response = await http.post(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data['message'];
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FolderModel> editFolder(String id, String title) async {
    try {
      final body = jsonEncode({'id': id, 'title': title});
      const endPoint = '/api/folders/';
      final response = await http.put(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return FolderModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<FolderModel> editTopicsInFolder(List<String> topics, String folder) async {
    try {
      final body = jsonEncode({'topics': topics, 'folder': folder});
      const endPoint = '/api/folders/topics';
      final response = await http.put(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return FolderModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (error) {
      return Future.error(error);
    }
  }
}
