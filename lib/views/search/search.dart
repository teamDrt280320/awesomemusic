import 'package:audio_service/audio_service.dart';
import 'package:awesomemusic/controllers/songscontroller.dart';
import 'package:awesomemusic/helper/constants.dart';
import 'package:awesomemusic/helper/size_config.dart';
import 'package:awesomemusic/modals/searchresults.dart';
import 'package:awesomemusic/modals/songdetails.dart';
import 'package:awesomemusic/views/playlistinfo/playlistinfo.dart';
import 'package:awesomemusic/widgets/song_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:awesomemusic/helper/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController _scrollController = ScrollController();
  SongsController _songsController = Get.find();
  play(SongDetails songDetails) async {
    await AudioService.addQueueItem(
      new MediaItem(
        id: songDetails.moreInfo!.encryptedMediaUrl!,
        album: songDetails.moreInfo!.album!,
        title: songDetails.title!,
        displayTitle: songDetails.title!,
        displaySubtitle: songDetails.subtitle!.isEmpty
            ? songDetails.moreInfo!.album!
            : songDetails.subtitle!,
        artUri: Uri.parse(songDetails.image!),
        extras: {'id': songDetails.id},
      ),
    );
    await AudioService.skipToQueueItem(
      songDetails.moreInfo!.encryptedMediaUrl!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 24.0,
              right: 24.0,
              child: SizedBox(
                height: kToolbarHeight,
                child: CupertinoSearchTextField(
                  focusNode: _songsController.focusNode,
                  itemColor: Colors.pinkAccent,
                  itemSize: 24,
                  controller: _songsController.searchQuery,
                  prefixInsets: EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  suffixIcon: Icon(
                    Icons.done,
                    size: 24,
                    color: Colors.pinkAccent,
                  ),
                  onSuffixTap: () {
                    if (_songsController.searchQuery.text.isNotEmpty) {
                      if (_songsController.focusNode.hasFocus)
                        _songsController.focusNode.unfocus();
                      _songsController.fetchSearchResult();
                    }
                  },
                  onSubmitted: (string) {
                    if (_songsController.searchQuery.text.isNotEmpty) {
                      if (_songsController.focusNode.hasFocus)
                        _songsController.focusNode.unfocus();
                      _songsController.fetchSearchResult();
                    }
                  },
                  suffixInsets: EdgeInsets.symmetric(horizontal: 16.0),
                  suffixMode: OverlayVisibilityMode.always,
                  placeholder: 'Enter or Paste the url here',
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: kToolbarHeight * 1.35,
                left: 16.0,
                right: 16.0,
              ),
              child: Obx(
                () => _songsController.searchResults.value == null
                    ? Center(
                        child: Text(
                          'Search Songs by using albim name,artist name,etc.',
                        ),
                      )
                    : SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTitle('Playlist'),
                            _buildPlayListImage(),
                            _buildTitle('Songs'),
                            _buildSongList(),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildSongList() {
    return SizedBox(
      height: Get.height,
      child: StreamBuilder<QueueState>(
          stream: _songsController.queueStateStream,
          builder: (context, snapshot) {
            final queueState = snapshot.data;
            final queue = queueState?.queue ?? [];
            final mediaItem = queueState?.mediaItem;
            return SongList(
              scrollController: _scrollController,
              onPressed: (id) async {
                var songDetails = await _songsController.fetchSongDetails(id);
                if (AudioService.running) {
                  play(songDetails!);
                } else {
                  bool done = await _songsController.preparAudioService();
                  if (done) {
                    play(songDetails!);
                  }
                }
              },
              songsList: _songsController.searchResults.value!.songs.data,
              songsControler: _songsController,
              queue: queue,
              mediaItem: mediaItem,
            );
          }),
    );
  }

  Container _buildPlayListImage() {
    return Container(
      height: getProportionateScreenWidth(250),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        scrollDirection: Axis.horizontal,
        itemCount: _songsController.searchResults.value!.playlists.data.length,
        itemBuilder: (context, index) {
          Playlists playlist = _songsController.searchResults.value!.playlists;
          Data data = playlist.data[index];
          return Hero(
            tag: data.image.sanitize(),
            child: GestureDetector(
              onTap: () {
                print(playlist.data.first.id);
                Get.to(
                  () => PlaylistInfo(
                    playlists: playlist,
                    selectedIndex: index,
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: kSecondaryColor.withOpacity(0.1),
                      offset: Offset(3, 5),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        data.image.sanitize().mediumRes()),
                  ),
                ),
                height: getProportionateScreenWidth(100),
                width: getProportionateScreenWidth(150),
              ),
            ),
          );
        },
      ),
    );
  }

  Text _buildTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
