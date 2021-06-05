import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:awesomemusic/modals/searchresults.dart';
import 'package:awesomemusic/modals/topsongs.dart';
import 'package:awesomemusic/widgets/thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesomemusic/helper/helper.dart';

class SongList extends StatelessWidget {
  const SongList({
    Key? key,
    required this.songsControler,
    required this.queue,
    required this.mediaItem,
    required this.onPressed,
    required this.songsList,
    this.scrollController,
  }) : super(key: key);

  final SongsController songsControler;
  final List<MediaItem> queue;
  final MediaItem? mediaItem;
  final List<dynamic> songsList;
  final Function(String) onPressed;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      clipBehavior: songsList is List<TopSong> ? Clip.none : Clip.hardEdge,
      physics: songsList is List<TopSong>
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      itemCount: songsList.length,
      itemBuilder: (context, index) {
        var topSong = songsList[index];
        bool selected = queue.isNotEmpty &&
            mediaItem != null &&
            mediaItem!.extras!['id'] == topSong!.id;

        return AnimatedContainer(
          duration: Duration(
            milliseconds: 500,
          ),
          // curve: Curves.fas,
          clipBehavior: Clip.none,
          margin: const EdgeInsets.symmetric(
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: selected
                ? [
                    BoxShadow(
                        offset: Offset(
                          0,
                          3,
                        ),
                        blurRadius: 16.0,
                        color: Colors.grey.shade200),
                  ]
                : null,
          ),
          child: SongWidget(
            isTopSong: topSong is TopSong,
            onPressed: onPressed,
            selected: selected,
            songsControler: songsControler,
            image: topSong.image,
            id: topSong.id!,
            title: topSong.title!,
            subtitle: topSong is Data ? topSong.description : topSong.subtitle!,
            encryptedMediaUrl: topSong is TopSong
                ? topSong.moreInfo!.encryptedMediaUrl!
                : topSong.id!,
          ),
        );
      },
    );
  }
}

class SongWidget extends StatelessWidget {
  const SongWidget(
      {Key? key,
      required this.selected,
      required this.songsControler,
      required this.encryptedMediaUrl,
      required this.id,
      required this.subtitle,
      required this.title,
      required this.onPressed,
      required this.isTopSong,
      required this.image})
      : super(key: key);

  final bool selected, isTopSong;
  final SongsController songsControler;
  // final TopSong? topSong;
  final String title, encryptedMediaUrl, subtitle, id, image;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      onTap: () => onPressed(encryptedMediaUrl),
      isThreeLine: subtitle.sanitize().isNotEmpty,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      leading: Thumbnail(
        image: image,
      ),
      title: Text(title.sanitize()),
      subtitle: subtitle.sanitize().isEmpty
          ? null
          : Text(
              subtitle.sanitize(),
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
              (await songsControler.fetchSongDetails(id))!,
            );
          }
          print(choice);
        },
        onCanceled: () {},
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
    );
  }
}
