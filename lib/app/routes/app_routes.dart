/// Define all route constants for the application
abstract class AppRoutes {
  // Auth & Identity
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const OTP = '/otp';
  static const SETUP_PROFILE = '/setup-profile';

  // Home & Contacts
  static const HOME = '/home';
  static const CHAT_LIST = '/chat-list';
  static const CONTACTS = '/contacts';
  static const SEARCH = '/search';
  static const ARCHIVE = '/archive';
  static const BLOCKED = '/blocked';
  static const REQUESTS = '/requests';

  // Messaging
  static const PRIVATE_CHAT = '/private-chat';
  static const GROUP_CHAT = '/group-chat';
  static const MEDIA_GALLERY = '/media-gallery';
  static const TEMPLATES = '/templates';

  // Calls
  static const CALLS_LIST = '/calls-list';
  static const AUDIO_CALL = '/audio-call';
  static const VIDEO_CALL = '/video-call';

  // Status
  static const STATUS_FEED = '/status-feed';
  static const VIEW_STATUS = '/view-status';
  static const CREATE_STATUS = '/create-status';
  static const TEXT_STATUS = '/text-status';

  // Profile & Settings
  static const USER_PROFILE = '/user-profile';
  static const EDIT_PROFILE = '/edit-profile';
  static const SETTINGS = '/settings';
  static const ACCOUNT_SETTINGS = '/account-settings';
  static const PRIVACY_SETTINGS = '/privacy-settings';
  static const CHAT_SETTINGS = '/chat-settings';
  static const NOTIFICATIONS = '/notifications';
  static const NOTIFICATION_SETTINGS = '/notification-settings';
  static const STORAGE_SETTINGS = '/storage-settings';
  static const HELP_SETTINGS = '/help-settings';
  static const INVITE_FRIEND = '/invite-friend';
  static const QR_CODE = '/qr-code';
  static const LINKED_DEVICES = '/linked-devices';
  static const STARRED_MESSAGES = '/starred-messages';
  static const LISTS_SETTINGS = '/lists-settings';
  static const GROUP_INFO = '/group-info';
  static const CONTACT_INFO = '/contact-info';
}
