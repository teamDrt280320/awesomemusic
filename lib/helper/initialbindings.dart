import 'package:awesomemusic/controllers/downloadscontroller.dart';
import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:get/instance_manager.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DownloadsController(), permanent: true);
    Get.put(SongsController(), permanent: true);
  }
}
