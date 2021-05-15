import 'package:audio_service/audio_service.dart';
import 'package:hive/hive.dart';
part 'mediaitem.g.dart';

@HiveType(typeId: 0)
class CustMediaItem {
  /// A unique id.
  @HiveField(0)
  final String id;

  /// The album this media item belongs to.
  @HiveField(1)
  final String album;

  /// The title of this media item.
  @HiveField(2)
  final String title;

  /// The artist of this media item.
  @HiveField(3)
  final String? artist;

  /// The genre of this media item.
  @HiveField(4)
  final String? genre;

  /// The duration of this media item.
  @HiveField(5)
  final Duration? duration;

  /// The artwork for this media item as a uri.
  @HiveField(6)
  final Uri? artUri;

  /// Whether this is playable (i.e. not a folder).
  @HiveField(7)
  final bool? playable;

  /// Override the default title for display purposes.
  @HiveField(8)
  final String? displayTitle;

  /// Override the default subtitle for display purposes.
  @HiveField(9)
  final String? displaySubtitle;

  /// Override the default description for display purposes.
  @HiveField(10)
  final String? displayDescription;

  /// The rating of the CustMediaItem.

  /// A map of additional metadata for the media item.
  ///
  /// The values must be integers or strings.
  @HiveField(11)
  final Map<String, dynamic>? extras;

  @HiveField(12)
  final String? taskId;
  @HiveField(13)
  final int? progress;
  @HiveField(14)
  final int? status;

  /// Creates a [CustMediaItem].
  ///
  /// [id], [album] and [title] must not be null, and [id] must be unique for
  /// each instance.
  const CustMediaItem({
    required this.id,
    required this.album,
    required this.title,
    this.artist,
    this.genre,
    this.duration,
    this.artUri,
    this.playable = true,
    this.displayTitle,
    this.displaySubtitle,
    this.displayDescription,
    this.extras,
    this.progress,
    this.status,
    this.taskId,
  });

  /// Creates a [CustMediaItem] from a map of key/value pairs corresponding to
  /// fields of this class.
  factory CustMediaItem.fromJson(Map raw) => CustMediaItem(
        id: raw['id'],
        album: raw['album'],
        title: raw['title'],
        artist: raw['artist'],
        genre: raw['genre'],
        duration: raw['duration'] != null
            ? Duration(milliseconds: raw['duration'])
            : null,
        artUri: raw['artUri'] != null ? Uri.parse(raw['artUri']) : null,
        playable: raw['playable'],
        displayTitle: raw['displayTitle'],
        displaySubtitle: raw['displaySubtitle'],
        displayDescription: raw['displayDescription'],
        extras: raw['extras']?.cast<String, dynamic>(),
      );

  /// Creates a [CustMediaItem] from [MediaItem] corresponding to
  /// fields of this class.
  factory CustMediaItem.fromMediaItem(MediaItem mediaItem) =>
      CustMediaItem.fromJson(mediaItem.toJson());

  /// Creates a copy of this [CustMediaItem] but with with the given fields
  /// replaced by new values.
  CustMediaItem copyWith({
    String? id,
    String? album,
    String? title,
    String? artist,
    String? genre,
    Duration? duration,
    Uri? artUri,
    bool? playable,
    String? displayTitle,
    String? displaySubtitle,
    String? displayDescription,
    Map<String, dynamic>? extras,
  }) =>
      CustMediaItem(
        id: id ?? this.id,
        album: album ?? this.album,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        genre: genre ?? this.genre,
        duration: duration ?? this.duration,
        artUri: artUri ?? this.artUri,
        playable: playable ?? this.playable,
        displayTitle: displayTitle ?? this.displayTitle,
        displaySubtitle: displaySubtitle ?? this.displaySubtitle,
        displayDescription: displayDescription ?? this.displayDescription,
        extras: extras ?? this.extras,
      );

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(dynamic other) => other is CustMediaItem && other.id == id;

  @override
  String toString() => '${toJson()}';

  /// Converts this [CustMediaItem] to a map of key/value pairs corresponding to
  /// the fields of this class.
  Map<String, dynamic> toJson() => {
        'id': id,
        'album': album,
        'title': title,
        'artist': artist,
        'genre': genre,
        'duration': duration?.inMilliseconds,
        'artUri': artUri?.toString(),
        'playable': playable,
        'displayTitle': displayTitle,
        'displaySubtitle': displaySubtitle,
        'displayDescription': displayDescription,
        'extras': extras,
      };
}
