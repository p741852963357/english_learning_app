import 'package:client/core/local_storage.dart';
import 'package:client/features/library/data/datasources/folder_remote_data_source.dart';

import '../../data/models/folder_list_model.dart';

class FolderUseCase {
  FolderRemoteDataSource folderRemoteDataSource = FolderRemoteDataSource();

  Future<FolderListModel> getFolders() async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      return await folderRemoteDataSource.getFolders(email);
    } catch (e) {
      return Future.error(e);
    }
  }
}
