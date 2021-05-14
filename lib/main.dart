import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/helper/initialbindings.dart';
import 'package:awesomemusic/helper/themes.dart';
import 'package:awesomemusic/views/main/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'views/homepage/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          ),
          child: RootPage(),
        ),
      ),
    );
  }
}
