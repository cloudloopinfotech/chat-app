/// Call model representing a voice or video call
class CallModel {
  final String id;
  final String userId; // The other participant
  final CallType type;
  final CallDirection direction;
  final CallStatus status;
  final int? duration; // Duration in seconds
  final DateTime timestamp;

  CallModel({
    required this.id,
    required this.userId,
    this.type = CallType.audio,
    this.direction = CallDirection.outgoing,
    this.status = CallStatus.completed,
    this.duration,
    required this.timestamp,
  });

  // From JSON
  factory CallModel.fromJson(Map<String, dynamic> json) {
    return CallModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: CallType.values.firstWhere(
        (e) => e.toString() == 'CallType.${json['type']}',
        orElse: () => CallType.audio,
      ),
      direction: CallDirection.values.firstWhere(
        (e) => e.toString() == 'CallDirection.${json['direction']}',
        orElse: () => CallDirection.outgoing,
      ),
      status: CallStatus.values.firstWhere(
        (e) => e.toString() == 'CallStatus.${json['status']}',
        orElse: () => CallStatus.completed,
      ),
      duration: json['duration'] as int?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type.name,
      'direction': direction.name,
      'status': status.name,
      'duration': duration,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Copy with
  CallModel copyWith({
    String? id,
    String? userId,
    CallType? type,
    CallDirection? direction,
    CallStatus? status,
    int? duration,
    DateTime? timestamp,
  }) {
    return CallModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      direction: direction ?? this.direction,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

/// Call types
enum CallType {
  audio,
  video,
}

/// Call direction
enum CallDirection {
  incoming,
  outgoing,
}

/// Call status
enum CallStatus {
  missed,
  rejected,
  completed,
  cancelled,
}
