import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:awesomemusic/helper/helper.dart';
import 'package:awesomemusic/helper/size_config.dart';
import 'package:awesomemusic/modals/songdetails.dart';
import 'package:awesomemusic/widgets/seekbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FullScreenPlayer extends StatefulWidget {
  @override
  _FullScreenPlayerState createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  SongsController _songsController = Get.find();
  SongDetails? songDetails;
  @override
  void initState() {
    super.initState();
  }

  _buildThumbnail(MediaItem mediaItem) {
    return Hero(
      tag: DEFAULTTHUMBTAG,
      child: Center(
        child: Container(
          clipBehavior: Clip.none,
          height: getProportionateScreenHeight(220),
          width: getProportionateScreenHeight(220),
          // width: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(
                  5,
                  8,
                ),
                blurRadius: 5.0,
                spreadRadius: 0.2,
                color: kSecondaryColor.withOpacity(
                  0.4,
                ),
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                mediaItem.artUri.toString().replaceAll(
                      '150x150',
                      '500x500',
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getSongDetail(dynamic id) async {
    print('fetchinh');
    songDetails = await _songsController.fetchSongDetails(id).then((value) {
      if (value.lyrics != null && value.lyrics!.isNotEmpty)
        _songsController.teController.text = value.lyrics!.trim();
      return value;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Now Playing',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            color: kTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_outline_outlined,
              color: kTextColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: StreamBuilder<QueueState>(
          stream: _songsController.queueStateStream,
          builder: (context, snapshot) {
            final queueState = snapshot.data;
            final queue = queueState?.queue ?? [];
            final mediaItem = queue.isNotEmpty ? queueState?.mediaItem : null;
            final hasNext = queue.isNotEmpty ? queue.last != mediaItem : null;
            final hasPrevious =
                queue.isNotEmpty ? queue.first != mediaItem : null;
            if (queue.isNotEmpty && mediaItem!.extras!['id'] != null) {
              if (songDetails?.id != mediaItem.extras!['id'] ||
                  songDetails == null) getSongDetail(mediaItem.extras!['id']);
            }
            return SlidingUpPanel(
              backdropEnabled: true,
              backdropTapClosesPanel: true,
              maxHeight: SizeConfig.screenHeight - kToolbarHeight * 1.5,
              boxShadow: songDetails == null ||
                      songDetails!.lyrics == null ||
                      songDetails!.lyrics!.isEmpty
                  ? null
                  : [
                      BoxShadow(
                        offset: Offset(
                          0,
                          -3,
                        ),
                        color: kSecondaryColor.withOpacity(0.5),
                        blurRadius: 10.0,
                        spreadRadius: 0.5,
                      ),
                    ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              parallaxEnabled: true,
              panelBuilder: (sc) {
                return songDetails == null ||
                        songDetails?.lyrics == null ||
                        songDetails!.lyrics!.isEmpty
                    ? SizedBox.shrink()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.keyboard_arrow_up_outlined),
                          Text(
                            'Lyrics',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          spacer(),
                          Expanded(
                            child: SingleChildScrollView(
                              controller: sc,
                              physics: BouncingScrollPhysics(),
                              child: TextField(
                                controller: _songsController.teController,
                                readOnly: true,
                                maxLines: 70,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
              },
              body: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: mediaItem == null
                                ? []
                                : [
                                    _buildThumbnail(mediaItem),
                                    spacer(),
                                    _buildTitle(mediaItem),
                                    spacer(
                                      height: 15.0,
                                    ),
                                    _buildSubs(mediaItem),
                                  ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: hasNext == null || hasPrevious == null
                                ? []
                                : [
                                    // spacer(),
                                    _buildSeekBar(),
                                    // spacer(),
                                    _buildMediaButtons(hasPrevious, hasNext),
                                    spacer(
                                        height: SizeConfig.screenHeight * 0.1),
                                  ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  _buildMediaButtons(bool hasPrevious, bool hasNext) {
    return Expanded(
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (hasPrevious) {
                AudioService.skipToPrevious();
              }
            },
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                depth: hasPrevious ? 4 : 0,
                lightSource: LightSource.top,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeumorphicIcon(
                  Icons.skip_previous_outlined,
                  size: 40,
                  style: NeumorphicStyle(
                    depth: 4,
                    color: kTextColor,
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<bool>(
              stream: AudioService.playbackStateStream
                  .map((state) => state.playing)
                  .distinct(),
              builder: (context, snapshot) {
                final playing = snapshot.data ?? true;
                return GestureDetector(
                  onTap: () {
                    playing ? AudioService.pause() : AudioService.play();
                  },
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 4,
                      lightSource: LightSource.top,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NeumorphicIcon(
                        playing ? Icons.pause : Icons.play_arrow_outlined,
                        size: 60,
                        style: NeumorphicStyle(
                          depth: 4,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                );
              }),
          GestureDetector(
            onTap: () {
              if (hasNext) {
                AudioService.skipToNext();
              }
            },
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                depth: !hasNext ? 0 : 4,
                lightSource: LightSource.top,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeumorphicIcon(
                  Icons.skip_next_outlined,
                  size: 40,
                  style: NeumorphicStyle(
                    depth: 0,
                    color: kTextColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildSubs(MediaItem mediaItem) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(36),
      ),
      child: Text(
        mediaItem.displaySubtitle!,
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  FittedBox _buildTitle(MediaItem mediaItem) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
        ),
        child: Text(
          mediaItem.displayTitle!,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
    );
  }

  spacer({double? height}) {
    return SizedBox(
      height: height ?? getProportionateScreenHeight(25),
    );
  }

  // _buildMediaButtons() {}
  _buildSeekBar() {
    return StreamBuilder<MediaState>(
      stream: _songsController.mediaStateStream,
      builder: (context, snapshot) {
        final mediaState = snapshot.data;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SeekBar(
            duration: mediaState?.mediaItem?.duration ?? Duration.zero,
            position: mediaState?.position ?? Duration.zero,
            onChangeEnd: (newPosition) {
              AudioService.seekTo(newPosition);
            },
          ),
        );
      },
    );
  }
}
