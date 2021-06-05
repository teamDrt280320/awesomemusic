import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

class DownloadsController extends GetxController {
  RxList<io.FileSystemEntity> file = <io.FileSystemEntity>[].obs;
  late String directory;
  getFilesList() async {
    directory = await _findLocalPath();
    file.clear();
    file.addAll(io.Directory("$directory").listSync());
  }

  Future<String> _findLocalPath() async {
    return io.Platform.isAndroid
        ? (await getExternalStorageDirectories(
                type: StorageDirectory.downloads))!
            .first
            .path
        : (await getApplicationDocumentsDirectory()).path +
            io.Platform.pathSeparator +
            'Download';
  }

  @override
  Future<void> onInit() async {
    if (!kIsWeb) {
      await getFilesList();
      final savedDir = io.Directory(directory);
      bool hasExisted = await savedDir.exists();
      if (!hasExisted) {
        savedDir.create();
      }
    }
    super.onInit();
  }
}
