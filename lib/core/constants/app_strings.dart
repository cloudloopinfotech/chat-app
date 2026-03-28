/// Application Strings Constants
/// Contains all text strings used throughout the app
class AppStrings {
  AppStrings._(); // Private constructor to prevent instantiation

  // App Info
  static const String appName = 'CliChat';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'Connect with friends and family';

  // Common
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String done = 'Done';
  static const String next = 'Next';
  static const String back = 'Back';
  static const String skip = 'Skip';
  static const String continue_ = 'Continue';
  static const String retry = 'Retry';
  static const String close = 'Close';
  static const String search = 'Search';
  static const String send = 'Send';
  static const String share = 'Share';
  static const String copy = 'Copy';
  static const String paste = 'Paste';
  static const String select = 'Select';
  static const String selectAll = 'Select All';
  static const String clear = 'Clear';
  static const String clearAll = 'Clear All';
  static const String confirm = 'Confirm';
  static const String yes = 'Yes';
  static const String no = 'No';

  // Auth
  static const String login = 'Login';
  static const String signup = 'Sign Up';
  static const String logout = 'Logout';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String username = 'Username';
  static const String phoneNumber = 'Phone Number';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = "Don't have an account?";
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String createAccount = 'Create Account';
  static const String loginToAccount = 'Login to your account';
  static const String enterOTP = 'Enter OTP';
  static const String verifyOTP = 'Verify OTP';
  static const String resendOTP = 'Resend OTP';
  static const String otpSentTo = 'OTP sent to';
  static const String setupProfile = 'Setup Profile';
  static const String profileSetup = 'Profile Setup';
  static const String enterYourName = 'Enter your name';
  static const String enterYourBio = 'Enter your bio';

  // Home
  static const String chats = 'Chats';
  static const String calls = 'Calls';
  static const String status = 'Status';
  static const String contacts = 'Contacts';
  static const String settings = 'Settings';
  static const String profile = 'Profile';
  static const String newChat = 'New Chat';
  static const String newGroup = 'New Group';
  static const String archived = 'Archived';
  static const String archivedChats = 'Archived Chats';
  static const String noChatsYet = 'No chats yet';
  static const String noMessagesYet = 'No messages yet';
  static const String sayHi = 'Say hi! 👋';
  static const String all = 'All';
  static const String unread = 'Unread';
  static const String favourites = 'Favourites';
  static const String groups = 'Groups';
  static const String askMetaAI = 'Ask Meta AI or Search';

  // Chat
  static const String typeMessage = 'Type a message';
  static const String message = 'Message';
  static const String messages = 'Messages';
  static const String media = 'Media';
  static const String links = 'Links';
  static const String docs = 'Docs';
  static const String mediaLinksDocs = 'Media, links and docs';
  static const String starred = 'Starred';
  static const String starredMessages = 'Starred Messages';
  static const String none = 'None';
  static const String notifications = 'Notifications';
  static const String chatTheme = 'Chat theme';
  static const String saveToPhotos = 'Save to Photos';
  static const String default_ = 'Default';
  static const String disappearingMessages = 'Disappearing messages';
  static const String lockChat = 'Lock chat';
  static const String lockAndHideChat = 'Lock and hide this chat on this device.';
  static const String advancedChatPrivacy = 'Advanced chat privacy';
  static const String encryption = 'Encryption';
  static const String encryptionDescription =
      'Messages and calls are end-to-end encrypted. Tap to verify.';
  static const String contactInfo = 'Contact info';
  static const String contactDetails = 'Contact details';
  static const String groupsInCommon = 'groups in common';
  static const String createGroupWith = 'Create group with';
  static const String seeAll = 'See all';
  static const String shareContact = 'Share contact';
  static const String addToFavourites = 'Add to Favourites';
  static const String addToList = 'Add to list';
  static const String exportChat = 'Export chat';
  static const String clearChat = 'Clear chat';
  static const String block = 'Block';
  static const String report = 'Report';
  static const String audio = 'Audio';
  static const String video = 'Video';
  static const String pay = 'Pay';
  static const String location = 'Location';
  static const String contact = 'Contact';
  static const String on = 'On';
  static const String off = 'Off';

  // Calls
  static const String incomingCall = 'Incoming Call';
  static const String outgoingCall = 'Outgoing Call';
  static const String missedCall = 'Missed Call';
  static const String callHistory = 'Call History';
  static const String noCallsYet = 'No calls yet';
  static const String audioCall = 'Audio Call';
  static const String videoCall = 'Video Call';
  static const String callDuration = 'Call Duration';
  static const String calling = 'Calling...';
  static const String ringing = 'Ringing...';
  static const String connected = 'Connected';
  static const String ended = 'Ended';

  // Status
  static const String myStatus = 'My Status';
  static const String recentUpdates = 'Recent Updates';
  static const String viewedUpdates = 'Viewed Updates';
  static const String statusUpdates = 'Status Updates';
  static const String noStatusUpdates = 'No status updates';
  static const String createStatus = 'Create Status';
  static const String textStatus = 'Text Status';
  static const String imageStatus = 'Image Status';
  static const String viewStatus = 'View Status';
  static const String statusPrivacy = 'Status Privacy';
  static const String myContacts = 'My Contacts';
  static const String myContactsExcept = 'My Contacts Except...';
  static const String onlyShareWith = 'Only Share With...';

