// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFilters _$SearchFiltersFromJson(Map<String, dynamic> json) =>
    SearchFilters(
      minAge: (json['minAge'] as num?)?.toInt() ?? 18,
      maxAge: (json['maxAge'] as num?)?.toInt() ?? 60,
      maxDistance: (json['maxDistance'] as num?)?.toDouble() ?? 50.0,
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      onlineOnly: json['onlineOnly'] as bool? ?? false,
    );

Map<String, dynamic> _$SearchFiltersToJson(SearchFilters instance) =>
    <String, dynamic>{
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'maxDistance': instance.maxDistance,
      'interests': instance.interests,
      'onlineOnly': instance.onlineOnly,
    };
