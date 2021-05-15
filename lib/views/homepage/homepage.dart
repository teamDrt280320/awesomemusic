import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:awesomemusic/helper/constants.dart';
import 'package:awesomemusic/helper/size_config.dart';
import 'package:awesomemusic/modals/topsongs.dart';
import 'package:awesomemusic/widgets/miniplayer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesomemusic/helper/extensions.dart';

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
                    return ListView.builder(
                      clipBehavior: Clip.none,
                      physics: BouncingScrollPhysics(),
                      itemCount: songsControler.topSongs.list?.length,
                      itemBuilder: (context, index) {
                        var topSong = songsControler.topSongs.list?[index];

                        return AnimatedContainer(
                          duration: Duration(
                            milliseconds: 300,
                          ),
                          // curve: Curves.fas,
                          clipBehavior: Clip.none,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: queue.isNotEmpty &&
                                    mediaItem != null &&
                                    mediaItem.extras!['id'] == topSong!.id
                                ? [
                                    BoxShadow(
                                        offset: Offset(
                                          5,
                                          8,
                                        ),
                                        blurRadius: 16.0,
                                        spreadRadius: 1,
                                        color: kSecondaryColor.withOpacity(
                                          0.2,
                                        )),
                                  ]
                                : [],
                          ),
                          child: ListTile(
                            selected: queue.isNotEmpty &&
                                mediaItem != null &&
                                mediaItem.extras!['id'] == topSong!.id,
                            onTap: () {
                              songsControler
                                  .play(topSong!.moreInfo!.encryptedMediaUrl!);
                            },
                            isThreeLine: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            leading: _buildSongThumbnail(topSong!),
                            title: Text(topSong.title?.sanitize() ?? ''),
                            subtitle: Text(
                              topSong.subtitle?.sanitize() ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(),
                            ),
                            trailing: PopupMenuButton<String>(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              elevation: 10,
                              icon: Icon(
                                Icons.more_vert_outlined,
                                size: 24,
                                color: Colors.black54,
                              ),
                              onSelected: (choice) async {
                                if (choice == 'Download') {
                                  songsControler.downloadSong(
                                    context,
                                    (await songsControler
                                        .fetchSongDetails(topSong.id))!,
                                  );
                                }
                                print(choice);
                              },
                              onCanceled: () {
                                print('cancelled');
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              itemBuilder: (context) {
                                return <PopupMenuItem<String>>[
                                  PopupMenuItem<String>(
                                    value: 'Download',
                                    child: Text('Download'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Add to Playlist',
                                    child: Text('Add to Playlist'),
                                  ),
                                ];
                              },
                            ),
                            // trailing: popupMenuButton(),
                          ),
                        );
                      },
                    );
                  }),
        ),
      ),
    );
  }

  ///[Thumbnail] Widget build Methods
  Container _buildSongThumbnail(TopSong topSong) {
    return Container(
      clipBehavior: Clip.none,
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 3),
            blurRadius: 5.0,
            spreadRadius: 0.2,
            color: kSecondaryColor.withOpacity(0.8),
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            topSong.image!.replaceAll('http:', 'https:'),
          ),
        ),
      ),
    );
  }
}
