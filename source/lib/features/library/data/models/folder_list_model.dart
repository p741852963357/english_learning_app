import 'dart:convert';

import '../../../create/data/models/folder_model.dart';

class FolderListModel {
  List<FolderModel> folderList;
  FolderListModel(this.folderList);

  int get length => folderList.length;

  FolderModel get(int index) => folderList[index];

  void addTopic(FolderModel topicModel) {
    folderList.add(topicModel);
  }

  factory FolderListModel.fromJson(json) {
    final list = json as List;
    List<FolderModel> topicList = list.map((item) => FolderModel.fromJson(item)).toList();

    return FolderListModel(topicList = topicList);
  }

  Map toJson() => {
        'folders': jsonEncode(folderList),
      };
}
