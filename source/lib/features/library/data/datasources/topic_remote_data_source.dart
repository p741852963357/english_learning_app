import 'dart:convert';
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
}
