import 'package:client/features/library/features/public_topic/data/models/public_topic_model.dart';

import '../../../../../create/data/models/topic_model.dart';

class PublicTopicsModel {
  List<PublicTopicModel> topicList;

  PublicTopicsModel(this.topicList);

  int get length => topicList.length;

  PublicTopicModel get(int index) => topicList[index];

  bool contains(TopicModel topicModel) {
    for (PublicTopicModel topic in topicList) {
      if (topic.topic.id == topicModel.id) {
        return true;
      }
    }
    return false;
  }

  factory PublicTopicsModel.fromJson(json) {
    final list = json as List;
    List<PublicTopicModel> topicList = list.map((item) => PublicTopicModel.fromJson(item)).toList();
    return PublicTopicsModel(topicList);
  }
}
