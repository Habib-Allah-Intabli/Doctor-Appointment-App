// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DoctorsReviewModel {
  int id;
    String username;
    int rating;
    String reviewBody;
  DoctorsReviewModel({
    required this.id,
    required this.username,
    required this.rating,
    required this.reviewBody,
  });

  DoctorsReviewModel copyWith({
    int? id,
    String? username,
    int? rating,
    String? reviewBody,
  }) {
    return DoctorsReviewModel(
      id: id ?? this.id,
      username: username ?? this.username,
      rating: rating ?? this.rating,
      reviewBody: reviewBody ?? this.reviewBody,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'rating': rating,
      'reviewBody': reviewBody,
    };
  }

  factory DoctorsReviewModel.fromMap(Map<String, dynamic> map) {
    return DoctorsReviewModel(
      id: map['id'] as int,
      username: map['username'] as String,
      rating: map['rating'] as int,
      reviewBody: map['reviewBody'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorsReviewModel.fromJson(String source) => DoctorsReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoctorsReviewModel(id: $id, username: $username, rating: $rating, reviewBody: $reviewBody)';
  }

  @override
  bool operator ==(covariant DoctorsReviewModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.username == username &&
      other.rating == rating &&
      other.reviewBody == reviewBody;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      rating.hashCode ^
      reviewBody.hashCode;
  }
}
