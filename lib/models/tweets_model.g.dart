// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweets_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TweetsModelAdapter extends TypeAdapter<TweetsModel> {
  @override
  final int typeId = 0;

  @override
  TweetsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TweetsModel(
      name: fields[0] as String,
      text: fields[1] as String,
      smiles: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TweetsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.smiles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TweetsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
