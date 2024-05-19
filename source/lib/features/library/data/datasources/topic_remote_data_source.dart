import 'dart:convert';
import 'package:client/features/create/data/models/topic_model.dart';
import 'package:client/features/library/data/models/public_topic_list_model.dart';
import 'package:client/features/library/data/models/topic_list_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/api.dart';
import '../../../../core/app_exception.dart';

class TopicRemoteDataSource {
  Future<TopicListModel> getTopics(String email) async {
    try {
      const endPoint = '/api/topics/';
      final queryParameters = {'email': email};
      final response = await http.get(
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

  Future<TopicListModel> getPublicTopics(String email) async {
    try {
      const endPoint = '/api/topics/public';
      final queryParameters = {'email': email};
      final response = await http.get(
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

  Future<PublicTopicListModel> getUserPublicTopics(String email) async {
    try {
      const endPoint = '/api/users/public';
      final queryParameters = {'email': email};
      final response = await http.get(
        Uri.parse(
          URL + endPoint,
        ).replace(queryParameters: queryParameters),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return PublicTopicListModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> removeUserPublicTopics(String email, String id) async {
    try {
      const endPoint = '/api/users/public/delete';
      final body = jsonEncode({"id": id, "email": email});
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

  Future<String> deleteTopic(String email, String id) async {
    try {
      final body = jsonEncode({"id": id, "email": email});
      const endPoint = '/api/topics/delete';
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

  Future<PublicTopicListModel> saveTopic(String email, String id) async {
    try {
      final body = jsonEncode({"id": id, "email": email});
      const endPoint = '/api/topics/public';
      final response = await http.post(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return PublicTopicListModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<TopicModel> editTopic(String email, TopicModel topic) async {
    try {
      final body = jsonEncode({"topic": topic.toJson(), "email": email});
      const endPoint = '/api/topics';
      final response = await http.put(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return TopicModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<TopicModel> editTopicVisibility(String email, bool visibility, String topicId) async {
    try {
      final body = jsonEncode({"visibility": visibility, "email": email, "topicId": topicId});
      const endPoint = '/api/topics/visibility';
      final response = await http.put(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return TopicModel.fromJson(data['data']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
