import 'dart:convert';

import 'package:flutter/foundation.dart';

class PlaylistInfo {
  final String id;
  final String title;
  final String subtitle;
  final String header_desc;
  final String type;
  final String perma_url;
  final String image;
  final String language;
  final String year;
  final String play_count;
  final String explicit_content;
  final String list_count;
  final String list_type;
  final List<SongList> list;
  final More_info more_info;
  PlaylistInfo({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.header_desc,
    required this.type,
    required this.perma_url,
    required this.image,
    required this.language,
    required this.year,
    required this.play_count,
    required this.explicit_content,
    required this.list_count,
    required this.list_type,
    required this.list,
    required this.more_info,
  });

  PlaylistInfo copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? header_desc,
    String? type,
    String? perma_url,
    String? image,
    String? language,
    String? year,
    String? play_count,
    String? explicit_content,
    String? list_count,
    String? list_type,
    List<SongList>? list,
    More_info? more_info,
  }) {
    return PlaylistInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      header_desc: header_desc ?? this.header_desc,
      type: type ?? this.type,
      perma_url: perma_url ?? this.perma_url,
      image: image ?? this.image,
      language: language ?? this.language,
      year: year ?? this.year,
      play_count: play_count ?? this.play_count,
      explicit_content: explicit_content ?? this.explicit_content,
      list_count: list_count ?? this.list_count,
      list_type: list_type ?? this.list_type,
      list: list ?? this.list,
      more_info: more_info ?? this.more_info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'header_desc': header_desc,
      'type': type,
      'perma_url': perma_url,
      'image': image,
      'language': language,
      'year': year,
      'play_count': play_count,
      'explicit_content': explicit_content,
      'list_count': list_count,
      'list_type': list_type,
      'list': list,
      'more_info': more_info.toMap(),
    };
  }

  factory PlaylistInfo.fromMap(Map<String, dynamic> map) {
    return PlaylistInfo(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      header_desc: map['header_desc'],
      type: map['type'],
      perma_url: map['perma_url'],
      image: map['image'],
      language: map['language'],
      year: map['year'],
      play_count: map['play_count'],
      explicit_content: map['explicit_content'],
      list_count: map['list_count'],
      list_type: map['list_type'],
      list: (map['list'] as List<dynamic>)
          .map((e) => SongList.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      more_info: More_info.fromMap(map['more_info']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistInfo.fromJson(String source) =>
      PlaylistInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlaylistInfo(id: $id, title: $title, subtitle: $subtitle, header_desc: $header_desc, type: $type, perma_url: $perma_url, image: $image, language: $language, year: $year, play_count: $play_count, explicit_content: $explicit_content, list_count: $list_count, list_type: $list_type, list: $list, more_info: $more_info)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlaylistInfo &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.header_desc == header_desc &&
        other.type == type &&
        other.perma_url == perma_url &&
        other.image == image &&
        other.language == language &&
        other.year == year &&
        other.play_count == play_count &&
        other.explicit_content == explicit_content &&
        other.list_count == list_count &&
        other.list_type == list_type &&
        listEquals(other.list, list) &&
        other.more_info == more_info;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        header_desc.hashCode ^
        type.hashCode ^
        perma_url.hashCode ^
        image.hashCode ^
        language.hashCode ^
        year.hashCode ^
        play_count.hashCode ^
        explicit_content.hashCode ^
        list_count.hashCode ^
        list_type.hashCode ^
        list.hashCode ^
        more_info.hashCode;
  }
}

class SongList {
  final String id;
  final String title;
  final String subtitle;
  final String header_desc;
  final String type;
  final String perma_url;
  final String image;
  final String language;
  final String year;
  final String play_count;
  final String explicit_content;
  final String list_count;
  final String list_type;
  final String list;
  final Song_More_info more_info;
  SongList({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.header_desc,
    required this.type,
    required this.perma_url,
    required this.image,
    required this.language,
    required this.year,
    required this.play_count,
    required this.explicit_content,
    required this.list_count,
    required this.list_type,
    required this.list,
    required this.more_info,
  });

  SongList copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? header_desc,
    String? type,
    String? perma_url,
    String? image,
    String? language,
    String? year,
    String? play_count,
    String? explicit_content,
    String? list_count,
    String? list_type,
    String? list,
    Song_More_info? more_info,
  }) {
    return SongList(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      header_desc: header_desc ?? this.header_desc,
      type: type ?? this.type,
      perma_url: perma_url ?? this.perma_url,
      image: image ?? this.image,
      language: language ?? this.language,
      year: year ?? this.year,
      play_count: play_count ?? this.play_count,
      explicit_content: explicit_content ?? this.explicit_content,
      list_count: list_count ?? this.list_count,
      list_type: list_type ?? this.list_type,
      list: list ?? this.list,
      more_info: more_info ?? this.more_info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'header_desc': header_desc,
      'type': type,
      'perma_url': perma_url,
      'image': image,
      'language': language,
      'year': year,
      'play_count': play_count,
      'explicit_content': explicit_content,
      'list_count': list_count,
      'list_type': list_type,
      'list': list,
      'more_info': more_info.toMap(),
    };
  }

  factory SongList.fromMap(Map<String, dynamic> map) {
    return SongList(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      header_desc: map['header_desc'],
      type: map['type'],
      perma_url: map['perma_url'],
      image: map['image'],
      language: map['language'],
      year: map['year'],
      play_count: map['play_count'],
      explicit_content: map['explicit_content'],
      list_count: map['list_count'],
      list_type: map['list_type'],
      list: map['list'],
      more_info: Song_More_info.fromMap(map['more_info']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SongList.fromJson(String source) =>
      SongList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'List(id: $id, title: $title, subtitle: $subtitle, header_desc: $header_desc, type: $type, perma_url: $perma_url, image: $image, language: $language, year: $year, play_count: $play_count, explicit_content: $explicit_content, list_count: $list_count, list_type: $list_type, list: $list, more_info: $more_info)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SongList &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.header_desc == header_desc &&
        other.type == type &&
        other.perma_url == perma_url &&
        other.image == image &&
        other.language == language &&
        other.year == year &&
        other.play_count == play_count &&
        other.explicit_content == explicit_content &&
        other.list_count == list_count &&
        other.list_type == list_type &&
        other.list == list &&
        other.more_info == more_info;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        header_desc.hashCode ^
        type.hashCode ^
        perma_url.hashCode ^
        image.hashCode ^
        language.hashCode ^
        year.hashCode ^
        play_count.hashCode ^
        explicit_content.hashCode ^
        list_count.hashCode ^
        list_type.hashCode ^
        list.hashCode ^
        more_info.hashCode;
  }
}

class Song_More_info {
  final String music;
  final String album_id;
  final String album;
  final String label;
  final String origin;
  final bool is_dolby_content;
  final String n320kbps;
  final String encrypted_media_url;
  final String encrypted_cache_url;
  final String album_url;
  final String duration;
  final Rights rights;
  final String cache_state;
  final String has_lyrics;
  final String lyrics_snippet;
  final String starred;
  final String copyright_text;
  final ArtistMap artistMap;
  final String release_date;
  final String vcode;
  final String vlink;
  final bool triller_available;
  final String lyrics_id;
  Song_More_info({
    required this.music,
    required this.album_id,
    required this.album,
    required this.label,
    required this.origin,
    required this.is_dolby_content,
    required this.n320kbps,
    required this.encrypted_media_url,
    required this.encrypted_cache_url,
    required this.album_url,
    required this.duration,
    required this.rights,
    required this.cache_state,
    required this.has_lyrics,
    required this.lyrics_snippet,
    required this.starred,
    required this.copyright_text,
    required this.artistMap,
    required this.release_date,
    required this.vcode,
    required this.vlink,
    required this.triller_available,
    required this.lyrics_id,
  });

  Song_More_info copyWith({
    String? music,
    String? album_id,
    String? album,
    String? label,
    String? origin,
    bool? is_dolby_content,
    String? n320kbps,
    String? encrypted_media_url,
    String? encrypted_cache_url,
    String? album_url,
    String? duration,
    Rights? rights,
    String? cache_state,
    String? has_lyrics,
    String? lyrics_snippet,
    String? starred,
    String? copyright_text,
    ArtistMap? artistMap,
    String? release_date,
    String? vcode,
    String? vlink,
    bool? triller_available,
    String? lyrics_id,
  }) {
    return Song_More_info(
      music: music ?? this.music,
      album_id: album_id ?? this.album_id,
      album: album ?? this.album,
      label: label ?? this.label,
      origin: origin ?? this.origin,
      is_dolby_content: is_dolby_content ?? this.is_dolby_content,
      n320kbps: n320kbps ?? this.n320kbps,
      encrypted_media_url: encrypted_media_url ?? this.encrypted_media_url,
      encrypted_cache_url: encrypted_cache_url ?? this.encrypted_cache_url,
      album_url: album_url ?? this.album_url,
      duration: duration ?? this.duration,
      rights: rights ?? this.rights,
      cache_state: cache_state ?? this.cache_state,
      has_lyrics: has_lyrics ?? this.has_lyrics,
      lyrics_snippet: lyrics_snippet ?? this.lyrics_snippet,
      starred: starred ?? this.starred,
      copyright_text: copyright_text ?? this.copyright_text,
      artistMap: artistMap ?? this.artistMap,
      release_date: release_date ?? this.release_date,
      vcode: vcode ?? this.vcode,
      vlink: vlink ?? this.vlink,
      triller_available: triller_available ?? this.triller_available,
      lyrics_id: lyrics_id ?? this.lyrics_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'music': music,
      'album_id': album_id,
      'album': album,
      'label': label,
      'origin': origin,
      'is_dolby_content': is_dolby_content,
      '320kbps': n320kbps,
      'encrypted_media_url': encrypted_media_url,
      'encrypted_cache_url': encrypted_cache_url,
      'album_url': album_url,
      'duration': duration,
      'rights': rights.toMap(),
      'cache_state': cache_state,
      'has_lyrics': has_lyrics,
      'lyrics_snippet': lyrics_snippet,
      'starred': starred,
      'copyright_text': copyright_text,
      'artistMap': artistMap.toMap(),
      'release_date': release_date,
      'vcode': vcode,
      'vlink': vlink,
      'triller_available': triller_available,
      'lyrics_id': lyrics_id,
    };
  }

  factory Song_More_info.fromMap(Map<String, dynamic> map) {
    return Song_More_info(
      music: map['music'],
      album_id: map['album_id'],
      album: map['album'],
      label: map['label'],
      origin: map['origin'],
      is_dolby_content: map['is_dolby_content'],
      n320kbps: map['320kbps'],
      encrypted_media_url: map['encrypted_media_url'],
      encrypted_cache_url: map['encrypted_cache_url'],
      album_url: map['album_url'],
      duration: map['duration'],
      rights: Rights.fromMap(map['rights']),
      cache_state: map['cache_state'],
      has_lyrics: map['has_lyrics'],
      lyrics_snippet: map['lyrics_snippet'],
      starred: map['starred'],
      copyright_text: map['copyright_text'],
      artistMap: ArtistMap.fromMap(map['artistMap']),
      release_date: map['release_date'],
      vcode: map['vcode'],
      vlink: map['vlink'],
      triller_available: map['triller_available'],
      lyrics_id: map['lyrics_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Song_More_info.fromJson(String source) =>
      Song_More_info.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Song_More_info(music: $music, album_id: $album_id, album: $album, label: $label, origin: $origin, is_dolby_content: $is_dolby_content, n320kbps: $n320kbps, encrypted_media_url: $encrypted_media_url, encrypted_cache_url: $encrypted_cache_url, album_url: $album_url, duration: $duration, rights: $rights, cache_state: $cache_state, has_lyrics: $has_lyrics, lyrics_snippet: $lyrics_snippet, starred: $starred, copyright_text: $copyright_text, artistMap: $artistMap, release_date: $release_date, vcode: $vcode, vlink: $vlink, triller_available: $triller_available, lyrics_id: $lyrics_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Song_More_info &&
        other.music == music &&
        other.album_id == album_id &&
        other.album == album &&
        other.label == label &&
        other.origin == origin &&
        other.is_dolby_content == is_dolby_content &&
        other.n320kbps == n320kbps &&
        other.encrypted_media_url == encrypted_media_url &&
        other.encrypted_cache_url == encrypted_cache_url &&
        other.album_url == album_url &&
        other.duration == duration &&
        other.rights == rights &&
        other.cache_state == cache_state &&
        other.has_lyrics == has_lyrics &&
        other.lyrics_snippet == lyrics_snippet &&
        other.starred == starred &&
        other.copyright_text == copyright_text &&
        other.artistMap == artistMap &&
        other.release_date == release_date &&
        other.vcode == vcode &&
        other.vlink == vlink &&
        other.triller_available == triller_available &&
        other.lyrics_id == lyrics_id;
  }

  @override
  int get hashCode {
    return music.hashCode ^
        album_id.hashCode ^
        album.hashCode ^
        label.hashCode ^
        origin.hashCode ^
        is_dolby_content.hashCode ^
        n320kbps.hashCode ^
        encrypted_media_url.hashCode ^
        encrypted_cache_url.hashCode ^
        album_url.hashCode ^
        duration.hashCode ^
        rights.hashCode ^
        cache_state.hashCode ^
        has_lyrics.hashCode ^
        lyrics_snippet.hashCode ^
        starred.hashCode ^
        copyright_text.hashCode ^
        artistMap.hashCode ^
        release_date.hashCode ^
        vcode.hashCode ^
        vlink.hashCode ^
        triller_available.hashCode ^
        lyrics_id.hashCode;
  }
}

class Rights {
  final String code;
  final String cacheable;
  final String delete_cached_object;
  final String reason;
  Rights({
    required this.code,
    required this.cacheable,
    required this.delete_cached_object,
    required this.reason,
  });

  Rights copyWith({
    String? code,
    String? cacheable,
    String? delete_cached_object,
    String? reason,
  }) {
    return Rights(
      code: code ?? this.code,
      cacheable: cacheable ?? this.cacheable,
      delete_cached_object: delete_cached_object ?? this.delete_cached_object,
      reason: reason ?? this.reason,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'cacheable': cacheable,
      'delete_cached_object': delete_cached_object,
      'reason': reason,
    };
  }

  factory Rights.fromMap(Map<String, dynamic> map) {
    return Rights(
      code: map['code'],
      cacheable: map['cacheable'],
      delete_cached_object: map['delete_cached_object'],
      reason: map['reason'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rights.fromJson(String source) => Rights.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rights(code: $code, cacheable: $cacheable, delete_cached_object: $delete_cached_object, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rights &&
        other.code == code &&
        other.cacheable == cacheable &&
        other.delete_cached_object == delete_cached_object &&
        other.reason == reason;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        cacheable.hashCode ^
        delete_cached_object.hashCode ^
        reason.hashCode;
  }
}

class ArtistMap {
  final List<Primary_artist> primary_artists;
  final List<dynamic> featured_artists;
  final List<Artist> artists;
  ArtistMap({
    required this.primary_artists,
    required this.featured_artists,
    required this.artists,
  });

  ArtistMap copyWith({
    List<Primary_artist>? primary_artists,
    List<dynamic>? featured_artists,
    List<Artist>? artists,
  }) {
    return ArtistMap(
      primary_artists: primary_artists ?? this.primary_artists,
      featured_artists: featured_artists ?? this.featured_artists,
      artists: artists ?? this.artists,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primary_artists': primary_artists.map((x) => x.toMap()).toList(),
      'featured_artists': featured_artists,
      'artists': artists.map((x) => x.toMap()).toList(),
    };
  }

  factory ArtistMap.fromMap(Map<String, dynamic> map) {
    return ArtistMap(
      primary_artists: List<Primary_artist>.from(
          map['primary_artists']?.map((x) => Primary_artist.fromMap(x))),
      featured_artists: List<dynamic>.from(map['featured_artists']),
      artists: List<Artist>.from(map['artists']?.map((x) => Artist.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistMap.fromJson(String source) =>
      ArtistMap.fromMap(json.decode(source));

  @override
  String toString() =>
      'ArtistMap(primary_artists: $primary_artists, featured_artists: $featured_artists, artists: $artists)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArtistMap &&
        listEquals(other.primary_artists, primary_artists) &&
        listEquals(other.featured_artists, featured_artists) &&
        listEquals(other.artists, artists);
  }

  @override
  int get hashCode =>
      primary_artists.hashCode ^ featured_artists.hashCode ^ artists.hashCode;
}

class Primary_artist {
  final String id;
  final String name;
  final String role;
  final String image;
  final String type;
  final String perma_url;
  Primary_artist({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.type,
    required this.perma_url,
  });

  Primary_artist copyWith({
    String? id,
    String? name,
    String? role,
    String? image,
    String? type,
    String? perma_url,
  }) {
    return Primary_artist(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      image: image ?? this.image,
      type: type ?? this.type,
      perma_url: perma_url ?? this.perma_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'image': image,
      'type': type,
      'perma_url': perma_url,
    };
  }

  factory Primary_artist.fromMap(Map<String, dynamic> map) {
    return Primary_artist(
      id: map['id'],
      name: map['name'],
      role: map['role'],
      image: map['image'],
      type: map['type'],
      perma_url: map['perma_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Primary_artist.fromJson(String source) =>
      Primary_artist.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Primary_artist(id: $id, name: $name, role: $role, image: $image, type: $type, perma_url: $perma_url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Primary_artist &&
        other.id == id &&
        other.name == name &&
        other.role == role &&
        other.image == image &&
        other.type == type &&
        other.perma_url == perma_url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        role.hashCode ^
        image.hashCode ^
        type.hashCode ^
        perma_url.hashCode;
  }
}

class Artist {
  final String id;
  final String name;
  final String role;
  final String image;
  final String type;
  final String perma_url;
  Artist({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.type,
    required this.perma_url,
  });

  Artist copyWith({
    String? id,
    String? name,
    String? role,
    String? image,
    String? type,
    String? perma_url,
  }) {
    return Artist(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      image: image ?? this.image,
      type: type ?? this.type,
      perma_url: perma_url ?? this.perma_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'image': image,
      'type': type,
      'perma_url': perma_url,
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      id: map['id'],
      name: map['name'],
      role: map['role'],
      image: map['image'],
      type: map['type'],
      perma_url: map['perma_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) => Artist.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Artist(id: $id, name: $name, role: $role, image: $image, type: $type, perma_url: $perma_url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Artist &&
        other.id == id &&
        other.name == name &&
        other.role == role &&
        other.image == image &&
        other.type == type &&
        other.perma_url == perma_url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        role.hashCode ^
        image.hashCode ^
        type.hashCode ^
        perma_url.hashCode;
  }
}

class More_info {
  final String uid;
  final bool is_dolby_content;
  final List<dynamic> subtype;
  final String last_updated;
  final String username;
  final String firstname;
  final String lastname;
  final String is_followed;
  final bool isFY;
  final String follower_count;
  final String fan_count;
  final String playlist_type;
  final String share;
  final List<dynamic> sub_types;
  final List<dynamic> images;
  final String video_count;
  More_info({
    required this.uid,
    required this.is_dolby_content,
    required this.subtype,
    required this.last_updated,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.is_followed,
    required this.isFY,
    required this.follower_count,
    required this.fan_count,
    required this.playlist_type,
    required this.share,
    required this.sub_types,
    required this.images,
    required this.video_count,
  });

  More_info copyWith({
    String? uid,
    bool? is_dolby_content,
    List<dynamic>? subtype,
    String? last_updated,
    String? username,
    String? firstname,
    String? lastname,
    String? is_followed,
    bool? isFY,
    String? follower_count,
    String? fan_count,
    String? playlist_type,
    String? share,
    List<dynamic>? sub_types,
    List<dynamic>? images,
    String? video_count,
  }) {
    return More_info(
      uid: uid ?? this.uid,
      is_dolby_content: is_dolby_content ?? this.is_dolby_content,
      subtype: subtype ?? this.subtype,
      last_updated: last_updated ?? this.last_updated,
      username: username ?? this.username,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      is_followed: is_followed ?? this.is_followed,
      isFY: isFY ?? this.isFY,
      follower_count: follower_count ?? this.follower_count,
      fan_count: fan_count ?? this.fan_count,
      playlist_type: playlist_type ?? this.playlist_type,
      share: share ?? this.share,
      sub_types: sub_types ?? this.sub_types,
      images: images ?? this.images,
      video_count: video_count ?? this.video_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'is_dolby_content': is_dolby_content,
      'subtype': subtype,
      'last_updated': last_updated,
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'is_followed': is_followed,
      'isFY': isFY,
      'follower_count': follower_count,
      'fan_count': fan_count,
      'playlist_type': playlist_type,
      'share': share,
      'sub_types': sub_types,
      'images': images,
      'video_count': video_count,
    };
  }

  factory More_info.fromMap(Map<String, dynamic> map) {
    return More_info(
      uid: map['uid'],
      is_dolby_content: map['is_dolby_content'],
      subtype: List<dynamic>.from(map['subtype']),
      last_updated: map['last_updated'],
      username: map['username'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      is_followed: map['is_followed'],
      isFY: map['isFY'],
      follower_count: map['follower_count'],
      fan_count: map['fan_count'],
      playlist_type: map['playlist_type'],
      share: map['share'],
      sub_types: List<dynamic>.from(map['sub_types']),
      images: List<dynamic>.from(map['images']),
      video_count: map['video_count'],
    );
  }

  String toJson() => json.encode(toMap());

  factory More_info.fromJson(String source) =>
      More_info.fromMap(json.decode(source));

  @override
  String toString() {
    return 'More_info(uid: $uid, is_dolby_content: $is_dolby_content, subtype: $subtype, last_updated: $last_updated, username: $username, firstname: $firstname, lastname: $lastname, is_followed: $is_followed, isFY: $isFY, follower_count: $follower_count, fan_count: $fan_count, playlist_type: $playlist_type, share: $share, sub_types: $sub_types, images: $images video_count: $video_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is More_info &&
        other.uid == uid &&
        other.is_dolby_content == is_dolby_content &&
        listEquals(other.subtype, subtype) &&
        other.last_updated == last_updated &&
        other.username == username &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.is_followed == is_followed &&
        other.isFY == isFY &&
        other.follower_count == follower_count &&
        other.fan_count == fan_count &&
        other.playlist_type == playlist_type &&
        other.share == share &&
        listEquals(other.sub_types, sub_types) &&
        listEquals(other.images, images) &&
        other.video_count == video_count;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        is_dolby_content.hashCode ^
        subtype.hashCode ^
        last_updated.hashCode ^
        username.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        is_followed.hashCode ^
        isFY.hashCode ^
        follower_count.hashCode ^
        fan_count.hashCode ^
        playlist_type.hashCode ^
        share.hashCode ^
        sub_types.hashCode ^
        images.hashCode ^
        video_count.hashCode;
  }
}
