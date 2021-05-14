import 'dart:convert';

import 'package:flutter/foundation.dart';

class SearchResults {
  final Albums albums;
  final Songs songs;
  final Playlists playlists;
  final Artists artists;
  final Topquery topquery;
  final Shows shows;
  final Episodes episodes;
  SearchResults({
    required this.albums,
    required this.songs,
    required this.playlists,
    required this.artists,
    required this.topquery,
    required this.shows,
    required this.episodes,
  });

  SearchResults copyWith({
    Albums? albums,
    Songs? songs,
    Playlists? playlists,
    Artists? artists,
    Topquery? topquery,
    Shows? shows,
    Episodes? episodes,
  }) {
    return SearchResults(
      albums: albums ?? this.albums,
      songs: songs ?? this.songs,
      playlists: playlists ?? this.playlists,
      artists: artists ?? this.artists,
      topquery: topquery ?? this.topquery,
      shows: shows ?? this.shows,
      episodes: episodes ?? this.episodes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'albums': albums.toMap(),
      'songs': songs.toMap(),
      'playlists': playlists.toMap(),
      'artists': artists.toMap(),
      'topquery': topquery.toMap(),
      'shows': shows.toMap(),
      'episodes': episodes.toMap(),
    };
  }

  factory SearchResults.fromMap(Map<String, dynamic> map) {
    return SearchResults(
      albums: Albums.fromMap(map['albums']),
      songs: Songs.fromMap(map['songs']),
      playlists: Playlists.fromMap(map['playlists']),
      artists: Artists.fromMap(map['artists']),
      topquery: Topquery.fromMap(map['topquery']),
      shows: Shows.fromMap(map['shows']),
      episodes: Episodes.fromMap(map['episodes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResults.fromJson(String source) =>
      SearchResults.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SearchResults(albums: $albums, songs: $songs, playlists: $playlists, artists: $artists, topquery: $topquery, shows: $shows, episodes: $episodes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchResults &&
        other.albums == albums &&
        other.songs == songs &&
        other.playlists == playlists &&
        other.artists == artists &&
        other.topquery == topquery &&
        other.shows == shows &&
        other.episodes == episodes;
  }

  @override
  int get hashCode {
    return albums.hashCode ^
        songs.hashCode ^
        playlists.hashCode ^
        artists.hashCode ^
        topquery.hashCode ^
        shows.hashCode ^
        episodes.hashCode;
  }
}

class Albums {
  final List<Data> data;
  final int position;
  Albums({
    required this.data,
    required this.position,
  });

  Albums copyWith({
    List<Data>? data,
    int? position,
  }) {
    return Albums(
      data: data ?? this.data,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'position': position,
    };
  }

  factory Albums.fromMap(Map<String, dynamic> map) {
    return Albums(
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
      position: map['position']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Albums.fromJson(String source) => Albums.fromMap(json.decode(source));

  @override
  String toString() => 'Albums(data: $data, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Albums &&
        listEquals(other.data, data) &&
        other.position == position;
  }

  @override
  int get hashCode => data.hashCode ^ position.hashCode;
}

class Data {
  final String id;
  final String title;
  final String subtitle;
  final String type;
  final String image;
  final String perma_url;
  final Album_More_info more_info;
  final String explicit_content;
  final bool mini_obj;
  final String description;
  Data({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.image,
    required this.perma_url,
    required this.more_info,
    required this.explicit_content,
    required this.mini_obj,
    required this.description,
  });

  Data copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? type,
    String? image,
    String? perma_url,
    Album_More_info? more_info,
    String? explicit_content,
    bool? mini_obj,
    String? description,
  }) {
    return Data(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      image: image ?? this.image,
      perma_url: perma_url ?? this.perma_url,
      more_info: more_info ?? this.more_info,
      explicit_content: explicit_content ?? this.explicit_content,
      mini_obj: mini_obj ?? this.mini_obj,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'type': type,
      'image': image,
      'perma_url': perma_url,
      'more_info': more_info.toMap(),
      'explicit_content': explicit_content,
      'mini_obj': mini_obj,
      'description': description,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      type: map['type'],
      image: map['image'],
      perma_url: map['perma_url'],
      more_info: Album_More_info.fromMap(map['more_info']),
      explicit_content: map['explicit_content'],
      mini_obj: map['mini_obj'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, title: $title, subtitle: $subtitle, type: $type, image: $image, perma_url: $perma_url, more_info: $more_info, explicit_content: $explicit_content, mini_obj: $mini_obj, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.type == type &&
        other.image == image &&
        other.perma_url == perma_url &&
        other.more_info == more_info &&
        other.explicit_content == explicit_content &&
        other.mini_obj == mini_obj &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        type.hashCode ^
        image.hashCode ^
        perma_url.hashCode ^
        more_info.hashCode ^
        explicit_content.hashCode ^
        mini_obj.hashCode ^
        description.hashCode;
  }
}

class Album_More_info {
  final String music;
  final int ctr;
  final String year;
  final String is_movie;
  final String language;
  final String song_pids;
  final String firstname;
  final List<String> artist_name;
  final String entity_type;
  final String entity_sub_type;
  final bool video_available;
  final bool is_dolby_content;

  final String lastname;
  Album_More_info({
    required this.music,
    required this.ctr,
    required this.year,
    required this.is_movie,
    required this.language,
    required this.song_pids,
    required this.firstname,
    required this.artist_name,
    required this.entity_type,
    required this.entity_sub_type,
    required this.video_available,
    required this.is_dolby_content,
    required this.lastname,
  });

  Album_More_info copyWith({
    String? music,
    int? ctr,
    String? year,
    String? is_movie,
    String? language,
    String? song_pids,
    String? firstname,
    List<String>? artist_name,
    String? entity_type,
    String? entity_sub_type,
    bool? video_available,
    bool? is_dolby_content,
    String? lastname,
  }) {
    return Album_More_info(
      music: music ?? this.music,
      ctr: ctr ?? this.ctr,
      year: year ?? this.year,
      is_movie: is_movie ?? this.is_movie,
      language: language ?? this.language,
      song_pids: song_pids ?? this.song_pids,
      firstname: firstname ?? this.firstname,
      artist_name: artist_name ?? this.artist_name,
      entity_type: entity_type ?? this.entity_type,
      entity_sub_type: entity_sub_type ?? this.entity_sub_type,
      video_available: video_available ?? this.video_available,
      is_dolby_content: is_dolby_content ?? this.is_dolby_content,
      lastname: lastname ?? this.lastname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'music': music,
      'ctr': ctr,
      'year': year,
      'is_movie': is_movie,
      'language': language,
      'song_pids': song_pids,
    };
  }

  factory Album_More_info.fromMap(Map<String, dynamic> map) {
    if (map != null && map.isNotEmpty) {
      return Album_More_info(
        music: map['music'],
        ctr: map['ctr']?.toInt(),
        year: map['year'],
        is_movie: map['is_movie'],
        language: map['language'],
        song_pids: map['song_pids'],
        firstname: map['firstname'],
        artist_name: map['artist_name'] != null
            ? List<String>.from(map['artist_name'])
            : [],
        entity_type: map['entity_type'],
        entity_sub_type: map['entity_sub_type'],
        video_available: map['video_available'],
        is_dolby_content: map['is_dolby_content'],
        lastname: map['lastname'],
      );
    } else {
      return Album_More_info(
        music: '',
        ctr: 0,
        year: '',
        is_movie: '',
        language: '',
        song_pids: '',
        firstname: '',
        artist_name: [''],
        entity_type: '',
        entity_sub_type: '',
        video_available: false,
        is_dolby_content: false,
        lastname: '',
      );
    }
  }

  String toJson() => json.encode(toMap());

  factory Album_More_info.fromJson(String source) =>
      Album_More_info.fromMap(json.decode(source));

  @override
  String toString() {
    return 'More_info(music: $music, ctr: $ctr, year: $year, is_movie: $is_movie, language: $language, song_pids: $song_pids)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Album_More_info &&
        other.music == music &&
        other.ctr == ctr &&
        other.year == year &&
        other.is_movie == is_movie &&
        other.language == language &&
        other.song_pids == song_pids;
  }

  @override
  int get hashCode {
    return music.hashCode ^
        ctr.hashCode ^
        year.hashCode ^
        is_movie.hashCode ^
        language.hashCode ^
        song_pids.hashCode;
  }
}

class Songs {
  final List<Data> data;
  final int position;
  Songs({
    required this.data,
    required this.position,
  });

  Songs copyWith({
    List<Data>? data,
    int? position,
  }) {
    return Songs(
      data: data ?? this.data,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'position': position,
    };
  }

  factory Songs.fromMap(Map<String, dynamic> map) {
    return Songs(
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
      position: map['position']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Songs.fromJson(String source) => Songs.fromMap(json.decode(source));

  @override
  String toString() => 'Songs(data: $data, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Songs &&
        listEquals(other.data, data) &&
        other.position == position;
  }

  @override
  int get hashCode => data.hashCode ^ position.hashCode;
}

class Video_available {}

class Playlists {
  final List<Data> data;
  final int position;
  Playlists({
    required this.data,
    required this.position,
  });

  Playlists copyWith({
    List<Data>? data,
    int? position,
  }) {
    return Playlists(
      data: data ?? this.data,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'position': position,
    };
  }

  factory Playlists.fromMap(Map<String, dynamic> map) {
    return Playlists(
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
      position: map['position']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Playlists.fromJson(String source) =>
      Playlists.fromMap(json.decode(source));

  @override
  String toString() => 'Playlists(data: $data, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Playlists &&
        listEquals(other.data, data) &&
        other.position == position;
  }

  @override
  int get hashCode => data.hashCode ^ position.hashCode;
}

// class More_info {
//   final String firstname;
//   final List<String> artist_name;
//   final String entity_type;
//   final String entity_sub_type;
//   final bool video_available;
//   final bool is_dolby_content;
//   final Sub_types sub_types;
//   final Images images;
//   final String lastname;
//   final String language;
//   More_info({
//     required this.firstname,
//     required this.artist_name,
//     required this.entity_type,
//     required this.entity_sub_type,
//     required this.video_available,
//     required this.is_dolby_content,
//     required this.sub_types,
//     required this.images,
//     required this.lastname,
//     required this.language,
//   });

//   More_info copyWith({
//     String? firstname,
//     List<String>? artist_name,
//     String? entity_type,
//     String? entity_sub_type,
//     bool? video_available,
//     bool? is_dolby_content,
//     Sub_types? sub_types,
//     Images? images,
//     String? lastname,
//     String? language,
//   }) {
//     return More_info(
//       firstname: firstname ?? this.firstname,
//       artist_name: artist_name ?? this.artist_name,
//       entity_type: entity_type ?? this.entity_type,
//       entity_sub_type: entity_sub_type ?? this.entity_sub_type,
//       video_available: video_available ?? this.video_available,
//       is_dolby_content: is_dolby_content ?? this.is_dolby_content,
//       sub_types: sub_types ?? this.sub_types,
//       images: images ?? this.images,
//       lastname: lastname ?? this.lastname,
//       language: language ?? this.language,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'firstname': firstname,
//       'artist_name': artist_name,
//       'entity_type': entity_type,
//       'entity_sub_type': entity_sub_type,
//       'video_available': video_available,
//       'is_dolby_content': is_dolby_content,
//       'sub_types': sub_types.toMap(),
//       'images': images.toMap(),
//       'lastname': lastname,
//       'language': language,
//     };
//   }

//   factory More_info.fromMap(Map<String, dynamic> map) {
//     return More_info(
//       firstname: map['firstname'],
//       artist_name: List<String>.from(map['artist_name']),
//       entity_type: map['entity_type'],
//       entity_sub_type: map['entity_sub_type'],
//       video_available: map['video_available'],
//       is_dolby_content: map['is_dolby_content'],
//       sub_types: Sub_types.fromMap(map['sub_types']),
//       images: Images.fromMap(map['images']),
//       lastname: map['lastname'],
//       language: map['language'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory More_info.fromJson(String source) => More_info.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'More_info(firstname: $firstname, artist_name: $artist_name, entity_type: $entity_type, entity_sub_type: $entity_sub_type, video_available: $video_available, is_dolby_content: $is_dolby_content, sub_types: $sub_types, images: $images, lastname: $lastname, language: $language)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is More_info &&
//       other.firstname == firstname &&
//       listEquals(other.artist_name, artist_name) &&
//       other.entity_type == entity_type &&
//       other.entity_sub_type == entity_sub_type &&
//       other.video_available == video_available &&
//       other.is_dolby_content == is_dolby_content &&
//       other.sub_types == sub_types &&
//       other.images == images &&
//       other.lastname == lastname &&
//       other.language == language;
//   }

//   @override
//   int get hashCode {
//     return firstname.hashCode ^
//       artist_name.hashCode ^
//       entity_type.hashCode ^
//       entity_sub_type.hashCode ^
//       video_available.hashCode ^
//       is_dolby_content.hashCode ^
//       sub_types.hashCode ^
//       images.hashCode ^
//       lastname.hashCode ^
//       language.hashCode;
//   }
// }

class Sub_types {}

class Images {}

class Artists {
  final List<dynamic> data;
  final int position;
  Artists({
    required this.data,
    required this.position,
  });

  Artists copyWith({
    List<dynamic>? data,
    int? position,
  }) {
    return Artists(
      data: data ?? this.data,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'position': position,
    };
  }

  factory Artists.fromMap(Map<String, dynamic> map) {
    return Artists(
      data: List<dynamic>.from(map['data']),
      position: map['position']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Artists.fromJson(String source) =>
      Artists.fromMap(json.decode(source));

  @override
  String toString() => 'Artists(data: $data, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Artists &&
        listEquals(other.data, data) &&
        other.position == position;
  }

  @override
  int get hashCode => data.hashCode ^ position.hashCode;
}

class Topquery {
  final List<Data> data;
  final int position;
  Topquery({
    required this.data,
    required this.position,
  });

  Topquery copyWith({
    List<Data>? data,
    int? position,
  }) {
    return Topquery(
      data: data ?? this.data,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'position': position,
    };
  }

  factory Topquery.fromMap(Map<String, dynamic> map) {
    return Topquery(
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
      position: map['position']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Topquery.fromJson(String source) =>
      Topquery.fromMap(json.decode(source));

  @override
  String toString() => 'Topquery(data: $data, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Topquery &&
        listEquals(other.data, data) &&
        other.position == position;
  }

  @override
  int get hashCode => data.hashCode ^ position.hashCode;
}

class Shows {
  final List<dynamic> data;
  final int position;
  Shows({
    required this.data,
    required this.position,
  });

  Shows copyWith({
    List<dynamic>? data,
    int? position,
  }) {
    return Shows(
      data: data ?? this.data,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'position': position,
    };
  }

  factory Shows.fromMap(Map<String, dynamic> map) {
    return Shows(
      data: List<dynamic>.from(map['data']),
      position: map['position']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Shows.fromJson(String source) => Shows.fromMap(json.decode(source));

  @override
  String toString() => 'Shows(data: $data, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Shows &&
        listEquals(other.data, data) &&
        other.position == position;
  }

  @override
  int get hashCode => data.hashCode ^ position.hashCode;
}

class Episodes {
  final List<dynamic> data;
  final int position;
  Episodes({
    required this.data,
    required this.position,
  });

  Episodes copyWith({
    List<dynamic>? data,
    int? position,
  }) {
    return Episodes(
      data: data ?? this.data,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'position': position,
    };
  }

  factory Episodes.fromMap(Map<String, dynamic> map) {
    return Episodes(
      data: List<dynamic>.from(map['data']),
      position: map['position']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Episodes.fromJson(String source) =>
      Episodes.fromMap(json.decode(source));

  @override
  String toString() => 'Episodes(data: $data, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Episodes &&
        listEquals(other.data, data) &&
        other.position == position;
  }

  @override
  int get hashCode => data.hashCode ^ position.hashCode;
}
