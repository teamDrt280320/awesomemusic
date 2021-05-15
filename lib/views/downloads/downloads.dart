import 'dart:io';
import 'package:awesomemusic/helper/extensions.dart';
import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/controllers/downloadscontroller.dart';
import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesomemusic/helper/extensions.dart';

class DownloadsPage extends StatefulWidget {
  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  SongsController _songsController = Get.find();
  DownloadsController _downloadsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<FileSystemEntity> list = _downloadsController.file
          .where(
            (files) => files.path.endsWith('.m4a'),
          )
          .toList();
      return Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            FileSystemEntity file = list[index];
            return ListTile(
              onTap: () async {
                _songsController.playViaFile(file.path);
              },
              title: Text(
                '${file.path.split('/Download/').last.replaceAll('.m4a', '').sanitize()}',
              ),
              leading: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(file.path.replaceAll('.m4a', '_artwork.jpg')),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              subtitle: Text('Downloaded'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Are you sure?',
                          ),
                          content: Text(
                              'Are you sure you want to delete this song? This process is irreversible.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                _downloadsController.getFilesList();
                                var path = file.path;
                                var tag = await _songsController.tagger
                                    .readTags(path: path);

                                var media = MediaItem(
                                  id: path,
                                  album: tag?.album ?? '',
                                  title: tag?.title ?? '',
                                  displayTitle: tag?.title ?? '',
                                  duration: Duration(
                                      seconds:
                                          int.parse(tag?.trackTotal ?? '')),
                                  displaySubtitle: tag?.comment ?? '',
                                  artUri: Uri.file(
                                    tag?.artwork ?? path.artwork(),
                                  ),
                                  extras: {
                                    'isLocal': true,
                                  },
                                );
                                await file.delete();

                                await AudioService.removeQueueItem(media);
                              },
                              child: Text('Confirm'),
                            ),
                          ],
                        );
                      });
                },
              ),
            );
          },
        ),
      );
    });
  }
}
