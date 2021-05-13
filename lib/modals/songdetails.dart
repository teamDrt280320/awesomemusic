
import 'package:flutter/foundation.dart';

class SongDetails {
  String? id;
  String? title;
  String? subtitle;
  String? headerDesc;
  String? type;
  String? permaUrl;
  String? image;
  String? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  String? list;
  MoreInfo? moreInfo;
  String? lyrics;
  SongDetails({
    this.id,
    this.title,
    this.subtitle,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
    this.lyrics,
  });

  SongDetails.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    headerDesc = json['header_desc'];
    type = json['type'];
    permaUrl = json['perma_url'];
    image = json['image'];
    language = json['language'];
    year = json['year'];
    playCount = json['play_count'];
    explicitContent = json['explicit_content'];
    listCount = json['list_count'];
    listType = json['list_type'];
    list = json['list'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['header_desc'] = this.headerDesc;
    data['type'] = this.type;
    data['perma_url'] = this.permaUrl;
    data['image'] = this.image;
    data['language'] = this.language;
    data['year'] = this.year;
    data['play_count'] = this.playCount;
    data['explicit_content'] = this.explicitContent;
    data['list_count'] = this.listCount;
    data['list_type'] = this.listType;
    data['list'] = this.list;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    return data;
  }

  SongDetails copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? headerDesc,
    String? type,
    String? permaUrl,
    String? image,
    String? language,
    String? year,
    String? playCount,
    String? explicitContent,
    String? listCount,
    String? listType,
    String? list,
    MoreInfo? moreInfo,
    String? lyrics,
  }) {
    return SongDetails(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      headerDesc: headerDesc ?? this.headerDesc,
      type: type ?? this.type,
      permaUrl: permaUrl ?? this.permaUrl,
      image: image ?? this.image,
      language: language ?? this.language,
      year: year ?? this.year,
      playCount: playCount ?? this.playCount,
      explicitContent: explicitContent ?? this.explicitContent,
      listCount: listCount ?? this.listCount,
      listType: listType ?? this.listType,
      list: list ?? this.list,
      moreInfo: moreInfo ?? this.moreInfo,
      lyrics: lyrics ?? this.lyrics,
    );
  }

  @override
  String toString() {
    return 'SongDetails(id: $id, title: $title, subtitle: $subtitle, headerDesc: $headerDesc, type: $type, permaUrl: $permaUrl, image: $image, language: $language, year: $year, playCount: $playCount, explicitContent: $explicitContent, listCount: $listCount, listType: $listType, list: $list, moreInfo: $moreInfo, lyrics: $lyrics)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SongDetails &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.headerDesc == headerDesc &&
        other.type == type &&
        other.permaUrl == permaUrl &&
        other.image == image &&
        other.language == language &&
        other.year == year &&
        other.playCount == playCount &&
        other.explicitContent == explicitContent &&
        other.listCount == listCount &&
        other.listType == listType &&
        other.list == list &&
        other.moreInfo == moreInfo &&
        other.lyrics == lyrics;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        headerDesc.hashCode ^
        type.hashCode ^
        permaUrl.hashCode ^
        image.hashCode ^
        language.hashCode ^
        year.hashCode ^
        playCount.hashCode ^
        explicitContent.hashCode ^
        listCount.hashCode ^
        listType.hashCode ^
        list.hashCode ^
        moreInfo.hashCode ^
        lyrics.hashCode;
  }
}

class MoreInfo {
  String? music;
  String? albumId;
  String? album;
  String? label;
  String? origin;
  bool? isDolbyContent;
  String? s320kbps;
  String? encryptedMediaUrl;
  String? encryptedCacheUrl;
  String? albumUrl;
  String? duration;
  Rights? rights;
  String? cacheState;
  String? hasLyrics;
  String? lyricsSnippet;
  String? starred;
  String? copyrightText;
  ArtistMap? artistMap;
  String? releaseDate;
  bool? trillerAvailable;
  String? lyricsId;
  MoreInfo({
    this.music,
    this.albumId,
    this.album,
    this.label,
    this.origin,
    this.isDolbyContent,
    this.s320kbps,
    this.encryptedMediaUrl,
    this.encryptedCacheUrl,
    this.albumUrl,
    this.duration,
    this.rights,
    this.cacheState,
    this.hasLyrics,
    this.lyricsSnippet,
    this.starred,
    this.copyrightText,
    this.artistMap,
    this.releaseDate,
    this.trillerAvailable,
    this.lyricsId,
  });

