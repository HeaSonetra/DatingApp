import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String email;
  final int age;
  final String location;
  final String bio;
  final List<String> photos;
  final List<String> interests;
  final bool isOnline;
  final double? distance;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.location,
    this.bio = '',
    this.photos = const [],
    this.interests = const [],
    this.isOnline = false,
    this.distance,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? name,
    String? email,
    int? age,
    String? location,
    String? bio,
    List<String>? photos,
    List<String>? interests,
    bool? isOnline,
    double? distance,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      location: location ?? this.location,
      bio: bio ?? this.bio,
      photos: photos ?? this.photos,
      interests: interests ?? this.interests,
      isOnline: isOnline ?? this.isOnline,
      distance: distance ?? this.distance,
    );
  }
}
