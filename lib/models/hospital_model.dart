// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HospitalModel {
  int id;
  String name;
  String image;
  String location;
  int rating;
  int reviews_count;
  String distance;
  HospitalModel({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.rating,
    required this.reviews_count,
    required this.distance,
  });

  HospitalModel copyWith({
    int? id,
    String? name,
    String? image,
    String? location,
    int? rating,
    int? reviews_count,
    String? distance,
  }) {
    return HospitalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      location: location ?? this.location,
      rating: rating ?? this.rating,
      reviews_count: reviews_count ?? this.reviews_count,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'location': location,
      'rating': rating,
      'reviews_count': reviews_count,
      'distance': distance,
    };
  }

  factory HospitalModel.fromMap(Map<String, dynamic> map) {
    return HospitalModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      rating: map['rating'] as int,
      reviews_count: map['reviews_count'] as int,
      distance: map['distance'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HospitalModel.fromJson(String source) =>
      HospitalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HospitalModel(id: $id, name: $name, image: $image, location: $location, rating: $rating, reviews_count: $reviews_count, distance: $distance)';
  }

  @override
  bool operator ==(covariant HospitalModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.location == location &&
        other.rating == rating &&
        other.reviews_count == reviews_count &&
        other.distance == distance;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        location.hashCode ^
        rating.hashCode ^
        reviews_count.hashCode ^
        distance.hashCode;
  }
}
