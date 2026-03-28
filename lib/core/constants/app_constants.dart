/// Application Constants
/// Main constants file that exports all other constants
library app_constants;

export 'app_assets.dart';
export 'app_strings.dart';
export 'app_sizes.dart';

/// Application-wide constants
class AppConstants {
  AppConstants._(); // Private constructor to prevent instantiation

  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = '/v1';
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // Storage Keys
  static const String keyAuthToken = 'auth_token';
  static const String keyUserId = 'user_id';
  static const String keyUserData = 'user_data';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  static const String keyOnboardingCompleted = 'onboarding_completed';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Message Limits
  static const int maxMessageLength = 4096;
  static const int maxMediaSize = 16 * 1024 * 1024; // 16 MB
  static const int maxImageSize = 10 * 1024 * 1024; // 10 MB
  static const int maxVideoSize = 50 * 1024 * 1024; // 50 MB
  static const int maxAudioSize = 5 * 1024 * 1024; // 5 MB

  // Timeouts
  static const Duration defaultTimeout = Duration(seconds: 30);
  static const Duration shortTimeout = Duration(seconds: 10);
  static const Duration longTimeout = Duration(seconds: 60);

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration defaultAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Debounce Durations
  static const Duration searchDebounce = Duration(milliseconds: 500);
  static const Duration typingDebounce = Duration(milliseconds: 1000);

  // Cache Durations
  static const Duration imageCacheDuration = Duration(days: 7);
  static const Duration dataCacheDuration = Duration(hours: 1);

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;
  static const double defaultIconSize = 24.0;
  static const double smallIconSize = 16.0;
  static const double largeIconSize = 32.0;
  static const double avatarSize = 56.0;
  static const double smallAvatarSize = 40.0;
  static const double largeAvatarSize = 100.0;

  // Status Constants
  static const int statusExpirationHours = 24;
  static const int maxStatusCount = 30;

  // Chat Constants
  static const int maxGroupMembers = 256;
  static const int maxGroupAdmins = 10;
  static const int typingIndicatorTimeout = 3000; // 3 seconds

  // Call Constants
  static const int maxCallDuration = 3600; // 1 hour in seconds
  static const int callRingTimeout = 30; // 30 seconds

  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 128;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 30;
  static const int minNameLength = 1;
  static const int maxNameLength = 50;
  static const int maxBioLength = 150;

  // Regex Patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phonePattern = r'^\+?[1-9]\d{1,14}$';
  static const String urlPattern =
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$';

  // Date Formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String fullDateFormat = 'EEEE, MMMM dd, yyyy';
  static const String shortDateFormat = 'MMM dd, yyyy';

  // File Extensions
  static const List<String> imageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
    'bmp'
  ];
  static const List<String> videoExtensions = [
    'mp4',
    'mov',
    'avi',
    'mkv',
    'webm',
    '3gp'
  ];
  static const List<String> audioExtensions = [
    'mp3',
    'wav',
    'aac',
    'm4a',
    'ogg',
    'flac'
  ];
  static const List<String> documentExtensions = [
    'pdf',
    'doc',
    'docx',
    'xls',
    'xlsx',
    'ppt',
    'pptx',
    'txt',
    'rtf'
  ];

  // MIME Types
  static const Map<String, String> mimeTypes = {
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'gif': 'image/gif',
    'webp': 'image/webp',
    'mp4': 'video/mp4',
    'mov': 'video/quicktime',
    'mp3': 'audio/mpeg',
    'wav': 'audio/wav',
    'pdf': 'application/pdf',
    'doc': 'application/msword',
    'docx': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  };
}

