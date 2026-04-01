// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorsModelAdapter extends TypeAdapter<DoctorsModel> {
  @override
  final int typeId = 0;

  @override
  DoctorsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorsModel(
      id: fields[0] as int,
      name: fields[1] as String,
      specialization: fields[2] as String,
      image: fields[3] as String,
      location: fields[4] as String,
      patientsCount: fields[5] as int,
      experienceRate: fields[6] as int,
      rating: fields[7] as int,
      about: fields[8] as String,
      workingtime: fields[9] as String,
      reviews: (fields[10] as List).cast<DoctorsReviewModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, DoctorsModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.specialization)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.patientsCount)
      ..writeByte(6)
      ..write(obj.experienceRate)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.about)
      ..writeByte(9)
      ..write(obj.workingtime)
      ..writeByte(10)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
