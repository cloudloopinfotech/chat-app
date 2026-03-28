import '../models/user_model.dart';
import '../providers/mock_data_provider.dart';

/// Repository for user operations
class UserRepository {
  final List<UserModel> _users = MockDataProvider.getMockUsers();
  final List<String> _blockedUserIds = [];

  /// Get all users (contacts)
  Future<List<UserModel>> getUsers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _users;
  }

  /// Get user by ID
  Future<UserModel?> getUserById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _users.firstWhereOrNull((u) => u.id == id);
  }

  /// Search users
  Future<List<UserModel>> searchUsers(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (query.isEmpty) return _users;

    final q = query.toLowerCase();
    return _users.where((user) {
      return user.name.toLowerCase().contains(q) ||
          user.username.toLowerCase().contains(q) ||
          user.email.toLowerCase().contains(q);
    }).toList();
  }

  /// Update user profile
  Future<UserModel?> updateProfile({
    required String userId,
    String? name,
    String? avatar,
    String? bio,
    String? status,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final index = _users.indexWhere((u) => u.id == userId);
    if (index != -1) {
      _users[index] = _users[index].copyWith(
        name: name,
        avatar: avatar,
        bio: bio,
        status: status,
      );
      return _users[index];
    }

    return null;
  }

  /// Block user
  Future<bool> blockUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (!_blockedUserIds.contains(userId)) {
      _blockedUserIds.add(userId);
      return true;
    }

    return false;
  }

  /// Unblock user
  Future<bool> unblockUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return _blockedUserIds.remove(userId);
  }

  /// Get blocked users
  Future<List<UserModel>> getBlockedUsers() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return _users.where((u) => _blockedUserIds.contains(u.id)).toList();
  }

  /// Check if user is blocked
  bool isUserBlocked(String userId) {
    return _blockedUserIds.contains(userId);
  }
}

/// Extension for firstWhereOrNull
extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
