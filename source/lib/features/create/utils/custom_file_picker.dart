import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path/path.dart' as p;
import 'package:external_path/external_path.dart';

import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomFilePicker {
  Future<bool> exportToCsv(List<List<String>> data, String title) async {
    try {
      String csvData = const ListToCsvConverter().convert(data);

      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();

      print(statuses[Permission.storage]);

      var dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
      String file = dir;
      File f = File("$file/$title-${DateTime.now()}.csv");
      await f.writeAsString(csvData);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<List<dynamic>>?> pickFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (filePickerResult != null) {
      PlatformFile file = filePickerResult.files.first;
      String? filePath = file.path;
      String name = file.name;
      if (filePath != null) {
        final input = File(filePath).openRead();
        final fields = await input.transform(utf8.decoder).transform(const CsvToListConverter()).toList();
        name = p.basenameWithoutExtension(name);
        fields.insert(0, [name]);
        return fields;
      }
    }
    return null;
  }
}
