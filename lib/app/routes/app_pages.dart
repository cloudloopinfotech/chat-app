import 'package:get/get.dart';

import '../../presentation/auth/splash/splash_binding.dart';
import '../../presentation/auth/splash/splash_view.dart';
import '../../presentation/auth/onboarding/onboarding_binding.dart';
import '../../presentation/auth/onboarding/onboarding_view.dart';
import '../../presentation/auth/login/login_binding.dart';
import '../../presentation/auth/login/login_view.dart';
import '../../presentation/auth/signup/signup_binding.dart';
import '../../presentation/auth/signup/signup_view.dart';
import '../../presentation/auth/otp/otp_binding.dart';
import '../../presentation/auth/otp/otp_view.dart';
import '../../presentation/auth/setup_profile/setup_profile_binding.dart';
import '../../presentation/auth/setup_profile/setup_profile_view.dart';

import '../../presentation/home/home_binding.dart';
import '../../presentation/home/home_view.dart';
import '../../presentation/home/chat_list/chat_list_binding.dart';
import '../../presentation/home/chat_list/chat_list_view.dart';
import '../../presentation/home/contacts/contacts_binding.dart';
import '../../presentation/home/contacts/contacts_view.dart';
import '../../presentation/home/search/search_binding.dart';
import '../../presentation/home/search/search_view.dart';
import '../../presentation/home/archive/archive_binding.dart';
import '../../presentation/home/archive/archive_view.dart';
import '../../presentation/home/blocked/blocked_binding.dart';
import '../../presentation/home/blocked/blocked_view.dart';
import '../../presentation/home/requests/requests_binding.dart';
import '../../presentation/home/requests/requests_view.dart';

import '../../presentation/chat/private/private_chat_binding.dart';
import '../../presentation/chat/private/private_chat_view.dart';
import '../../presentation/chat/group/groupchat_binding.dart';
import '../../presentation/chat/group/groupchat_view.dart';
import '../../presentation/chat/media_gallery/media_gallery_binding.dart';
import '../../presentation/chat/media_gallery/media_gallery_view.dart';
import '../../presentation/chat/templates/templates_binding.dart';
import '../../presentation/chat/templates/templates_view.dart';

import '../../presentation/calls/calls_list/callslist_binding.dart';
import '../../presentation/calls/calls_list/callslist_view.dart';
import '../../presentation/calls/audio_call/audiocall_binding.dart';
import '../../presentation/calls/audio_call/audiocall_view.dart';
import '../../presentation/calls/video_call/videocall_binding.dart';
import '../../presentation/calls/video_call/videocall_view.dart';

import '../../presentation/status/feed/statusfeed_binding.dart';
import '../../presentation/status/feed/statusfeed_view.dart';
import '../../presentation/status/view/viewstatus_binding.dart';
import '../../presentation/status/view/viewstatus_view.dart';
import '../../presentation/status/create/createstatus_binding.dart';
import '../../presentation/status/create/createstatus_view.dart';
import '../../presentation/status/viewer/status_viewer_binding.dart';
import '../../presentation/status/viewer/status_viewer_view.dart';
import '../../presentation/status/text_status/text_status_binding.dart';
import '../../presentation/status/text_status/text_status_view.dart';

import '../../presentation/profile/user_profile/userprofile_binding.dart';
import '../../presentation/profile/user_profile/userprofile_view.dart';
import '../../presentation/profile/edit_profile/editprofile_binding.dart';
import '../../presentation/profile/edit_profile/editprofile_view.dart';
import '../../presentation/profile/settings/settings_binding.dart';
import '../../presentation/profile/settings/settings_view.dart';
import '../../presentation/profile/settings/pages/account_settings_view.dart';
import '../../presentation/profile/settings/pages/privacy_settings_view.dart';
import '../../presentation/profile/settings/pages/chat_settings_view.dart';
import '../../presentation/profile/settings/pages/notifications_settings_view.dart';
import '../../presentation/profile/settings/pages/storage_settings_view.dart';
import '../../presentation/profile/settings/pages/help_settings_view.dart';

