import 'package:client/core/local_storage.dart';
import 'package:client/features/create/data/models/folder_model.dart';
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

  Future<String> deleteFolder(String id) async {
    try {
      return await folderRemoteDataSource.deleteFolder(id);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FolderModel> editFolder(String id, String title) async {
    try {
      return await folderRemoteDataSource.editFolder(id, title);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<FolderModel> editTopicsInFolder(List<String> topics, String folder) async {
    try {
      return await folderRemoteDataSource.editTopicsInFolder(topics, folder);
    } catch (error) {
      return Future.error(error);
    }
  }
}
