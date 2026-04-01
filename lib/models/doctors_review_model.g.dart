// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_review_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorsReviewModelAdapter extends TypeAdapter<DoctorsReviewModel> {
  @override
  final int typeId = 1;

  @override
  DoctorsReviewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorsReviewModel(
      id: fields[0] as int,
      username: fields[1] as String,
      rating: fields[2] as int,
      reviewBody: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DoctorsReviewModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.reviewBody);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorsReviewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