  MoreInfo.fromJson(Map<String?, dynamic> json) {
    music = json['music'];
    albumId = json['album_id'];
    album = json['album'];
    label = json['label'];
    origin = json['origin'];
    isDolbyContent = json['is_dolby_content'];
    s320kbps = json['320kbps'];
    encryptedMediaUrl = json['encrypted_media_url'];
    encryptedCacheUrl = json['encrypted_cache_url'];
    albumUrl = json['album_url'];
    duration = json['duration'];
    rights =
        json['rights'] != null ? new Rights.fromJson(json['rights']) : null;
    cacheState = json['cache_state'];
    hasLyrics = json['has_lyrics'];
    lyricsSnippet = json['lyrics_snippet'];
    starred = json['starred'];
    copyrightText = json['copyright_text'];
    artistMap = json['artistMap'] != null
        ? new ArtistMap.fromJson(json['artistMap'])
        : null;
    releaseDate = json['release_date'];
    trillerAvailable = json['triller_available'];
    lyricsId = json['lyrics_id'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['music'] = this.music;
    data['album_id'] = this.albumId;
    data['album'] = this.album;
    data['label'] = this.label;
    data['origin'] = this.origin;
    data['is_dolby_content'] = this.isDolbyContent;
    data['320kbps'] = this.s320kbps;
    data['encrypted_media_url'] = this.encryptedMediaUrl;
    data['encrypted_cache_url'] = this.encryptedCacheUrl;
    data['album_url'] = this.albumUrl;
    data['duration'] = this.duration;
    if (this.rights != null) {
      data['rights'] = this.rights!.toJson();
    }
    data['cache_state'] = this.cacheState;
    data['has_lyrics'] = this.hasLyrics;
    data['lyrics_snippet'] = this.lyricsSnippet;
    data['starred'] = this.starred;
    data['copyright_text'] = this.copyrightText;
    if (this.artistMap != null) {
      data['artistMap'] = this.artistMap!.toJson();
    }
    data['release_date'] = this.releaseDate;
    data['triller_available'] = this.trillerAvailable;
    data['lyrics_id'] = this.lyricsId;
    return data;
  }

  MoreInfo copyWith({
    String? music,
    String? albumId,
    String? album,
    String? label,
    String? origin,
    bool? isDolbyContent,
    String? s320kbps,
    String? encryptedMediaUrl,
    String? encryptedCacheUrl,
    String? albumUrl,
    String? duration,
    Rights? rights,
    String? cacheState,
    String? hasLyrics,
    String? lyricsSnippet,
    String? starred,
    String? copyrightText,
    ArtistMap? artistMap,
    String? releaseDate,
    bool? trillerAvailable,
    String? lyricsId,
  }) {
    return MoreInfo(
      music: music ?? this.music,
      albumId: albumId ?? this.albumId,
      album: album ?? this.album,
      label: label ?? this.label,
      origin: origin ?? this.origin,
      isDolbyContent: isDolbyContent ?? this.isDolbyContent,
      s320kbps: s320kbps ?? this.s320kbps,
      encryptedMediaUrl: encryptedMediaUrl ?? this.encryptedMediaUrl,
      encryptedCacheUrl: encryptedCacheUrl ?? this.encryptedCacheUrl,
      albumUrl: albumUrl ?? this.albumUrl,
      duration: duration ?? this.duration,
      rights: rights ?? this.rights,
      cacheState: cacheState ?? this.cacheState,
      hasLyrics: hasLyrics ?? this.hasLyrics,
      lyricsSnippet: lyricsSnippet ?? this.lyricsSnippet,
      starred: starred ?? this.starred,
      copyrightText: copyrightText ?? this.copyrightText,
      artistMap: artistMap ?? this.artistMap,
      releaseDate: releaseDate ?? this.releaseDate,
      trillerAvailable: trillerAvailable ?? this.trillerAvailable,
      lyricsId: lyricsId ?? this.lyricsId,
    );
  }

  @override
  String toString() {
    return 'MoreInfo(music: $music, albumId: $albumId, album: $album, label: $label, origin: $origin, isDolbyContent: $isDolbyContent, s320kbps: $s320kbps, encryptedMediaUrl: $encryptedMediaUrl, encryptedCacheUrl: $encryptedCacheUrl, albumUrl: $albumUrl, duration: $duration, rights: $rights, cacheState: $cacheState, hasLyrics: $hasLyrics, lyricsSnippet: $lyricsSnippet, starred: $starred, copyrightText: $copyrightText, artistMap: $artistMap, releaseDate: $releaseDate, trillerAvailable: $trillerAvailable, lyricsId: $lyricsId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoreInfo &&
        other.music == music &&
        other.albumId == albumId &&
        other.album == album &&
        other.label == label &&
        other.origin == origin &&
        other.isDolbyContent == isDolbyContent &&
        other.s320kbps == s320kbps &&
        other.encryptedMediaUrl == encryptedMediaUrl &&
        other.encryptedCacheUrl == encryptedCacheUrl &&
        other.albumUrl == albumUrl &&
        other.duration == duration &&
        other.rights == rights &&
        other.cacheState == cacheState &&
        other.hasLyrics == hasLyrics &&
        other.lyricsSnippet == lyricsSnippet &&
        other.starred == starred &&
        other.copyrightText == copyrightText &&
        other.artistMap == artistMap &&
        other.releaseDate == releaseDate &&
        other.trillerAvailable == trillerAvailable &&
        other.lyricsId == lyricsId;
  }

  @override
  int get hashCode {
    return music.hashCode ^
        albumId.hashCode ^
        album.hashCode ^
        label.hashCode ^
        origin.hashCode ^
        isDolbyContent.hashCode ^
        s320kbps.hashCode ^
        encryptedMediaUrl.hashCode ^
        encryptedCacheUrl.hashCode ^
        albumUrl.hashCode ^
        duration.hashCode ^
        rights.hashCode ^
        cacheState.hashCode ^
        hasLyrics.hashCode ^
        lyricsSnippet.hashCode ^
        starred.hashCode ^
        copyrightText.hashCode ^
        artistMap.hashCode ^
        releaseDate.hashCode ^
        trillerAvailable.hashCode ^
        lyricsId.hashCode;
  }
}

class Rights {
  String? code;
  String? cacheable;
  String? deleteCachedObject;
  String? reason;
  Rights({
    this.code,
    this.cacheable,
    this.deleteCachedObject,
    this.reason,
  });

