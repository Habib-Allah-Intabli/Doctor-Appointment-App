// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:final_project/models/doctors_model.dart';

class CartDoctorModel {
  final DoctorsModel doctor;
  CartDoctorModel({required this.doctor});

  CartDoctorModel copyWith({DoctorsModel? doctor}) {
    return CartDoctorModel(doctor: doctor ?? this.doctor);
  }

  Map<dynamic, dynamic> toMap() {
    return <String, dynamic>{'doctor': doctor.toMap()};
  }

  factory CartDoctorModel.fromMap(Map<dynamic, dynamic> map) {
    return CartDoctorModel(
      doctor: DoctorsModel.fromMap(map['doctor'] as Map<dynamic, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartDoctorModel.fromJson(String source) =>
      CartDoctorModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'CartDoctorModel(doctor: $doctor)';

  @override
  bool operator ==(covariant CartDoctorModel other) {
    if (identical(this, other)) return true;

    return other.doctor == doctor;
  }

  @override
  int get hashCode => doctor.hashCode;
}
