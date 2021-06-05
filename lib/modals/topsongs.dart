import 'dart:convert';

import 'package:flutter/foundation.dart';

class TopSongs {
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
  List<TopSong>? list;
  MoreInfo? moreInfo;
  Modules? modules;
  TopSongs({
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
    this.modules,
  });

  TopSongs.fromJson(Map<String?, dynamic> json) {
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
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list!.add(new TopSong.fromJson(v));
      });
    }
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
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    if (this.modules != null) {
      data['modules'] = this.modules!.toJson();
    }
    return data;
  }

  TopSongs copyWith({
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
    List<TopSong>? list,
    MoreInfo? moreInfo,
    Modules? modules,
  }) {
    return TopSongs(
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
      modules: modules ?? this.modules,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TopSongs &&
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
        listEquals(other.list, list) &&
        other.moreInfo == moreInfo &&
        other.modules == modules;
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
        modules.hashCode;
  }
}

class SongList {
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
  SongList({
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
  });

  SongList.fromJson(Map<String?, dynamic> json) {
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
    moreInfo = (json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null)!;
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

  SongList copyWith({
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
  }) {
    return SongList(
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
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SongList &&
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
        other.moreInfo == moreInfo;
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
        moreInfo.hashCode;
  }

  @override
  String toString() {
    return 'SongList(id: $id, title: $title, subtitle: $subtitle, headerDesc: $headerDesc, type: $type, permaUrl: $permaUrl, image: $image, language: $language, year: $year, playCount: $playCount, explicitContent: $explicitContent, listCount: $listCount, listType: $listType, list: $list, moreInfo: $moreInfo)';
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
  String? labelUrl;
  bool? trillerAvailable;
  String? lyricsId;
  String? vcode;
  String? vlink;
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
    this.labelUrl,
    this.trillerAvailable,
    this.lyricsId,
    this.vcode,
    this.vlink,
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
    labelUrl = json['label_url'];
    trillerAvailable = json['triller_available'];
    lyricsId = json['lyrics_id'];
    vcode = json['vcode'];
    vlink = json['vlink'];
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
    data['label_url'] = this.labelUrl;
    data['triller_available'] = this.trillerAvailable;
    data['lyrics_id'] = this.lyricsId;
    data['vcode'] = this.vcode;
    data['vlink'] = this.vlink;
    return data;
  }

  @override
  String toString() {
    return 'MoreInfo(music: $music, albumId: $albumId, album: $album, label: $label, origin: $origin, isDolbyContent: $isDolbyContent, s320kbps: $s320kbps, encryptedMediaUrl: $encryptedMediaUrl, encryptedCacheUrl: $encryptedCacheUrl, albumUrl: $albumUrl, duration: $duration, rights: $rights, cacheState: $cacheState, hasLyrics: $hasLyrics, lyricsSnippet: $lyricsSnippet, starred: $starred, copyrightText: $copyrightText, artistMap: $artistMap, releaseDate: $releaseDate, labelUrl: $labelUrl, trillerAvailable: $trillerAvailable, lyricsId: $lyricsId, vcode: $vcode, vlink: $vlink)';
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
        other.labelUrl == labelUrl &&
        other.trillerAvailable == trillerAvailable &&
        other.lyricsId == lyricsId &&
        other.vcode == vcode &&
        other.vlink == vlink;
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
        labelUrl.hashCode ^
        trillerAvailable.hashCode ^
        lyricsId.hashCode ^
        vcode.hashCode ^
        vlink.hashCode;
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
    String? labelUrl,
    bool? trillerAvailable,
    String? lyricsId,
    String? vcode,
    String? vlink,
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
      labelUrl: labelUrl ?? this.labelUrl,
      trillerAvailable: trillerAvailable ?? this.trillerAvailable,
      lyricsId: lyricsId ?? this.lyricsId,
      vcode: vcode ?? this.vcode,
      vlink: vlink ?? this.vlink,
    );
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

class MoreInfo2 {
  String? uid;
  bool? isDolbyContent;
  List<dynamic>? subtype;
  String? lastUpdated;
  String? username;
  String? firstname;
  String? lastname;
  String? isFollowed;
  bool? isFY;
  String? followerCount;
  String? fanCount;
  String? playlistType;
  String? share;
  String? h2;
  dynamic subheading;
  String? videoCount;
  MoreInfo2({
    this.uid,
    this.isDolbyContent,
    this.subtype,
    this.lastUpdated,
    this.username,
    this.firstname,
    this.lastname,
    this.isFollowed,
    this.isFY,
    this.followerCount,
    this.fanCount,
    this.playlistType,
    this.share,
    this.h2,
    this.subheading,
    this.videoCount,
  });

  MoreInfo2.fromJson(Map<String?, dynamic> json) {
    uid = json['uid'];
    isDolbyContent = json['is_dolby_content'];
    if (json['subtype'] != null) {
      subtype = [];
      json['subtype'].forEach((v) {
        subtype!.add(v);
      });
    }
    lastUpdated = json['last_updated'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    isFollowed = json['is_followed'];
    isFY = json['isFY'];
    followerCount = json['follower_count'];
    fanCount = json['fan_count'];
    playlistType = json['playlist_type'];
    share = json['share'];
    h2 = json['H2'];
    subheading = json['subheading'];
    videoCount = json['video_count'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['uid'] = this.uid;
    data['is_dolby_content'] = this.isDolbyContent;
    if (this.subtype != null) {
      data['subtype'] = this.subtype!.map((v) => v.toJson()).toList();
    }
    data['last_updated'] = this.lastUpdated;
    data['username'] = this.username;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['is_followed'] = this.isFollowed;
    data['isFY'] = this.isFY;
    data['follower_count'] = this.followerCount;
    data['fan_count'] = this.fanCount;
    data['playlist_type'] = this.playlistType;
    data['share'] = this.share;
    data['H2'] = this.h2;
    data['subheading'] = this.subheading;
    data['video_count'] = this.videoCount;
    return data;
  }

  MoreInfo2 copyWith({
    String? uid,
    bool? isDolbyContent,
    List<dynamic>? subtype,
    String? lastUpdated,
    String? username,
    String? firstname,
    String? lastname,
    String? isFollowed,
    bool? isFY,
    String? followerCount,
    String? fanCount,
    String? playlistType,
    String? share,
    String? h2,
    dynamic subheading,
    String? videoCount,
  }) {
    return MoreInfo2(
      uid: uid ?? this.uid,
      isDolbyContent: isDolbyContent ?? this.isDolbyContent,
      subtype: subtype ?? this.subtype,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      username: username ?? this.username,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      isFollowed: isFollowed ?? this.isFollowed,
      isFY: isFY ?? this.isFY,
      followerCount: followerCount ?? this.followerCount,
      fanCount: fanCount ?? this.fanCount,
      playlistType: playlistType ?? this.playlistType,
      share: share ?? this.share,
      h2: h2 ?? this.h2,
      subheading: subheading ?? this.subheading,
      videoCount: videoCount ?? this.videoCount,
    );
  }

  @override
  String toString() {
    return 'MoreInfo2(uid: $uid, isDolbyContent: $isDolbyContent, subtype: $subtype, lastUpdated: $lastUpdated, username: $username, firstname: $firstname, lastname: $lastname, isFollowed: $isFollowed, isFY: $isFY, followerCount: $followerCount, fanCount: $fanCount, playlistType: $playlistType, share: $share, h2: $h2, subheading: $subheading, videoCount: $videoCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoreInfo2 &&
        other.uid == uid &&
        other.isDolbyContent == isDolbyContent &&
        listEquals(other.subtype, subtype) &&
        other.lastUpdated == lastUpdated &&
        other.username == username &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.isFollowed == isFollowed &&
        other.isFY == isFY &&
        other.followerCount == followerCount &&
        other.fanCount == fanCount &&
        other.playlistType == playlistType &&
        other.share == share &&
        other.h2 == h2 &&
        other.subheading == subheading &&
        other.videoCount == videoCount;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        isDolbyContent.hashCode ^
        subtype.hashCode ^
        lastUpdated.hashCode ^
        username.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        isFollowed.hashCode ^
        isFY.hashCode ^
        followerCount.hashCode ^
        fanCount.hashCode ^
        playlistType.hashCode ^
        share.hashCode ^
        h2.hashCode ^
        subheading.hashCode ^
        videoCount.hashCode;
  }
}

class Modules {
  List<Modulelist>? list;
  Modules({
    this.list,
  });

  Modules.fromJson(Map<String?, dynamic> json) {
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list!.add(
            new Modulelist.fromJson(Map<String, dynamic>.from(jsonDecode(v))));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Modules copyWith({
    List<Modulelist>? list,
  }) {
    return Modules(
      list: list ?? this.list,
    );
  }

  @override
  String toString() => 'Modules(list: $list)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Modules && listEquals(other.list, list);
  }

  @override
  int get hashCode => list.hashCode;
}

class Modulelist {
  String? source;
  int? position;
  String? scrollType;
  String? title;
  String? subtitle;
  String? highlight;
  bool? simpleHeader;
  bool? noHeader;
  List<String>? viewMore;
  Modulelist({
    this.source,
    this.position,
    this.scrollType,
    this.title,
    this.subtitle,
    this.highlight,
    this.simpleHeader,
    this.noHeader,
    this.viewMore,
  });

  Modulelist.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    position = json['position'];
    scrollType = json['scroll_type'];
    title = json['title'];
    subtitle = json['subtitle'];
    highlight = json['highlight'];
    simpleHeader = json['simpleHeader'];
    noHeader = json['noHeader'];
    viewMore = json['view_more'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['position'] = this.position;
    data['scroll_type'] = this.scrollType;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['highlight'] = this.highlight;
    data['simpleHeader'] = this.simpleHeader;
    data['noHeader'] = this.noHeader;
    data['view_more'] = this.viewMore;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Modulelist &&
        other.source == source &&
        other.position == position &&
        other.scrollType == scrollType &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.highlight == highlight &&
        other.simpleHeader == simpleHeader &&
        other.noHeader == noHeader &&
        listEquals(other.viewMore, viewMore);
  }

  @override
  int get hashCode {
    return source.hashCode ^
        position.hashCode ^
        scrollType.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        highlight.hashCode ^
        simpleHeader.hashCode ^
        noHeader.hashCode ^
        viewMore.hashCode;
  }

  Modulelist copyWith({
    String? source,
    int? position,
    String? scrollType,
    String? title,
    String? subtitle,
    String? highlight,
    bool? simpleHeader,
    bool? noHeader,
    List<String>? viewMore,
  }) {
    return Modulelist(
      source: source ?? this.source,
      position: position ?? this.position,
      scrollType: scrollType ?? this.scrollType,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      highlight: highlight ?? this.highlight,
      simpleHeader: simpleHeader ?? this.simpleHeader,
      noHeader: noHeader ?? this.noHeader,
      viewMore: viewMore ?? this.viewMore,
    );
  }

  @override
  String toString() {
    return 'Modulelist(source: $source, position: $position, scrollType: $scrollType, title: $title, subtitle: $subtitle, highlight: $highlight, simpleHeader: $simpleHeader, noHeader: $noHeader, viewMore: $viewMore)';
  }
}

class TopSong {
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
  TopSong({
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
  });

  TopSong.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

  TopSong copyWith({
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
  }) {
    return TopSong(
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
    );
  }

  @override
  String toString() {
    return 'TopSong(id: $id, title: $title, subtitle: $subtitle, headerDesc: $headerDesc, type: $type, permaUrl: $permaUrl, image: $image, language: $language, year: $year, playCount: $playCount, explicitContent: $explicitContent, listCount: $listCount, listType: $listType, list: $list, moreInfo: $moreInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TopSong &&
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
        other.moreInfo == moreInfo;
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
        moreInfo.hashCode;
  }
}
