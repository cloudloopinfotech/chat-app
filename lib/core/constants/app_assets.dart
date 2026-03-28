/// Application Assets Constants
/// Contains all image, SVG, and font asset paths
class AppAssets {
  AppAssets._(); // Private constructor to prevent instantiation

  // Base paths
  static const String imagesPath = 'assets/images/';
  static const String iconsPath = 'assets/icons/';
  static const String fontsPath = 'assets/fonts/';

  // Image Assets
  static const String logo = '${imagesPath}logo.png';
  static const String logoDark = '${imagesPath}logo_dark.png';
  static const String splashBackground = '${imagesPath}splash_background.png';
  static const String onboarding1 = '${imagesPath}onboarding_1.png';
  static const String onboarding2 = '${imagesPath}onboarding_2.png';
  static const String onboarding3 = '${imagesPath}onboarding_3.png';
  static const String placeholderAvatar = '${imagesPath}placeholder_avatar.png';
  static const String placeholderImage = '${imagesPath}placeholder_image.png';
  static const String defaultGroupAvatar = '${imagesPath}default_group_avatar.png';
  static const String emptyState = '${imagesPath}empty_state.png';
  static const String errorState = '${imagesPath}error_state.png';
  static const String backgroundPattern = '${imagesPath}background_pattern.png';

  // SVG Icon Assets
  static const String iconHome = '${iconsPath}home.svg';
  static const String iconChat = '${iconsPath}chat.svg';
  static const String iconCalls = '${iconsPath}calls.svg';
  static const String iconStatus = '${iconsPath}status.svg';
  static const String iconProfile = '${iconsPath}profile.svg';
  static const String iconSearch = '${iconsPath}search.svg';
  static const String iconCamera = '${iconsPath}camera.svg';
  static const String iconGallery = '${iconsPath}gallery.svg';
  static const String iconMicrophone = '${iconsPath}microphone.svg';
  static const String iconVideo = '${iconsPath}video.svg';
  static const String iconAudio = '${iconsPath}audio.svg';
  static const String iconLocation = '${iconsPath}location.svg';
  static const String iconDocument = '${iconsPath}document.svg';
  static const String iconContact = '${iconsPath}contact.svg';
  static const String iconSettings = '${iconsPath}settings.svg';
  static const String iconNotification = '${iconsPath}notification.svg';
  static const String iconLock = '${iconsPath}lock.svg';
  static const String iconStar = '${iconsPath}star.svg';
  static const String iconArchive = '${iconsPath}archive.svg';
  static const String iconBlock = '${iconsPath}block.svg';
  static const String iconDelete = '${iconsPath}delete.svg';
  static const String iconEdit = '${iconsPath}edit.svg';
  static const String iconMore = '${iconsPath}more.svg';
  static const String iconSend = '${iconsPath}send.svg';
  static const String iconEmoji = '${iconsPath}emoji.svg';
  static const String iconAttachment = '${iconsPath}attachment.svg';
  static const String iconOnline = '${iconsPath}online.svg';
  static const String iconOffline = '${iconsPath}offline.svg';

  // Font Assets
  static const String fontFamily = 'Roboto'; // Default Flutter font
  static const String fontFamilyBold = 'Roboto';
  static const String fontFamilyLight = 'Roboto';
  static const String fontFamilyMedium = 'Roboto';
  static const String fontFamilyRegular = 'Roboto';

  // Font file paths (if using custom fonts)
  static const String fontRobotoRegular = '${fontsPath}Roboto-Regular.ttf';
  static const String fontRobotoBold = '${fontsPath}Roboto-Bold.ttf';
  static const String fontRobotoLight = '${fontsPath}Roboto-Light.ttf';
  static const String fontRobotoMedium = '${fontsPath}Roboto-Medium.ttf';
  static const String fontRobotoItalic = '${fontsPath}Roboto-Italic.ttf';

  // Helper method to get image path
  static String image(String name) => '$imagesPath$name';

  // Helper method to get icon path
  static String icon(String name) => '$iconsPath$name';

  // Helper method to get font path
  static String font(String name) => '$fontsPath$name';
}

