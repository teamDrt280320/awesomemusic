import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/helper/initialbindings.dart';
import 'package:awesomemusic/helper/themes.dart';
import 'package:awesomemusic/modals/local_playlist.dart';
import 'package:awesomemusic/views/main/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(LocalPlaylistAdapter());
  Hive.registerAdapter(CustSongItemAdapter());
  await Hive.initFlutter();
  runApp(AwesomeMusic());
}

class AwesomeMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      title: 'Awesome Music',
      theme: theme(),
      home: AudioServiceWidget(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
          ),
          child: RootPage(),
        ),
      ),
    );
  }
}