  Rights.fromJson(Map<String?, dynamic> json) {
    code = json['code'];
    cacheable = json['cacheable'];
    deleteCachedObject = json['delete_cached_object'];
    reason = json['reason'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['code'] = this.code;
    data['cacheable'] = this.cacheable;
    data['delete_cached_object'] = this.deleteCachedObject;
    data['reason'] = this.reason;
    return data;
  }

  Rights copyWith({
    String? code,
    String? cacheable,
    String? deleteCachedObject,
    String? reason,
  }) {
    return Rights(
      code: code ?? this.code,
      cacheable: cacheable ?? this.cacheable,
      deleteCachedObject: deleteCachedObject ?? this.deleteCachedObject,
      reason: reason ?? this.reason,
    );
  }

  @override
  String toString() {
    return 'Rights(code: $code, cacheable: $cacheable, deleteCachedObject: $deleteCachedObject, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rights &&
        other.code == code &&
        other.cacheable == cacheable &&
        other.deleteCachedObject == deleteCachedObject &&
        other.reason == reason;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        cacheable.hashCode ^
        deleteCachedObject.hashCode ^
        reason.hashCode;
  }
}

class ArtistMap {
  List<PrimaryArtists>? primaryArtists;
  List<PrimaryArtists>? featuredArtists;
  List<PrimaryArtists>? artists;
  ArtistMap({
    this.primaryArtists,
    this.featuredArtists,
    this.artists,
  });

  ArtistMap.fromJson(Map<String?, dynamic> json) {
    if (json['primary_artists'] != null) {
      primaryArtists = [];
      json['primary_artists'].forEach((v) {
        primaryArtists!.add(new PrimaryArtists.fromJson(v));
      });
    }
    if (json['featured_artists'] != null) {
      featuredArtists = [];
      json['featured_artists'].forEach((v) {
        featuredArtists!.add(new PrimaryArtists.fromJson(v));
      });
    }
    if (json['artists'] != null) {
      artists = [];
      json['artists'].forEach((v) {
        artists!.add(new PrimaryArtists.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    if (this.primaryArtists != null) {
      data['primary_artists'] =
          this.primaryArtists!.map((v) => v.toJson()).toList();
    }
    if (this.featuredArtists != null) {
      data['featured_artists'] =
          this.featuredArtists!.map((v) => v.toJson()).toList();
    }
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ArtistMap copyWith({
    List<PrimaryArtists>? primaryArtists,
    List<PrimaryArtists>? featuredArtists,
    List<PrimaryArtists>? artists,
  }) {
    return ArtistMap(
      primaryArtists: primaryArtists ?? this.primaryArtists,
      featuredArtists: featuredArtists ?? this.featuredArtists,
      artists: artists ?? this.artists,
    );
  }

  @override
  String toString() =>
      'ArtistMap(primaryArtists: $primaryArtists, featuredArtists: $featuredArtists, artists: $artists)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArtistMap &&
        listEquals(other.primaryArtists, primaryArtists) &&
        listEquals(other.featuredArtists, featuredArtists) &&
        listEquals(other.artists, artists);
  }

  @override
  int get hashCode =>
      primaryArtists.hashCode ^ featuredArtists.hashCode ^ artists.hashCode;
}

class PrimaryArtists {
  String? id;
  String? name;
  String? role;
  String? image;
  String? type;
  String? permaUrl;
  PrimaryArtists({
    this.id,
    this.name,
    this.role,
    this.image,
    this.type,
    this.permaUrl,
  });

  PrimaryArtists.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    image = json['image'];
    type = json['type'];
    permaUrl = json['perma_url'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['image'] = this.image;
    data['type'] = this.type;
    data['perma_url'] = this.permaUrl;
    return data;
  }

  PrimaryArtists copyWith({
    String? id,
    String? name,
    String? role,
    String? image,
    String? type,
    String? permaUrl,
  }) {
    return PrimaryArtists(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      image: image ?? this.image,
      type: type ?? this.type,
      permaUrl: permaUrl ?? this.permaUrl,
    );
  }

  @override
  String toString() {
    return 'PrimaryArtists(id: $id, name: $name, role: $role, image: $image, type: $type, permaUrl: $permaUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrimaryArtists &&
        other.id == id &&
        other.name == name &&
        other.role == role &&
        other.image == image &&
        other.type == type &&
        other.permaUrl == permaUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        role.hashCode ^
        image.hashCode ^
        type.hashCode ^
        permaUrl.hashCode;
  }
}
