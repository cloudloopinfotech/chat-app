# App Constants

This directory contains all centralized constants for the application.

## Files

- **`app_assets.dart`** - Image, SVG, and font asset paths
- **`app_strings.dart`** - All text strings used throughout the app
- **`app_sizes.dart`** - All dimension values (height, width, padding, margins, etc.)
- **`app_constants.dart`** - Main constants file that exports all constants and contains app-wide constants

## Usage

### Import Constants

```dart
import 'package:chat_app/core/constants/app_constants.dart';
// Or import specific files:
import 'package:chat_app/core/constants/app_assets.dart';
import 'package:chat_app/core/constants/app_strings.dart';
import 'package:chat_app/core/constants/app_sizes.dart';
```

### Using Assets

```dart
// Images
Image.asset(AppAssets.logo)
Image.asset(AppAssets.placeholderAvatar)

// SVG Icons
SvgPicture.asset(AppAssets.iconHome)

// Helper methods
Image.asset(AppAssets.image('custom_image.png'))
SvgPicture.asset(AppAssets.icon('custom_icon.svg'))
```

### Using Strings

```dart
// Text widgets
Text(AppStrings.appName)
Text(AppStrings.login)
Text(AppStrings.error)

// Snackbars
Get.snackbar(AppStrings.error, AppStrings.somethingWentWrong)

// Dialog titles
AlertDialog(title: Text(AppStrings.areYouSure))
```

### Using Sizes

```dart
// Padding and Margins
Container(
  padding: EdgeInsets.all(AppSizes.paddingM),
  margin: EdgeInsets.symmetric(horizontal: AppSizes.marginL),
)

// Spacing
SizedBox(height: AppSizes.spacing16)
SizedBox(width: AppSizes.spacing8)

// Icon Sizes
Icon(Icons.home, size: AppSizes.iconSizeM)

// Avatar Sizes
AvatarWidget(size: AppSizes.avatarSizeL)

// Border Radius
BorderRadius.circular(AppSizes.radiusM)

// Button Heights
SizedBox(height: AppSizes.buttonHeightM)

// Font Sizes (for reference)
TextStyle(fontSize: AppSizes.fontSizeL)

// List Item Heights
SizedBox(height: AppSizes.listItemHeightM)
```

### Using Constants

```dart
// API Configuration
final url = '${AppConstants.baseUrl}${AppConstants.apiVersion}/endpoint';

// Storage Keys
storageService.save(AppConstants.keyAuthToken, token);

// UI Constants
Container(
  padding: EdgeInsets.all(AppSizes.paddingM),
  borderRadius: BorderRadius.circular(AppSizes.radiusM),
)

// Validation
if (password.length < AppConstants.minPasswordLength) {
  // Show error
}

// Timeouts
await dio.get(url, options: Options(
  receiveTimeout: AppConstants.defaultTimeout,
))
```

## Adding New Constants

1. **Assets**: Add new asset paths to `app_assets.dart`
2. **Strings**: Add new text strings to `app_strings.dart`
3. **Constants**: Add new app-wide constants to `app_constants.dart`

## Best Practices

- Always use constants instead of hardcoded strings
- Use descriptive names for constants
- Group related constants together
- Keep constants organized by category
- Update constants when adding new features

