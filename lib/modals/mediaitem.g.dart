// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediaitem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustMediaItemAdapter extends TypeAdapter<CustMediaItem> {
  @override
  final int typeId = 0;

  @override
  CustMediaItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustMediaItem(
      id: fields[0] as String,
      album: fields[1] as String,
      title: fields[2] as String,
      artist: fields[3] as String?,
      genre: fields[4] as String?,
      duration: fields[5] as Duration?,
      artUri: fields[6] as Uri?,
      playable: fields[7] as bool?,
      displayTitle: fields[8] as String?,
      displaySubtitle: fields[9] as String?,
      displayDescription: fields[10] as String?,
      extras: (fields[11] as Map?)?.cast<String, dynamic>(),
      progress: fields[13] as int?,
      status: fields[14] as int?,
      taskId: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustMediaItem obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.album)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.artist)
      ..writeByte(4)
      ..write(obj.genre)
      ..writeByte(5)
      ..write(obj.duration)
      ..writeByte(6)
      ..write(obj.artUri)
      ..writeByte(7)
      ..write(obj.playable)
      ..writeByte(8)
      ..write(obj.displayTitle)
      ..writeByte(9)
      ..write(obj.displaySubtitle)
      ..writeByte(10)
      ..write(obj.displayDescription)
      ..writeByte(11)
      ..write(obj.extras)
      ..writeByte(12)
      ..write(obj.taskId)
      ..writeByte(13)
      ..write(obj.progress)
      ..writeByte(14)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustMediaItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
