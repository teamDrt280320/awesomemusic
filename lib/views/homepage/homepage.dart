import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:awesomemusic/helper/constants.dart';
import 'package:awesomemusic/helper/size_config.dart';
import 'package:awesomemusic/widgets/song_list.dart' as slist;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var songsControler = Get.find<SongsController>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        clipBehavior: Clip.none,
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Obx(
          () => songsControler.topSongs.list == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StreamBuilder<QueueState>(
                  stream: songsControler.queueStateStream,
                  builder: (context, snapshot) {
                    final queueState = snapshot.data;
                    final queue = queueState?.queue ?? [];
                    final mediaItem = queueState?.mediaItem;
                    return slist.SongList(
                      onPressed: (url) {
                        songsControler.play(url);
                      },
                      songsList: songsControler.topSongs.list!,
                      songsControler: songsControler,
                      queue: queue,
                      mediaItem: mediaItem,
                    );
                  }),
        ),
      ),
    );
  }
}
