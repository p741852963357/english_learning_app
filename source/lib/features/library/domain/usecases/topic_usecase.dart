import 'package:client/core/local_storage.dart';
import 'package:client/features/create/data/models/topic_model.dart';
import 'package:client/features/library/data/datasources/topic_remote_data_source.dart';
import 'package:client/features/library/data/models/public_topic_list_model.dart';
import 'package:client/features/library/data/models/topic_list_model.dart';

import '../../../create/data/models/vocabulary_model.dart';

class TopicUseCase {
  TopicRemoteDataSource topicRemoteDataSource = TopicRemoteDataSource();

  Future<TopicListModel> getTopics(String email) async {
    try {
      return await topicRemoteDataSource.getTopics(email);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<PublicTopicListModel> getUserPublicTopics(String email) async {
    try {
      return await topicRemoteDataSource.getUserPublicTopics(email);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> removeUserPublicTopics(String id) async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      return await topicRemoteDataSource.removeUserPublicTopics(email, id);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<TopicListModel> getPublicTopics(String email) async {
    try {
      return await topicRemoteDataSource.getPublicTopics(email);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> deleteTopic(String id) async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      return await topicRemoteDataSource.deleteTopic(email, id);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<PublicTopicListModel> saveTopic(String id) async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      return await topicRemoteDataSource.saveTopic(email, id);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<TopicModel> editTopic(String title, List<VocabularyModel> vocabularies, String id) async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      return await topicRemoteDataSource.editTopic(email, TopicModel(title: title, vocabularies: vocabularies, owner: email, id: id));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<TopicModel> editTopicVisibility(TopicModel topic, bool visibility) async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      return await topicRemoteDataSource.editTopicVisibility(email, visibility, topic.id!);
    } catch (e) {
      return Future.error(e);
    }
  }
}
