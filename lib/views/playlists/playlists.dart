import 'package:awesomemusic/controllers/playlist.dart';
import 'package:awesomemusic/modals/local_playlist.dart';
import 'package:awesomemusic/widgets/thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PlaylistPage extends StatefulWidget {
  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  PlayListController _playListController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<LocalPlaylist>>(
      valueListenable: _playListController.localPlaylist.listenable(),
      builder: (context, box, child) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Thumbnail(image: box.getAt(index)!.imageUrl!),
              title: Text(box.getAt(index)!.title),
              subtitle: Text(
                  box.getAt(index)!.songList.length.toString() + ' Song/s'),
            );
          },
        );
      },
    );
  }
}
