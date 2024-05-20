import 'dart:convert';

import 'package:http/http.dart';

import '../../../../../../core/api.dart';
import '../../../../../../core/app_exception.dart';
import '../../../../data/models/topic_list_model.dart';
import '../models/public_topics_model.dart';

class PublicTopicRemoteDataSource {
  Future<TopicListModel> getPublicTopics(String email) async {
    try {
      const endPoint = '/api/topics/public';
      final queryParameters = {'email': email};
      final response = await get(
        Uri.parse(
          URL + endPoint,
        ).replace(queryParameters: queryParameters),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return TopicListModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<PublicTopicsModel> getPublicTopicsOfUser(String email) async {
    try {
      const endPoint = '/api/users/public';
      final queryParameters = {'email': email};
      final response = await get(
        Uri.parse(
          URL + endPoint,
        ).replace(queryParameters: queryParameters),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return PublicTopicsModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> removeUserPublicTopics(String email, String id) async {
    try {
      const endPoint = '/api/topics/public/delete';
      final body = jsonEncode({"id": id, "email": email});
      final response = await post(
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

  Future<PublicTopicsModel> savePublicTopic(String email, String id) async {
    try {
      final body = jsonEncode({"id": id, "email": email});
      const endPoint = '/api/topics/public';
      final response = await post(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return PublicTopicsModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
