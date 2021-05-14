import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:awesomemusic/helper/helper.dart';
import 'package:awesomemusic/views/fullscreenplayer/fsplayer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    Key? key,
    required this.songsControler,
    required this.songDetails,
    required this.hasPrvious,
    required this.hasNext,
  }) : super(key: key);

  final SongsController songsControler;
  final MediaItem songDetails;
  final bool hasNext, hasPrvious;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 1.25,
      decoration: _buildBoxDecoration(),
      child: Center(
        child: ListTile(
          onTap: _handleOnTap,
          leading: _buildThumbnail(),
          title: _buildTitle(),
          subtitle: _buildSub(),
          trailing: _buildActions(),
        ),
      ),
    );
  }

  ///[OnTap] method
  _handleOnTap() {
    Get.to(
      () => FullScreenPlayer(),
      fullscreenDialog: true,
      transition: Transition.cupertino,
      duration: Duration(milliseconds: 300),
    );
  }

  ///[Decoration] for [Container]
  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(
            0,
            -3,
          ),
          color: kSecondaryColor.withOpacity(0.5),
          blurRadius: 16.0,
          spreadRadius: 0.5,
        ),
      ],
    );
  }

  ///[Media Action] Buttons
  Row _buildActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          disabledColor: Colors.grey.withOpacity(0.7),
          color: kTextColor,
          icon: Icon(Icons.skip_previous),
          onPressed: hasPrvious
              ? () {
                  AudioService.skipToPrevious();
                }
              : null,
        ),
        StreamBuilder<bool>(
            stream: AudioService.playbackStateStream
                .map((state) => state.playing)
                .distinct(),
            builder: (context, snapshot) {
              final playing = snapshot.data ?? false;
              return !playing
                  ? IconButton(
                      disabledColor: Colors.grey,
                      color: kTextColor,
                      icon: Icon(Icons.play_arrow),
                      onPressed: () {
                        AudioService.play();
                      },
                    )
                  : IconButton(
                      disabledColor: Colors.grey,
                      color: kTextColor,
                      icon: Icon(Icons.pause_outlined),
                      onPressed: () {
                        AudioService.pause();
                      },
                    );
            }),
        IconButton(
          disabledColor: Colors.grey,
          color: kTextColor,
          icon: Icon(Icons.skip_next),
          onPressed: hasNext
              ? () {
                  AudioService.skipToNext();
                }
              : null,
        )
      ],
    );
  }

  ///[Title]
  Text _buildTitle() => Text(
        songDetails.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  ///[Subtitle]
  Text _buildSub() {
    return Text(
      songDetails.displaySubtitle ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.openSans(),
    );
  }

  ///[Thumbnail] build method
  _buildThumbnail() {
    return Hero(
      tag: DEFAULTTHUMBTAG,
      child: Container(
        clipBehavior: Clip.none,
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(
            8,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 3),
              blurRadius: 5.0,
              spreadRadius: 0.2,
              color: kSecondaryColor.withOpacity(
                0.8,
              ),
            ),
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              songDetails.artUri.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
