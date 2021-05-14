import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:awesomemusic/helper/helper.dart';
import 'package:awesomemusic/helper/size_config.dart';
import 'package:awesomemusic/modals/playlist.dart' as pi;
import 'package:awesomemusic/modals/playlist.dart';
import 'package:awesomemusic/modals/searchresults.dart';
import 'package:awesomemusic/widgets/miniplayer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:awesomemusic/helper/extensions.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette_generator/palette_generator.dart';

class PlaylistInfo extends StatefulWidget {
  final Playlists playlists;
  final int selectedIndex;

  const PlaylistInfo(
      {Key? key, required this.playlists, required this.selectedIndex})
      : super(key: key);
  @override
  _PlaylistInfoState createState() => _PlaylistInfoState();
}

class _PlaylistInfoState extends State<PlaylistInfo> {
  late Data data;
  pi.PlaylistInfo? playlistInfo;
  SongsController _songsController = Get.find();
  static CachedNetworkImageProvider? image;
  PaletteGenerator? _paletteGenerator;

  getData() async {
    playlistInfo = await _songsController.fetchPlaylist(data.id);
    if (playlistInfo != null) {}
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    data = widget.playlists.data[widget.selectedIndex];
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     StreamBuilder<QueueState>(
      //       stream: _songsController.queueStateStream,
      //       builder: (context, snapshot) {
      //         final queueState = snapshot.data;
      //         final queue = queueState?.queue ?? [];
      //         final mediaItem = queueState?.mediaItem;
      //         return queue.isNotEmpty && mediaItem != null
      //             ? MiniPlayer(
      //                 songsControler: _songsController,
      //                 songDetails: mediaItem,
      //                 hasNext: mediaItem != queue.last,
      //                 hasPrvious: mediaItem != queue.first,
      //               )
      //             : SizedBox.shrink();
      //       },
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        title: Text(
          playlistInfo?.title ?? '',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(),
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: data.image.sanitize(),
                    child: Container(
                      height: getProportionateScreenWidth(150),
                      width: getProportionateScreenWidth(150),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(
                              0,
                              5,
                            ),
                            blurRadius: 16.0,
                            spreadRadius: 1,
                            color: kSecondaryColor.withOpacity(
                              0.8,
                            ),
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            data.image.sanitize().highRes(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          data.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(
                            6,
                          ),
                        ),
                        Text(
                          data.more_info.artist_name.isEmpty
                              ? data.subtitle.isEmpty
                                  ? data.description
                                  : data.subtitle
                              : data.more_info.artist_name.first,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(16),
                        ),
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: StreamBuilder<bool>(
                              stream: AudioService.playbackStateStream
                                  .map((state) => state.playing)
                                  .distinct(),
                              builder: (context, snapshot) {
                                var playing = snapshot.data ?? false;
                                return Obx(
                                  () => _songsController
                                                  .cuurentPlaylistId.value ==
                                              playlistInfo?.id &&
                                          playing
                                      ? FloatingActionButton(
                                          onPressed: () {
                                            AudioService.pause();
                                          },
                                          child: Icon(
                                            Icons.pause,
                                          ),
                                        )
                                      : FloatingActionButton(
                                          onPressed: () {
                                            _songsController.cuurentPlaylistId
                                                        .value ==
                                                    playlistInfo!.id
                                                ? AudioService.play()
                                                : _songsController
                                                    .playFromOnlinePlaylist(
                                                    playlistInfo!,
                                                    playlistInfo!
                                                        .list[0]
                                                        .more_info
                                                        .encrypted_media_url,
                                                  );
                                          },
                                          child: Icon(
                                            Icons.play_arrow_outlined,
                                          ),
                                        ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(48),
            ),
            Expanded(
              child: playlistInfo == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : StreamBuilder<QueueState>(
                      stream: _songsController.queueStateStream,
                      builder: (context, snapshot) {
                        final queueState = snapshot.data;
                        final queue = queueState?.queue ?? [];
                        final mediaItem = queueState?.mediaItem;
                        return ListView.builder(
                          // clipBehavior: Clip.none,
                          physics: BouncingScrollPhysics(),
                          itemCount: playlistInfo!.list.length,
                          itemBuilder: (context, index) {
                            SongList songList = playlistInfo!.list[index];
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
                                        mediaItem!.extras!['id'] == songList.id
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
                                    mediaItem!.extras!['id'] == songList.id,
                                onTap: () {
                                  if (queue.isNotEmpty &&
                                      mediaItem!.extras!['id'] != songList.id) {
                                    _songsController.playFromOnlinePlaylist(
                                      playlistInfo!,
                                      songList.more_info.encrypted_media_url,
                                    );
                                  }
                                },
                                isThreeLine: false,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                leading: _buildSongThumbnail(songList),
                                title: Text(songList.title.sanitize()),
                                subtitle: Text(
                                  songList.more_info.album.sanitize(),
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
                                      // _songsControler.downloadSong(
                                      //   context,
                                      //   await _songsControler
                                      //       .fetchSongDetails(topSong.id),
                                      // );
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
                              ),
                            );
                          },
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildSongThumbnail(pi.SongList topSong) {
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
            topSong.image.sanitize(),
          ),
        ),
      ),
    );
  }
}
