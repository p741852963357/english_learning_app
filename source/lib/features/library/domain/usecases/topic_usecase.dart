import 'package:client/features/library/data/datasources/topic_remote_data_source.dart';
import 'package:client/features/library/data/models/topic_list_model.dart';

class TopicUseCase {
  TopicRemoteDataSource topicRemoteDataSource = TopicRemoteDataSource();

  Future<TopicListModel> getTopics(String email) async {
    try {
      return await topicRemoteDataSource.getTopics(email);
    } catch (e) {
      return Future.error(e);
    }
  }
}
