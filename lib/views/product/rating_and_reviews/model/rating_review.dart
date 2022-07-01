import 'dart:convert';

import 'package:flutter/foundation.dart';

class RatingReview {
  final String name;
  final List<String> images;
  final String urlAvatar;
  final int rating;
  final DateTime dateTime;
  final String content;
  const RatingReview({
    required this.name,
    required this.images,
    required this.urlAvatar,
    required this.rating,
    required this.dateTime,
    required this.content,
  });

  RatingReview copyWith({
    String? name,
    List<String>? images,
    String? urlAvatar,
    int? rating,
    DateTime? dateTime,
    String? content,
  }) {
    return RatingReview(
      name: name ?? this.name,
      images: images ?? this.images,
      urlAvatar: urlAvatar ?? this.urlAvatar,
      rating: rating ?? this.rating,
      dateTime: dateTime ?? this.dateTime,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'images': images,
      'urlAvatar': urlAvatar,
      'rating': rating,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'content': content,
    };
  }

  factory RatingReview.fromMap(Map<String, dynamic> map) {
    return RatingReview(
      name: map['name'] ?? '',
      images: List<String>.from(map['images']),
      urlAvatar: map['urlAvatar'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingReview.fromJson(String source) =>
      RatingReview.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RatingReview(name: $name, images: $images, urlAvatar: $urlAvatar, rating: $rating, dateTime: $dateTime, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RatingReview &&
        other.name == name &&
        listEquals(other.images, images) &&
        other.urlAvatar == urlAvatar &&
        other.rating == rating &&
        other.dateTime == dateTime &&
        other.content == content;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        images.hashCode ^
        urlAvatar.hashCode ^
        rating.hashCode ^
        dateTime.hashCode ^
        content.hashCode;
  }
}
