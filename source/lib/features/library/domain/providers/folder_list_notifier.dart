import 'package:client/features/library/data/models/folder_list_model.dart';
import 'package:client/features/library/domain/usecases/folder_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FolderListNotifier extends AutoDisposeAsyncNotifier<FolderListModel> {
  Future<FolderListModel> getData() async {
    return await FolderUseCase().getFolders();
  }

  @override
  Future<FolderListModel> build() {
    return getData();
  }

  void refresh() {
    ref.invalidateSelf();
  }
}
