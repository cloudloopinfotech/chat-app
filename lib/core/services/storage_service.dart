import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

/// Service for managing local storage using GetStorage
class StorageService extends GetxService {
  final GetStorage _box = GetStorage();

  // Storage Keys
  static const String _keyAuthToken = 'auth_token';
  static const String _keyUserId = 'user_id';
  static const String _keyHasSeenOnboarding = 'has_seen_onboarding';
  static const String _keyThemeMode = 'theme_mode';
  static const String _keyUser = 'user';

  // Auth Token
  String? get authToken => _box.read(_keyAuthToken);
  Future<void> saveAuthToken(String token) => _box.write(_keyAuthToken, token);
  Future<void> removeAuthToken() => _box.remove(_keyAuthToken);
  bool get isLoggedIn => authToken != null;

  // User ID
  String? get userId => _box.read(_keyUserId);
  Future<void> saveUserId(String id) => _box.write(_keyUserId, id);
  Future<void> removeUserId() => _box.remove(_keyUserId);

  // Onboarding
  bool get hasSeenOnboarding => _box.read(_keyHasSeenOnboarding) ?? false;
  Future<void> setHasSeenOnboarding(bool value) =>
      _box.write(_keyHasSeenOnboarding, value);

  // Theme Mode
  ThemeMode getThemeMode() {
    final value = _box.read(_keyThemeMode);
    if (value == null) return ThemeMode.system;
    return ThemeMode.values.firstWhere(
      (mode) => mode.toString() == value,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) =>
      _box.write(_keyThemeMode, mode.toString());

  // User Data
  Map<String, dynamic>? get userData => _box.read(_keyUser);
  Future<void> saveUserData(Map<String, dynamic> data) =>
      _box.write(_keyUser, data);
  Future<void> removeUserData() => _box.remove(_keyUser);

  // Clear all data (logout)
  Future<void> clearAll() async {
    await _box.erase();
  }
}
