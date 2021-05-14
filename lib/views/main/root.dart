import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:awesomemusic/helper/helper.dart';
import 'package:awesomemusic/views/downloads/downloads.dart';
import 'package:awesomemusic/views/homepage/homepage.dart';
import 'package:awesomemusic/views/playlists/playlists.dart';
import 'package:awesomemusic/views/search/search.dart';
import 'package:awesomemusic/widgets/miniplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  SongsController songsControler = Get.find();
  var controller = PageController(
    keepPage: true,
  );
  var currentInddex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<QueueState>(
            stream: songsControler.queueStateStream,
            builder: (context, snapshot) {
              final queueState = snapshot.data;
              final queue = queueState?.queue ?? [];
              final mediaItem = queueState?.mediaItem;
              return queue.isNotEmpty && mediaItem != null
                  ? MiniPlayer(
                      songsControler: songsControler,
                      songDetails: mediaItem,
                      hasNext: mediaItem != queue.last,
                      hasPrvious: mediaItem != queue.first,
                    )
                  : SizedBox.shrink();
            },
          ),
          BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            currentIndex: currentInddex,
            selectedItemColor: Colors.pinkAccent,
            unselectedItemColor: kSecondaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              controller.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.music_note_outlined),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_play_rounded),
                label: 'Playlists',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download_outlined),
                label: 'Downloads',
              ),
            ],
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentInddex = index;
          });
        },
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: [
          HomePage(),
          SearchPage(),
          PlaylistPage(),
          DownloadsPage(),
        ],
      ),
    );
  }
}
