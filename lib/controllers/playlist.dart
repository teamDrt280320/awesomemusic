import 'package:awesomemusic/modals/local_playlist.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class PlayListController extends GetxController {
  late Box<LocalPlaylist> localPlaylist;

  @override
  Future<void> onReady() async {
    super.onReady();
    localPlaylist = await Hive.openBox('playlist');
  }
}
