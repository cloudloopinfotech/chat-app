import 'package:get/get.dart';
import '../models/user_model.dart';
import '../providers/mock_data_provider.dart';
import '../../core/services/storage_service.dart';

/// Repository for authentication operations
class AuthRepository {
  StorageService get _storageService => Get.find<StorageService>();

  /// Login with email and password
  /// Returns user model on success, null on failure
  Future<UserModel?> login(String email, String password) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation
    final users = MockDataProvider.getMockUsers();
    final user = users.firstWhereOrNull((u) => u.email == email);

    if (user != null && password.length >= 6) {
      // Save auth token and user data
      await _storageService.saveAuthToken('mock_token_${user.id}');
      await _storageService.saveUserId(user.id);
      await _storageService.saveUserData(user.toJson());
      return user;
    }

    return null;
  }

  /// Sign up with user details
  /// Returns user model on success, null on failure
  Future<UserModel?> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation - check if username/email already exists
    final users = MockDataProvider.getMockUsers();
    final existingUser = users.firstWhereOrNull(
      (u) => u.email == email || u.username == username,
    );

    if (existingUser != null) {
      return null; // User already exists
    }

    // Create new user
    final newUser = UserModel(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      username: username,
      email: email,
      name: username, // Will be updated in profile setup
      status: 'Available',
      isOnline: true,
      createdAt: DateTime.now(),
    );

    return newUser;
  }

  /// Verify OTP code
  /// Returns true if valid, false otherwise
  Future<bool> verifyOTP(String code) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation - accept any 6-digit code
    return code.length == 6;
  }

  /// Complete profile setup
  Future<UserModel?> setupProfile({
    required String userId,
    required String name,
    String? avatar,
    String? bio,
    String status = 'Available',
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    final user = UserModel(
      id: userId,
      username: userId.split('_').last,
      email: '$userId@example.com',
      name: name,
      avatar: avatar,
      bio: bio,
      status: status,
      isOnline: true,
      createdAt: DateTime.now(),
    );

    // Save auth token and user data
    await _storageService.saveAuthToken('mock_token_$userId');
    await _storageService.saveUserId(userId);
    await _storageService.saveUserData(user.toJson());

    return user;
  }

  /// Logout
  Future<void> logout() async {
    await _storageService.clearAll();
  }

  /// Get current logged-in user
  UserModel? getCurrentUser() {
    final userData = _storageService.userData;
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }

  /// Check if user is logged in
  bool isLoggedIn() {
    return _storageService.isLoggedIn;
  }

  /// Send password reset email
  Future<bool> sendPasswordResetEmail(String email) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock - always return true
    return true;
  }
}
