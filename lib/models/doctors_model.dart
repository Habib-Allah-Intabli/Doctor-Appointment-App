// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:final_project/models/doctors_review_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'doctors_model.g.dart';
@HiveType(typeId: 0)
class DoctorsModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String specialization;

  @HiveField(3)
  String image;

  @HiveField(4)
  String location;

  @HiveField(5)
  int patientsCount;

  @HiveField(6)
  int experienceRate;

  @HiveField(7)
  int rating;

  @HiveField(8)
  String about;

  @HiveField(9)
  String workingtime;

  @HiveField(10)
  List<DoctorsReviewModel> reviews;

  DoctorsModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.image,
    required this.location,
    required this.patientsCount,
    required this.experienceRate,
    required this.rating,
    required this.about,
    required this.workingtime,
    required this.reviews,
  });

  DoctorsModel copyWith({
    int? id,
    String? name,
    String? specialization,
    String? image,
    String? location,
    int? patientsCount,
    int? experienceRate,
    int? rating,
    String? about,
    String? workingtime,
    List<DoctorsReviewModel>? reviews,
  }) {
    return DoctorsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      specialization: specialization ?? this.specialization,
      image: image ?? this.image,
      location: location ?? this.location,
      patientsCount: patientsCount ?? this.patientsCount,
      experienceRate: experienceRate ?? this.experienceRate,
      rating: rating ?? this.rating,
      about: about ?? this.about,
      workingtime: workingtime ?? this.workingtime,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'specialization': specialization,
      'image': image,
      'location': location,
      'patientsCount': patientsCount,
      'experienceRate': experienceRate,
      'rating': rating,
      'about': about,
      'workingtime': workingtime,
      'reviews': reviews.map((x) => x.toMap()).toList(),
    };
  }

  factory DoctorsModel.fromMap(Map<dynamic, dynamic> map) {
    return DoctorsModel(
      id: map['id'] ?? 0, // ← أضف ?? لكل int
      name: map['name'] ?? '',
      specialization: map['specialization'] ?? '',
      image: map['image'] ?? '',
      location: map['location'] ?? '',
      patientsCount: map['patients_count'] ?? 0, // ← هاد ممكن يكون null
      experienceRate: map['experience_rate'] ?? 0, // ← هاد كمان
      rating: map['rating'] ?? 0, // ← وهاد
      about: map['about'] ?? '',
      workingtime: map['working_time'] ?? '',
      reviews: map['reviews'] != null
          ? List.from(map['reviews'])
                .map(
                  (r) =>
                      DoctorsReviewModel.fromMap(Map<String, dynamic>.from(r)),
                )
                .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorsModel.fromJson(String source) =>
      DoctorsModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() {
    return 'DoctorsModel(id: $id, name: $name, specialization: $specialization, image: $image, location: $location, patientsCount: $patientsCount, experienceRate: $experienceRate, rating: $rating, about: $about, workingtime: $workingtime, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant DoctorsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.specialization == specialization &&
        other.image == image &&
        other.location == location &&
        other.patientsCount == patientsCount &&
        other.experienceRate == experienceRate &&
        other.rating == rating &&
        other.about == about &&
        other.workingtime == workingtime &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        specialization.hashCode ^
        image.hashCode ^
        location.hashCode ^
        patientsCount.hashCode ^
        experienceRate.hashCode ^
        rating.hashCode ^
        about.hashCode ^
        workingtime.hashCode ^
        reviews.hashCode;
  }
}
