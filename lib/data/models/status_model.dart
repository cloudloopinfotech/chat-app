/// Status/Story model
class StatusModel {
  final String id;
  final String userId;
  final StatusType type;
  final String content; // Text content or image URL
  final String? backgroundColor; // For text statuses
  final DateTime timestamp;
  final List<String> viewedBy;
  final int duration; // Duration in seconds

  StatusModel({
    required this.id,
    required this.userId,
    this.type = StatusType.text,
    required this.content,
    this.backgroundColor,
    required this.timestamp,
    this.viewedBy = const [],
    this.duration = 5,
  });

  // From JSON
  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: StatusType.values.firstWhere(
        (e) => e.toString() == 'StatusType.${json['type']}',
        orElse: () => StatusType.text,
      ),
      content: json['content'] as String,
      backgroundColor: json['backgroundColor'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      viewedBy: (json['viewedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      duration: json['duration'] as int? ?? 5,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type.name,
      'content': content,
      'backgroundColor': backgroundColor,
      'timestamp': timestamp.toIso8601String(),
      'viewedBy': viewedBy,
      'duration': duration,
    };
  }

  // Copy with
  StatusModel copyWith({
    String? id,
    String? userId,
    StatusType? type,
    String? content,
    String? backgroundColor,
    DateTime? timestamp,
    List<String>? viewedBy,
    int? duration,
  }) {
    return StatusModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      content: content ?? this.content,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      timestamp: timestamp ?? this.timestamp,
      viewedBy: viewedBy ?? this.viewedBy,
      duration: duration ?? this.duration,
    );
  }

  // Check if status is expired (24 hours)
  bool get isExpired {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    return difference.inHours >= 24;
  }
}

/// Status types
enum StatusType {
  text,
  image,
  video,
}
