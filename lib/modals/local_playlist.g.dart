// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_playlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalPlaylistAdapter extends TypeAdapter<LocalPlaylist> {
  @override
  final int typeId = 0;

  @override
  LocalPlaylist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalPlaylist(
      title: fields[0] as String,
      imageUrl: fields[1] as String?,
      isLocal: fields[2] as bool,
      songList: (fields[3] as List).cast<CustSongItem>(),
      key: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalPlaylist obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.isLocal)
      ..writeByte(3)
      ..write(obj.songList)
      ..writeByte(4)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalPlaylistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustSongItemAdapter extends TypeAdapter<CustSongItem> {
  @override
  final int typeId = 1;

  @override
  CustSongItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustSongItem(
      title: fields[0] as String,
      subtitle: fields[1] as String,
      imageUrl: fields[2] as String,
      isDownloaded: fields[4] as bool,
      songPath: fields[5] as String?,
      artPath: fields[6] as String?,
      songUrl: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustSongItem obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.songUrl)
      ..writeByte(4)
      ..write(obj.isDownloaded)
      ..writeByte(5)
      ..write(obj.songPath)
      ..writeByte(6)
      ..write(obj.artPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustSongItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
