import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/search_filters.dart';
import '../models/user.dart';
import '../services/profile_service.dart';

part 'profile_provider.g.dart';

// Profile service provider
@riverpod
ProfileService profileService(ProfileServiceRef ref) {
  return ProfileService();
}

// Search filters provider
@riverpod
class SearchFiltersNotifier extends _$SearchFiltersNotifier {
  @override
  SearchFilters build() {
    return const SearchFilters();
  }

  void updateFilters(SearchFilters filters) {
    state = filters;
  }

  void resetFilters() {
    state = const SearchFilters();
  }

  void updateAgeRange(int minAge, int maxAge) {
    state = state.copyWith(minAge: minAge, maxAge: maxAge);
  }

  void updateMaxDistance(double distance) {
    state = state.copyWith(maxDistance: distance);
  }

  void updateOnlineOnly(bool onlineOnly) {
    state = state.copyWith(onlineOnly: onlineOnly);
  }

  void updateInterests(List<String> interests) {
    state = state.copyWith(interests: interests);
  }
}

// Profiles provider with filters
@riverpod
Future<List<User>> profiles(ProfilesRef ref) async {
  final profileService = ref.watch(profileServiceProvider);
  final filters = ref.watch(searchFiltersNotifierProvider);

  return profileService.getProfiles(filters: filters);
}

// Search query provider
@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void updateQuery(String query) {
    state = query;
  }

  void clearQuery() {
    state = '';
  }
}

// Search results provider
@riverpod
Future<List<User>> searchResults(SearchResultsRef ref) async {
  final profileService = ref.watch(profileServiceProvider);
  final query = ref.watch(searchQueryProvider);
  final filters = ref.watch(searchFiltersNotifierProvider);

  if (query.isEmpty) {
    return profileService.getProfiles(filters: filters);
  }

  return profileService.searchProfiles(query, filters: filters);
}

// Single profile provider
@riverpod
Future<User?> profile(ProfileRef ref, String profileId) async {
  final profileService = ref.watch(profileServiceProvider);
  return profileService.getProfileById(profileId);
}

// Liked profiles provider (for tracking likes)
@riverpod
class LikedProfiles extends _$LikedProfiles {
  @override
  Set<String> build() {
    return <String>{};
  }

  Future<bool> likeProfile(String profileId) async {
    final profileService = ref.read(profileServiceProvider);
    final success = await profileService.likeProfile(profileId);

    if (success) {
      state = {...state, profileId};
    }

    return success;
  }

  bool isLiked(String profileId) {
    return state.contains(profileId);
  }

  void removeLike(String profileId) {
    state = state.where((id) => id != profileId).toSet();
  }
}

// Loading states
@riverpod
class ProfilesLoading extends _$ProfilesLoading {
  @override
  bool build() => false;

  void setLoading(bool loading) {
    state = loading;
  }
}

@riverpod
class SearchLoading extends _$SearchLoading {
  @override
  bool build() => false;

  void setLoading(bool loading) {
    state = loading;
  }
}
