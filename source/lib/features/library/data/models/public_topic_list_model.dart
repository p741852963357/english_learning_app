import 'package:client/features/library/data/models/public_topic_model.dart';
import '../../../create/data/models/topic_model.dart';

class PublicTopicListModel {
  List<PublicTopicModel> topicList;

  PublicTopicListModel(this.topicList);

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

  factory PublicTopicListModel.fromJson(json) {
    final list = json as List;
    List<PublicTopicModel> topicList = list.map((item) => PublicTopicModel.fromJson(item)).toList();
    return PublicTopicListModel(topicList);
  }
}
