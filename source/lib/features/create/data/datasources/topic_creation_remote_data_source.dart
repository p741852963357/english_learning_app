import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/api.dart';
import '../../../../core/app_exception.dart';
import '../models/topic_model.dart';

class TopicCreationRemoteDaraSource {
  Future<TopicModel> createTopic(TopicModel topicModel) async {
    try {
      const endPoint = '/api/topics';
      final topic = jsonEncode(topicModel.toJson());
      final response = await http.post(
        Uri.parse(URL + endPoint),
        body: topic,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return TopicModel.fromJson(data['topic']);
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
