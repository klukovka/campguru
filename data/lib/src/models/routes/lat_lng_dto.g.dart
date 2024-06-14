// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lat_lng_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatLngDtoAdapter extends TypeAdapter<LatLngDto> {
  @override
  final int typeId = 0;

  @override
  LatLngDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LatLngDto(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LatLngDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLngDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLngDto _$LatLngDtoFromJson(Map<String, dynamic> json) => LatLngDto(
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['long'] as num).toDouble(),
    );
