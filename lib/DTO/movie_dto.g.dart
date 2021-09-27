// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDTOAdapter extends TypeAdapter<MovieDTO> {
  @override
  final int typeId = 1;

  @override
  MovieDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDTO(
      title: fields[0] as String?,
      author: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
