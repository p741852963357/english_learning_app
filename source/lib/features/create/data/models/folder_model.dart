import 'package:client/features/library/data/models/topic_list_model.dart';

class FolderModel {
  String title;
  TopicListModel topicList;
  String owner;

  FolderModel(this.title, this.topicList, this.owner);

  FolderModel.fromJson(json)
      : owner = json['owner'],
        title = json['title'],
        topicList = TopicListModel.fromJson(json['topics']);

  Map toJson() => {
        'title': title,
        'topics': topicList.toJson(),
      };
}
