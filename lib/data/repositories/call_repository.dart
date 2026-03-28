import '../models/call_model.dart';
import '../providers/mock_data_provider.dart';

/// Repository for call operations
class CallRepository {
  final List<CallModel> _calls = MockDataProvider.getMockCalls();

  /// Get all calls
  Future<List<CallModel>> getCalls() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return _calls..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  /// Get calls by user ID
  Future<List<CallModel>> getUserCalls(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return _calls.where((c) => c.userId == userId).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  /// Create call record
  Future<CallModel> createCall({
    required String userId,
    required CallType type,
    required CallDirection direction,
    CallStatus status = CallStatus.completed,
    int? duration,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final call = CallModel(
      id: 'call_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      type: type,
      direction: direction,
      status: status,
      duration: duration,
      timestamp: DateTime.now(),
    );

    _calls.add(call);
    return call;
  }

  /// Update call status
  Future<CallModel?> updateCallStatus(String callId, CallStatus status,
      {int? duration}) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _calls.indexWhere((c) => c.id == callId);
    if (index != -1) {
      _calls[index] = _calls[index].copyWith(
        status: status,
        duration: duration,
      );
      return _calls[index];
    }

    return null;
  }

  /// Delete call record
  Future<bool> deleteCall(String callId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final initialLength = _calls.length;
    _calls.removeWhere((c) => c.id == callId);
    return _calls.length < initialLength;
  }

  /// Get missed calls count
  int getMissedCallsCount() {
    return _calls.where((c) => c.status == CallStatus.missed).length;
  }
}
