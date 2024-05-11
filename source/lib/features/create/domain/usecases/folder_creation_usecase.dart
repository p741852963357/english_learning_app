import 'package:client/core/local_storage.dart';
import 'package:client/features/create/data/datasources/folder_creation_remote_datasource.dart';

import '../../data/models/folder_model.dart';

class FolderCreationUseCase {
  FolderCreationRemoteDataSource folderCreationRemoteDataSource = FolderCreationRemoteDataSource();

  Future<FolderModel> createFolder(String title) async {
    try {
      LocalStorage localStorage = LocalStorage();
      final email = await localStorage.getUserInfo();
      return await folderCreationRemoteDataSource.createFolder(title, email);
    } catch (e) {
      return Future.error(e);
    }
  }
}