import '../../presentation/profile/settings/pages/invite_friend_view.dart';
import '../../presentation/profile/settings/pages/qr_code_view.dart';
import '../../presentation/profile/settings/pages/linked_devices_view.dart';
import '../../presentation/profile/settings/pages/starred_messages_view.dart';
import '../../presentation/profile/settings/pages/lists_settings_view.dart';
import '../../presentation/chat/group/info/group_info_view.dart';
import '../../presentation/chat/group/info/group_info_binding.dart';
import '../../presentation/chat/private/info/contact_info_view.dart';
import '../../presentation/chat/private/info/contact_info_binding.dart';
import '../../presentation/profile/notifications/notifications_binding.dart';
import '../../presentation/profile/notifications/notifications_view.dart';

import 'app_routes.dart';

/// Application pages configuration
class AppPages {
  static final pages = [
    // Auth & Identity
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.SETUP_PROFILE,
      page: () => const SetupProfileView(),
      binding: SetupProfileBinding(),
    ),

    // Home & Contacts
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.CHAT_LIST,
      page: () => const ChatListView(),
      binding: ChatListBinding(),
    ),
    GetPage(
      name: AppRoutes.CONTACTS,
      page: () => const ContactsView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.ARCHIVE,
      page: () => const ArchiveView(),
      binding: ArchiveBinding(),
    ),
    GetPage(
      name: AppRoutes.BLOCKED,
      page: () => const BlockedView(),
      binding: BlockedBinding(),
    ),
    GetPage(
      name: AppRoutes.REQUESTS,
      page: () => const ContactRequestsView(),
      binding: ContactRequestsBinding(),
    ),

    // Messaging
    GetPage(
      name: AppRoutes.PRIVATE_CHAT,
      page: () => const PrivateChatView(),
      binding: PrivateChatBinding(),
    ),
    GetPage(
      name: AppRoutes.GROUP_CHAT,
      page: () => const GroupChatView(),
      binding: GroupChatBinding(),
    ),
    GetPage(
      name: AppRoutes.MEDIA_GALLERY,
      page: () => const MediaGalleryView(),
      binding: MediaGalleryBinding(),
    ),
    GetPage(
      name: AppRoutes.TEMPLATES,
      page: () => const MessageTemplatesView(),
      binding: MessageTemplatesBinding(),
    ),

    // Calls
    GetPage(
      name: AppRoutes.CALLS_LIST,
      page: () => const CallsListView(),
      binding: CallsListBinding(),
    ),
    GetPage(
      name: AppRoutes.AUDIO_CALL,
      page: () => const AudioCallView(),
      binding: AudioCallBinding(),
    ),
    GetPage(
      name: AppRoutes.VIDEO_CALL,
      page: () => const VideoCallView(),
      binding: VideoCallBinding(),
    ),

    // Status
    GetPage(
      name: AppRoutes.STATUS_FEED,
      page: () => const StatusFeedView(),
      binding: StatusFeedBinding(),
    ),
    GetPage(
      name: AppRoutes.VIEW_STATUS,
      page: () => const ViewStatusView(),
      binding: ViewStatusBinding(),
    ),
    GetPage(
      name: AppRoutes.CREATE_STATUS,
      page: () => const CreateStatusView(),
      binding: CreateStatusBinding(),
    ),
    GetPage(
      name: '/status-viewer',
      page: () => const StatusViewerView(),
      binding: StatusViewerBinding(),
    ),
    GetPage(
      name: AppRoutes.TEXT_STATUS,
      page: () => const TextStatusView(),
      binding: TextStatusBinding(),
    ),

    // Profile & Settings
    GetPage(
      name: AppRoutes.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.ACCOUNT_SETTINGS,
      page: () => const AccountSettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.PRIVACY_SETTINGS,
      page: () => const PrivacySettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.CHAT_SETTINGS,
      page: () => const ChatSettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION_SETTINGS,
      page: () => const NotificationSettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.STORAGE_SETTINGS,
      page: () => const StorageSettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.HELP_SETTINGS,
      page: () => const HelpSettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.INVITE_FRIEND,
      page: () => const InviteFriendView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.QR_CODE,
      page: () => const QrCodeView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.LINKED_DEVICES,
      page: () => const LinkedDevicesView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.STARRED_MESSAGES,
      page: () => const StarredMessagesView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.LISTS_SETTINGS,
      page: () => const ListsSettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.GROUP_INFO,
      page: () => const GroupInfoView(),
      binding: GroupInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.CONTACT_INFO,
      page: () => const ContactInfoView(),
      binding: ContactInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
  ];
}
