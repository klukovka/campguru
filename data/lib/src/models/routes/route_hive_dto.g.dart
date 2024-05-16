// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_hive_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RouteHiveDtoAdapter extends TypeAdapter<RouteHiveDto> {
  @override
  final int typeId = 1;

  @override
  RouteHiveDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RouteHiveDto(
      id: fields[0] as int,
      isFavorite: fields[1] as bool,
      name: fields[2] as String,
      mark: fields[3] as double,
      mapUrl: fields[4] as String,
      distance: fields[5] as double,
      duration: fields[6] as double,
      reviewsAmount: fields[7] as int,
      locationsAmount: fields[8] as int?,
      description: fields[9] as String?,
      labels: (fields[10] as List?)?.cast<String>(),
      locations: (fields[11] as List?)?.cast<LatLngDto>(),
      polyline: (fields[12] as List?)?.cast<LatLngDto>(),
      isMine: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RouteHiveDto obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isFavorite)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.mark)
      ..writeByte(4)
      ..write(obj.mapUrl)
      ..writeByte(5)
      ..write(obj.distance)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.reviewsAmount)
      ..writeByte(8)
      ..write(obj.locationsAmount)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.labels)
      ..writeByte(11)
      ..write(obj.locations)
      ..writeByte(12)
      ..write(obj.polyline)
      ..writeByte(13)
      ..write(obj.isMine);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteHiveDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
