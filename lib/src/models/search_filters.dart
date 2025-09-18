import 'package:json_annotation/json_annotation.dart';

part 'search_filters.g.dart';

@JsonSerializable()
class SearchFilters {
  const SearchFilters({
    this.minAge = 18,
    this.maxAge = 60,
    this.maxDistance = 50.0,
    this.interests = const <String>[],
    this.onlineOnly = false,
  });

  factory SearchFilters.fromJson(Map<String, dynamic> json) =>
      _$SearchFiltersFromJson(json);

  final int minAge;
  final int maxAge;
  final double maxDistance;
  final List<String> interests;
  final bool onlineOnly;

  Map<String, dynamic> toJson() => _$SearchFiltersToJson(this);

  SearchFilters copyWith({
    int? minAge,
    int? maxAge,
    double? maxDistance,
    List<String>? interests,
    bool? onlineOnly,
  }) {
    return SearchFilters(
      minAge: minAge ?? this.minAge,
      maxAge: maxAge ?? this.maxAge,
      maxDistance: maxDistance ?? this.maxDistance,
      interests: interests ?? this.interests,
      onlineOnly: onlineOnly ?? this.onlineOnly,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchFilters &&
        other.minAge == minAge &&
        other.maxAge == maxAge &&
        other.maxDistance == maxDistance &&
        other.interests.toString() == interests.toString() &&
        other.onlineOnly == onlineOnly;
  }

  @override
  int get hashCode {
    return Object.hash(minAge, maxAge, maxDistance, interests, onlineOnly);
  }

  @override
  String toString() {
    return 'SearchFilters(minAge: $minAge, maxAge: $maxAge, maxDistance: $maxDistance, interests: $interests, onlineOnly: $onlineOnly)';
  }
}
