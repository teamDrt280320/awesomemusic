import 'package:hive/hive.dart';
part 'local_playlist.g.dart';

@HiveType(typeId: 0)
class LocalPlaylist {
  @HiveField(0)
  String title;
  @HiveField(1)
  String? imageUrl;
  @HiveField(2)
  bool isLocal;
  @HiveField(3)
  List<CustSongItem> songList;
  @HiveField(4)
  int? key;
  LocalPlaylist({
    required this.title,
    this.imageUrl,
    this.isLocal = true,
    required this.songList,
    this.key,
  });
}

@HiveType(typeId: 1)
class CustSongItem {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  String imageUrl;
  @HiveField(3)
  String? songUrl;
  @HiveField(4)
  bool isDownloaded;
  @HiveField(5)
  String? songPath;
  @HiveField(6)
  String? artPath;
  CustSongItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.isDownloaded = false,
    this.songPath,
    this.artPath,
    this.songUrl,
  });
}