  // Contacts
  static const String contactsList = 'Contacts List';
  static const String noContacts = 'No contacts';
  static const String addContact = 'Add Contact';
  static const String inviteFriends = 'Invite Friends';
  static const String syncContacts = 'Sync Contacts';
  static const String blockedUsers = 'Blocked Users';
  static const String noBlockedUsers = 'No blocked users';

  // Profile
  static const String userProfile = 'User Profile';
  static const String editProfile = 'Edit Profile';
  static const String name = 'Name';
  static const String bio = 'Bio';
  static const String status_ = 'Status';
  static const String available = 'Available';
  static const String busy = 'Busy';
  static const String offline = 'Offline';
  static const String changePhoto = 'Change Photo';
  static const String changeName = 'Change Name';
  static const String changeBio = 'Change Bio';
  static const String accountSettings = 'Account Settings';
  static const String privacySettings = 'Privacy Settings';
  static const String chatSettings = 'Chat Settings';
  static const String notificationSettings = 'Notification Settings';
  static const String storageSettings = 'Storage Settings';
  static const String helpSettings = 'Help Settings';
  static const String about = 'About';
  static const String version = 'Version';
  static const String termsOfService = 'Terms of Service';
  static const String privacyPolicy = 'Privacy Policy';

  // Settings
  static const String account = 'Account';
  static const String privacy = 'Privacy';
  static const String storage = 'Storage';
  static const String help = 'Help';
  static const String language = 'Language';
  static const String theme = 'Theme';
  static const String light = 'Light';
  static const String dark = 'Dark';
  static const String system = 'System';
  static const String wallpaper = 'Wallpaper';
  static const String fontSize = 'Font Size';
  static const String dataUsage = 'Data Usage';
  static const String autoDownload = 'Auto Download';
  static const String whenUsingMobileData = 'When using mobile data';
  static const String whenConnectedToWiFi = 'When connected to WiFi';
  static const String whenRoaming = 'When roaming';
  static const String linkedDevices = 'Linked Devices';
  static const String qrCode = 'QR Code';
  static const String twoStepVerification = 'Two-Step Verification';
  static const String changeNumber = 'Change Number';
  static const String deleteAccount = 'Delete Account';

  // Errors
  static const String error = 'Error';
  static const String somethingWentWrong = 'Something went wrong';
  static const String tryAgain = 'Try Again';
  static const String networkError = 'Network Error';
  static const String noInternetConnection = 'No Internet Connection';
  static const String connectionTimeout = 'Connection Timeout';
  static const String serverError = 'Server Error';
  static const String unauthorized = 'Unauthorized';
  static const String forbidden = 'Forbidden';
  static const String notFound = 'Not Found';
  static const String invalidInput = 'Invalid Input';
  static const String invalidEmail = 'Invalid Email';
  static const String invalidPassword = 'Invalid Password';
  static const String passwordTooShort = 'Password must be at least 6 characters';
  static const String passwordsDoNotMatch = 'Passwords do not match';
  static const String fieldRequired = 'This field is required';

  // Success
  static const String success = 'Success';
  static const String saved = 'Saved';
  static const String updated = 'Updated';
  static const String deleted = 'Deleted';
  static const String sent = 'Sent';
  static const String delivered = 'Delivered';
  static const String read = 'Read';
  static const String messageSent = 'Message sent';
  static const String messageDeleted = 'Message deleted';
  static const String profileUpdated = 'Profile updated';
  static const String chatCleared = 'Chat cleared';
  static const String chatArchived = 'Chat archived';
  static const String chatUnarchived = 'Chat unarchived';
  static const String userBlocked = 'User blocked';
  static const String userUnblocked = 'User unblocked';

  // Confirmations
  static const String areYouSure = 'Are you sure?';
  static const String deleteMessage = 'Delete Message';
  static const String deleteMessageConfirm = 'Are you sure you want to delete this message?';
  static const String deleteChatConfirm = 'Are you sure you want to delete this chat?';
  static const String clearChatConfirm = 'Are you sure you want to clear all messages?';
  static const String archiveChatConfirm = 'Are you sure you want to archive this chat?';
  static const String blockUserConfirm = 'Are you sure you want to block this user?';
  static const String reportUserConfirm = 'Are you sure you want to report this user?';
  static const String logoutConfirm = 'Are you sure you want to logout?';
  static const String deleteAccountConfirm = 'Are you sure you want to delete your account? This action cannot be undone.';

  // Time
  static const String today = 'Today';
  static const String yesterday = 'Yesterday';
  static const String justNow = 'Just now';
  static const String minutesAgo = 'minutes ago';
  static const String hoursAgo = 'hours ago';
  static const String daysAgo = 'days ago';
  static const String weeksAgo = 'weeks ago';
  static const String monthsAgo = 'months ago';
  static const String yearsAgo = 'years ago';

  // Placeholders
  static const String enterEmail = 'Enter your email';
  static const String enterPassword = 'Enter your password';
  static const String enterName = 'Enter your name';
  static const String enterPhoneNumber = 'Enter your phone number';
  static const String enterMessage = 'Type a message';
  static const String searchContacts = 'Search contacts';
  static const String searchChats = 'Search chats';
  static const String searchMessages = 'Search messages';

  // Features (Coming Soon)
  static const String comingSoon = 'Coming Soon';
  static const String featureComingSoon = 'This feature is coming soon';
}

