import '../models/status_model.dart';
import '../providers/mock_data_provider.dart';

/// Repository for status/story operations
class StatusRepository {
  final List<StatusModel> _statuses = MockDataProvider.getMockStatuses();

  /// Get all statuses
  Future<List<StatusModel>> getStatuses() async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Filter out expired statuses
    return _statuses.where((s) => !s.isExpired).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  /// Get statuses by user ID
  Future<List<StatusModel>> getUserStatuses(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return _statuses.where((s) => s.userId == userId && !s.isExpired).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  /// Get my statuses
  Future<List<StatusModel>> getMyStatuses() async {
    return getUserStatuses(MockDataProvider.currentUserId);
  }

  /// Create status
  Future<StatusModel> createStatus({
    required StatusType type,
    required String content,
    String? backgroundColor,
    int duration = 5,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final status = StatusModel(
      id: 'status_${DateTime.now().millisecondsSinceEpoch}',
      userId: MockDataProvider.currentUserId,
      type: type,
      content: content,
      backgroundColor: backgroundColor,
      timestamp: DateTime.now(),
      duration: duration,
    );

    _statuses.add(status);
    return status;
  }

  /// Delete status
  Future<bool> deleteStatus(String statusId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final initialLength = _statuses.length;
    _statuses.removeWhere((s) => s.id == statusId);
    return _statuses.length < initialLength;
  }

  /// Mark status as viewed
  Future<bool> markAsViewed(String statusId) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _statuses.indexWhere((s) => s.id == statusId);
    if (index != -1) {
      final viewedBy = List<String>.from(_statuses[index].viewedBy);
      if (!viewedBy.contains(MockDataProvider.currentUserId)) {
        viewedBy.add(MockDataProvider.currentUserId);
        _statuses[index] = _statuses[index].copyWith(viewedBy: viewedBy);
      }
      return true;
    }

    return false;
  }

  /// Get recent statuses (not viewed)
  Future<List<StatusModel>> getRecentStatuses() async {
    final statuses = await getStatuses();
    return statuses
        .where((s) =>
            s.userId != MockDataProvider.currentUserId &&
            !s.viewedBy.contains(MockDataProvider.currentUserId))
        .toList();
  }

  /// Get viewed statuses
  Future<List<StatusModel>> getViewedStatuses() async {
    final statuses = await getStatuses();
    return statuses
        .where((s) =>
            s.userId != MockDataProvider.currentUserId &&
            s.viewedBy.contains(MockDataProvider.currentUserId))
        .toList();
  }
}
