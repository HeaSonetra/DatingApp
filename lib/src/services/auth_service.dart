import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthService {
  static const String _userKey = 'current_user';
  static const String _tokenKey = 'auth_token';

  User? _currentUser;
  String? _token;

  final StreamController<User?> _userController =
      StreamController<User?>.broadcast();

  Stream<User?> get userStream => _userController.stream;
  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null && _token != null;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    final token = prefs.getString(_tokenKey);

    if (userJson != null && token != null) {
      try {
        _currentUser = User.fromJson(
          jsonDecode(userJson) as Map<String, dynamic>,
        );
        _token = token;
        _userController.add(_currentUser);
      } catch (e) {
        // Clear invalid data
        await logout();
      }
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock authentication - in real app, this would be an API call
      if (email.isNotEmpty && password.length >= 6) {
        final user = User(
          id: 'current_user',
          email: email,
          fullName: 'Current User',
          age: 25,
          location: 'Phnom Penh',
          bio: 'Hello! I\'m new to KhmerMatch and excited to meet new people.',
          interests: const ['Travel', 'Food', 'Music'],
          photos: const [
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop&crop=face',
          ],
          isOnline: true,
          lastSeen: DateTime.now(),
        );

        final token = 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}';

        await _saveUserSession(user, token);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(
    String email,
    String password,
    String fullName,
    int age,
    String location,
  ) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock registration - in real app, this would be an API call
      if (email.isNotEmpty && password.length >= 6 && fullName.isNotEmpty) {
        final user = User(
          id: 'current_user',
          email: email,
          fullName: fullName,
          age: age,
          location: location,
          bio: 'Hello! I\'m new to KhmerMatch and excited to meet new people.',
          interests: const ['Travel', 'Food', 'Music'],
          photos: const [
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop&crop=face',
          ],
          isOnline: true,
          lastSeen: DateTime.now(),
        );

        final token = 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}';

        await _saveUserSession(user, token);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_tokenKey);

    _currentUser = null;
    _token = null;
    _userController.add(null);
  }

  Future<void> _saveUserSession(User user, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
    await prefs.setString(_tokenKey, token);

    _currentUser = user;
    _token = token;
    _userController.add(_currentUser);
  }

  void dispose() {
    _userController.close();
  }
}
