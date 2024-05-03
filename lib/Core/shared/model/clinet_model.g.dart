// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClinetModelAdapter extends TypeAdapter<ClinetModel> {
  @override
  final int typeId = 0;

  @override
  ClinetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClinetModel(
      id: fields[0] as String,
      name: fields[1] as String,
      number: fields[2] as String,
      address: fields[3] as String,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ClinetModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClinetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
