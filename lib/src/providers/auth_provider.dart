import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';
import '../services/auth_service.dart';

part 'auth_provider.g.dart';

// Auth service provider
@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService();
}

// Current user provider
@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    final authService = ref.watch(authServiceProvider);

    // Initialize auth service when provider is first accessed
    authService.initialize();

    // Listen to auth state changes
    ref.listen(authStateProvider, (previous, next) {
      next.whenData((user) {
        state = user;
      });
    });

    return authService.currentUser;
  }

  Future<bool> login(String email, String password) async {
    final authService = ref.read(authServiceProvider);
    final success = await authService.login(email, password);

    if (success) {
      state = authService.currentUser;
    }

    return success;
  }

  Future<bool> register(
    String email,
    String password,
    String fullName,
    int age,
    String location,
  ) async {
    final authService = ref.read(authServiceProvider);
    final success = await authService.register(
      email,
      password,
      fullName,
      age,
      location,
    );

    if (success) {
      state = authService.currentUser;
    }

    return success;
  }

  Future<void> logout() async {
    final authService = ref.read(authServiceProvider);
    await authService.logout();
    state = null;
  }
}

// Auth state stream provider
@riverpod
Stream<User?> authState(AuthStateRef ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.userStream;
}

// Authentication status provider
@riverpod
bool isAuthenticated(IsAuthenticatedRef ref) {
  final user = ref.watch(currentUserProvider);
  return user != null;
}

// Loading state provider for auth operations
@riverpod
class AuthLoading extends _$AuthLoading {
  @override
  bool build() => false;

  void setLoading(bool loading) {
    state = loading;
  }
}

// Auth error provider
@riverpod
class AuthError extends _$AuthError {
  @override
  String? build() => null;

  void setError(String? error) {
    state = error;
  }

  void clearError() {
    state = null;
  }
}
