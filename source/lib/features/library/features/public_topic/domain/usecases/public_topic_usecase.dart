import 'package:client/features/library/features/public_topic/data/datasources/public_topic_remote_data_source.dart';

import '../../../../../../core/local_storage.dart';
import '../../../../data/models/topic_list_model.dart';
import '../../data/models/public_topics_model.dart';

class PublicTopicUseCase {
  PublicTopicRemoteDataSource publicTopicRemoteDataSource = PublicTopicRemoteDataSource();

  Future<PublicTopicsModel> getUserPublicTopics(String email) async {
    try {
      return await publicTopicRemoteDataSource.getPublicTopicsOfUser(email);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> removeUserPublicTopics(String id) async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      return await publicTopicRemoteDataSource.removeUserPublicTopics(email, id);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<TopicListModel> getPublicTopics(String email) async {
    try {
      return await publicTopicRemoteDataSource.getPublicTopics(email);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<PublicTopicsModel> savePublicTopic(String id) async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      return await publicTopicRemoteDataSource.savePublicTopic(email, id);
    } catch (e) {
      return Future.error(e);
    }
  }
}
