import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:audio_service/audio_service.dart';
import 'package:audiotagger/audiotagger.dart';
import 'package:audiotagger/models/tag.dart';
import 'package:awesomemusic/helper/helper.dart';
import 'package:awesomemusic/modals/modals.dart';
import 'package:awesomemusic/modals/playlist.dart';
import 'package:awesomemusic/modals/searchresults.dart';
import 'package:dio/dio.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache/flutter_cache.dart' as cache;
// ignore: import_of_legacy_library_into_null_safe
import 'package:des_plugin/des_plugin.dart' as des;
import 'package:awesomemusic/modals/songdetails.dart' as sdetails;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'bgaudiotask.dart';

class SongsController extends GetxController {
  var _topSongs = TopSongs().obs;
  var teController = TextEditingController();
  String? localPath;
  TopSongs get topSongs => _topSongs.value;
  var searchResults = Rxn<SearchResults>();
  var audioTask = AudioTask();
  var focusNode = FocusNode();
  var searchQuery = TextEditingController();

  ///[Playlist] Id [1] os reserved
  var cuurentPlaylistId = ''.obs;
  set topSongs(TopSongs topSongs) {
    _topSongs.value = topSongs;
  }

  @override
  Future<void> onInit() async {
    localPath = (await _findLocalPath()) + Platform.pathSeparator + 'Download';
    final savedDir = Directory(localPath!);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    await getTopSongs();
    // var done = await preparAudioService();
    // print(done);
    super.onInit();
  }

  ///[Play]
  play(String url) async {
    if (AudioService.running) {
      if (cuurentPlaylistId.value == '1') {
        AudioService.skipToQueueItem(
          (await decryptUrl(url)).replaceAll('http:', 'https:'),
        );
      } else {
        try {
          var queue = <MediaItem>[];
          var list = _topSongs.value.list!.map(
            (data) async {
              var url = await decryptUrl(data.moreInfo!.encryptedMediaUrl!);
              return MediaItem(
                id: url.replaceAll('http:', 'https:'),
                album: data.moreInfo!.album!.sanitize(),
                title: data.title!.sanitize(),
                displaySubtitle: data.subtitle!.sanitize(),
                displayTitle: data.title!.sanitize(),
                duration:
                    Duration(seconds: int.parse(data.moreInfo!.duration!)),
                artUri: Uri.parse(data.image!.replaceAll('http:', 'https:')),
                extras: {'id': data.id},
              );
            },
          ).toList();

          for (var item in list) {
            queue.add(await item);
          }
          await AudioService.updateQueue(queue);
          AudioService.skipToQueueItem(
            (await decryptUrl(url)).replaceAll('http:', 'https:'),
          );
          cuurentPlaylistId.value = '1';
        } catch (e) {
          print(e);
        }
      }
    } else {
      try {
        var done = await preparAudioService();
        if (done) {
          AudioService.skipToQueueItem(
            (await decryptUrl(url)).replaceAll('http:', 'https:'),
          );
          cuurentPlaylistId.value = '1';
        }
        print(done);
      } catch (e) {
        print(e);
      }
    }
  }

