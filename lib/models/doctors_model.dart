// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:final_project/models/doctors_review_model.dart';

class DoctorsModel {
    int id;
    String name;
    String specialization;
    String image;
    String location;
    int patientsCount;
    int experienceRate;
    int rating;
    String about;
    String workingtime;
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

  Map<String, dynamic> toMap() {
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

  factory DoctorsModel.fromMap(Map<String, dynamic> map) {
    return DoctorsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      specialization: map['specialization'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      patientsCount: map['patientsCount'] as int,
      experienceRate: map['experienceRate'] as int,
      rating: map['rating'] as int,
      about: map['about'] as String,
      workingtime: map['workingtime'] as String,
      reviews: List<DoctorsReviewModel>.from((map['reviews'] as List<int>).map<DoctorsReviewModel>((x) => DoctorsReviewModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorsModel.fromJson(String source) => DoctorsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoctorsModel(id: $id, name: $name, specialization: $specialization, image: $image, location: $location, patientsCount: $patientsCount, experienceRate: $experienceRate, rating: $rating, about: $about, workingtime: $workingtime, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant DoctorsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
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
