import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

import '../models/search_filters.dart';
import '../models/user.dart';

class ProfileService {
  List<User>? _cachedProfiles;

  Future<List<User>> getProfiles({SearchFilters? filters}) async {
    // Load profiles from mock data if not cached
    _cachedProfiles ??= await _loadMockProfiles();

    List<User> profiles = List.from(_cachedProfiles!);

    // Apply filters if provided
    if (filters != null) {
      profiles = _applyFilters(profiles, filters);
    }

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    return profiles;
  }

  Future<User?> getProfileById(String id) async {
    _cachedProfiles ??= await _loadMockProfiles();

    try {
      return _cachedProfiles!.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<User>> searchProfiles(
    String query, {
    SearchFilters? filters,
  }) async {
    _cachedProfiles ??= await _loadMockProfiles();

    List<User> profiles = _cachedProfiles!.where((user) {
      final searchQuery = query.toLowerCase();
      return user.fullName.toLowerCase().contains(searchQuery) ||
          user.location.toLowerCase().contains(searchQuery) ||
          user.bio.toLowerCase().contains(searchQuery) ||
          user.interests.any(
            (interest) => interest.toLowerCase().contains(searchQuery),
          );
    }).toList();

    // Apply additional filters if provided
    if (filters != null) {
      profiles = _applyFilters(profiles, filters);
    }

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    return profiles;
  }

  Future<bool> likeProfile(String profileId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 200));

    // In a real app, this would send a like to the server
    // and potentially create a match if both users liked each other
    return true;
  }

  Future<List<User>> _loadMockProfiles() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/mock/profiles.json',
      );
      final List<dynamic> data = jsonDecode(response) as List<dynamic>;

      return data
          .map((json) => User.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Return empty list if mock data fails to load
      return <User>[];
    }
  }

  List<User> _applyFilters(List<User> profiles, SearchFilters filters) {
    return profiles.where((user) {
      // Age filter
      if (user.age < filters.minAge || user.age > filters.maxAge) {
        return false;
      }

      // Distance filter
      if (user.distance != null && user.distance! > filters.maxDistance) {
        return false;
      }

      // Online only filter
      if (filters.onlineOnly && !user.isOnline) {
        return false;
      }

      // Interests filter
      if (filters.interests.isNotEmpty) {
        final hasMatchingInterest = filters.interests.any(
          (filterInterest) => user.interests.any(
            (userInterest) => userInterest.toLowerCase().contains(
              filterInterest.toLowerCase(),
            ),
          ),
        );
        if (!hasMatchingInterest) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  // Simulate random distance calculation for profiles
  void _addRandomDistances(List<User> profiles) {
    final random = Random();
    for (int i = 0; i < profiles.length; i++) {
      if (profiles[i].distance == null) {
        profiles[i] = profiles[i].copyWith(
          distance: random.nextDouble() * 50, // Random distance up to 50km
        );
      }
    }
  }
}
