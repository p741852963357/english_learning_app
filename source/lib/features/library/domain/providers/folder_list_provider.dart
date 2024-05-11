import 'package:client/features/library/data/models/folder_list_model.dart';
import 'package:client/features/library/domain/providers/folder_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final folderListProvider = AutoDisposeAsyncNotifierProvider<FolderListNotifier, FolderListModel>(() {
  return FolderListNotifier();
});