  ///[Setup] playlist according to [Playlist] data obtained via api
  playFromOnlinePlaylist(PlaylistInfo playlistInfo, String url) async {
    if (AudioService.running) {
      if (cuurentPlaylistId.value == playlistInfo.id) {
        // await AudioService.pause();
        await decryptUrl(url).then((value) => print(value));
        await AudioService.skipToQueueItem(
          (await decryptUrl(url)).replaceAll('http:', 'https:'),
        );
        cuurentPlaylistId.value = playlistInfo.id;
      } else {
        var queue = <MediaItem>[];
        var list = playlistInfo.list.map(
          (data) async {
            var url = await decryptUrl(data.more_info.encrypted_media_url);
            return MediaItem(
              id: url.replaceAll('http:', 'https:'),
              album: data.more_info.album.sanitize(),
              title: data.title.sanitize(),
              displaySubtitle: data.subtitle.sanitize(),
              displayTitle: data.title.sanitize(),
              duration: Duration(seconds: int.parse(data.more_info.duration)),
              artUri: Uri.parse(data.image.replaceAll('http:', 'https:')),
              extras: {'id': data.id},
            );
          },
        ).toList();
        for (var item in list) {
          queue.add(await item);
        }
        await AudioService.updateQueue(queue);
        await AudioService.skipToQueueItem(
          (await decryptUrl(url)).replaceAll('http:', 'https:'),
        );
        cuurentPlaylistId.value = playlistInfo.id;
        // }
      }
    } else {
      var queue = <dynamic>[];
      var list = playlistInfo.list.map(
        (data) async {
          var url = await decryptUrl(data.more_info.encrypted_media_url);
          return MediaItem(
            id: url.replaceAll('http:', 'https:'),
            album: data.more_info.album.sanitize(),
            title: data.title.sanitize(),
            displaySubtitle: data.subtitle.sanitize(),
            displayTitle: data.title.sanitize(),
            duration: Duration(seconds: int.parse(data.more_info.duration)),
            artUri: Uri.parse(data.image.replaceAll('http:', 'https:')),
            extras: {'id': data.id},
          ).toJson();
        },
      ).toList();

      for (var item in list) {
        queue.add(await item);
      }
      var done = await AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
        androidNotificationChannelName: 'Awesome Music',
        // Enable this if you want the Android service to exit the foreground state on pause.
        //androidStopForegroundOnPause: true,
        androidNotificationColor: 0xFF2196f3,
        androidNotificationIcon: 'mipmap/launcher_icon',
        androidEnableQueue: true,
        params: {
          'queue': queue,
        },
      );
      if (done) {
        AudioService.skipToQueueItem(
          (await decryptUrl(url)).replaceAll('http:', 'https:'),
        );
        cuurentPlaylistId.value = playlistInfo.id;
      }
    }
  }

  /// [Prepare] Audio Source
  /// This method should be callled once data is fetched else [N] number of [Errors] may occur
  Future<bool> preparAudioService() async {
    var queue = <dynamic>[];
    var list = _topSongs.value.list!.map(
      (data) async {
        var url = await decryptUrl(data.moreInfo!.encryptedMediaUrl!);
        return MediaItem(
          id: url.replaceAll('http:', 'https:'),
          album: data.moreInfo!.album!.sanitize(),
          title: data.title!.sanitize(),
          displaySubtitle: data.subtitle!.sanitize(),
          displayTitle: data.title!.sanitize(),
          duration: Duration(seconds: int.parse(data.moreInfo!.duration!)),
          artUri: Uri.parse(data.image!.replaceAll('http:', 'https:')),
          extras: {'id': data.id},
        ).toJson();
      },
    ).toList();

    for (var item in list) {
      queue.add(await item);
    }
    return await AudioService.start(
      backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
      androidNotificationChannelName: 'Awesome Music',
      // Enable this if you want the Android service to exit the foreground state on pause.
      //androidStopForegroundOnPause: true,
      androidNotificationColor: 0xFF2196f3,
      androidNotificationIcon: 'mipmap/launcher_icon',
      androidEnableQueue: true,
      params: {
        'queue': queue,
      },
    );
  }

  ///[Fetch] [Playlist] Info
  Future<PlaylistInfo> fetchPlaylist(String id) async {
    var res = await cache.remember(
      'playlist$id',
      () async {
        var response = await http.get(
          Uri.parse(playlisturl(id)),
          headers: {"Accept": "application/json"},
        );
        var resEdited = (response.body).split("-->");
        return json.decode(resEdited[1]);
      },
    );
    return PlaylistInfo.fromMap(Map<String, dynamic>.from(res));
  }

  ///[fetch] [Search] results
  fetchSearchResult() async {
    searchResults.value = null;
    var searchQuery = this.searchQuery.text;
    var res = await cache.remember('searchResultsof$searchQuery', () async {
      var response = await http.get(Uri.parse(searchUrl(searchQuery)),
          headers: {"Accept": "application/json"});
      var resEdited = (response.body).split("-->");
      return json.decode(resEdited[1]);
    });
    searchResults.value = SearchResults.fromMap(Map<String, dynamic>.from(res));
  }

  ///[GET] method for getting top songs
  getTopSongs() async {
    var json = await cache.remember('topSongs2', () async {
      var response = await http.get(Uri.parse(TOPSONGSURL));
      return Map<String, dynamic>.from(jsonDecode(response.body));
    });
    topSongs = TopSongs.fromJson(json);
    print(topSongs.list!.length);
  }

  ///[Fetch] song [Detail]
  Future<sdetails.SongDetails> fetchSongDetails(songId) async {
    print('fetching detauls for id: $songId');
    String songUrl = SONGDETAILURL + songId;

    var jsondata = await cache.remember(
      "songDetails$songId",
      () async {
        var res = await http
            .get(Uri.parse(songUrl), headers: {"Accept": "application/json"});
        var resEdited = (res.body).split("-->");
        var getMain = json.decode(resEdited[1]);
        return Map<String, dynamic>.from(getMain)[songId];
      },
      604800,
    );

    var songDetails = sdetails.SongDetails.fromJson(jsondata);

    ///[Decrypted] media url
    var decryptedMediaUrl =
        await decryptUrl(songDetails.moreInfo!.encryptedMediaUrl!);
    var lyrics = await cache.remember(
      'lyrics$songId',
      () async {
        if (songDetails.moreInfo!.hasLyrics == "true") {
          var lyricsRes = await http.get(Uri.parse(LYRICSURL(songId)),
              headers: {"Accept": "application/json"});
          var lyricsEdited = (lyricsRes.body).split("-->");
          var fetchedLyrics = json.decode(lyricsEdited[1]);
          return fetchedLyrics["lyrics"].toString().replaceAll("<br>", "\n");
        } else {
          if (songDetails.moreInfo!.artistMap!.artists!.isNotEmpty) {
            String lyricsApiUrl = "https://musifydev.vercel.app/lyrics/" +
                songDetails.moreInfo!.artistMap!.artists!.first.name! +
                "/" +
                songDetails.title!;
            var lyricsApiRes = await http.get(Uri.parse(lyricsApiUrl),
                headers: {"Accept": "application/json"});
            var lyricsResponse = json.decode(lyricsApiRes.body);
            if (lyricsResponse['status'] == true &&
                lyricsResponse['lyrics'] != null) {
              return lyricsResponse['lyrics'];
            } else {
              return '';
            }
          } else
            return '';
        }
      },
    );
    songDetails.lyrics = lyrics;

    songDetails.moreInfo!.encryptedMediaUrl = decryptedMediaUrl;

    return songDetails;
  }

  ///[Download] songs
  downloadSong(
    context,
    sdetails.SongDetails topSong,
  ) async {
    var downloadUrl;
    var filename =
        localPath! + Platform.pathSeparator + topSong.title! + '.m4a';

    ///
    var artwork = localPath! +
        Platform.pathSeparator +
        topSong.title!.replaceAll('.m4a', '_thumb.jpg');

    ///
    var dio = new Dio();

    ///
    downloadUrl = topSong.moreInfo!.encryptedMediaUrl!;

    ///
    ProgressDialog pd = ProgressDialog(context: context);

    ///
    if (topSong.moreInfo!.s320kbps == 'true')
      downloadUrl.replaceAll('_96.mp4', '_320.mp4');

    ///
    pd.show(max: 100, msg: 'File Downloading...');

    ///
    var response = await dio.download(
      downloadUrl,
      filename,
      onReceiveProgress: (rec, total) {
        int progress = (((rec / total) * 100).toInt());
        pd.update(value: progress);
      },
    );

    ///
    if (response.statusCode != 200) {
      ///
      downloadUrl.replaceAll(
        '.mp4',
        '.mp3',
      );

      ///
      await dio.download(
        downloadUrl,
        filename,
        onReceiveProgress: (rec, total) {
          int progress = (((rec / total) * 100).toInt());
          pd.update(value: progress);
        },
      ).then(
        (value) async => await dio.download(
          topSong.image!.replaceAll('http:', 'https:'),
          artwork,
          onReceiveProgress: (rec, total) {
            int progress = (((rec / total) * 100).toInt());
            pd.update(value: progress);
          },
        ).then((value) async {
          if (Platform.isAndroid) {
            final tag = Tag(
              title: topSong.title,
              artist: topSong.moreInfo!.artistMap!.artists!.first.name,
              artwork: artwork,
              album: topSong.moreInfo!.album,
              lyrics: topSong.lyrics,
              genre: null,
            );

            var audioTagger = Audiotagger();
            await audioTagger.writeTags(
              path: localPath! + Platform.pathSeparator + filename,
              tag: tag,
            );
          }
        }),
      );
    } else {
      ///
      await dio.download(
        topSong.image!.replaceAll('http:', 'https:'),
        artwork,
        onReceiveProgress: (rec, total) {
          int progress = (((rec / total) * 100).toInt());
          pd.update(value: progress);
        },
      ).then((value) async {
        if (Platform.isAndroid) {
          final tag = Tag(
            title: topSong.title,
            artist: topSong.moreInfo!.artistMap!.artists!.first.name,
            artwork: artwork,
            album: topSong.moreInfo!.album,
            lyrics: topSong.lyrics,
          );

          var audioTagger = Audiotagger();
          await audioTagger.writeTags(
            path: filename,
            tag: tag,
          );
        }
      });
    }
  }

  ///[Decrypt] url
  Future<String> decryptUrl(String url) async {
    return await cache.remember(
      url,
      () async {
        return await des.DesPlugin.decrypt(
          '38346591',
          url,
        );
      },
      86400,
    );
  }

  /// get [Local] Path
  Future<String> _findLocalPath() async {
    final directory =
        await getExternalStorageDirectories(type: StorageDirectory.downloads);
    return directory!.first.path;
  }

  /// A stream reporting the combined state of the current media item and its
  /// current position.
  Stream<MediaState> get mediaStateStream =>
      rx.Rx.combineLatest2<MediaItem?, Duration, MediaState>(
          AudioService.currentMediaItemStream,
          AudioService.positionStream,
          (mediaItem, position) => MediaState(mediaItem, position));

  /// A stream reporting the combined state of the current queue and the current
  /// media item within that queue.
  Stream<QueueState> get queueStateStream =>
      rx.Rx.combineLatest2<List<MediaItem>?, MediaItem?, QueueState>(
          AudioService.queueStream,
          AudioService.currentMediaItemStream,
          (queue, mediaItem) => QueueState(queue, mediaItem));
}

void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioTask());
}
