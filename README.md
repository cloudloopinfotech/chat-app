# Flutter Chat App with GetX

A complete Flutter chat application with 26+ screens using GetX for state management, navigation, and dependency injection.

## Features

### ✅ Implemented Features

#### Authentication & Onboarding
- Splash screen with auto-navigation
- Onboarding flow with 3 slides
- Login with email/password validation
- Signup with comprehensive validation
- OTP verification with resend timer
- Profile setup with image picker

#### Chat Management
- Chat list with search functionality
- Swipe actions (archive/delete)
- Unread message badges
- Online/offline indicators
- Pinned chats
- Private chat with message bubbles
- Message reactions
- Message status (sent/delivered/read)
- Long-press menu (copy/reply/delete/react)

#### Core Features
- Light/Dark theme support
- Local storage for auth & preferences
- Mock data providers
- Clean architecture (presentation/data/core)
- Comprehensive routing with GetX
- Reusable widgets (CustomButton, CustomTextField, AvatarWidget)

### 🚧 Stub Implementations (Coming Soon)
- Group chat
- Contacts & search
- Archive & blocked users
- Audio/Video calls
- Status/Stories
- User profiles
- Settings
- Notifications
- Media gallery

## Tech Stack

- **Flutter**: 3.x with null safety
- **State Management**: GetX (get package)
- **Routing**: GetX named routes
- **Dependency Injection**: Get.put / Get.lazyPut
- **Local Storage**: get_storage
- **Networking**: dio
- **Image Handling**: image_picker, cached_network_image
- **Date Formatting**: intl

## Project Structure

```
lib/
├── main.dart
├── app/
│   ├── routes/          # Route definitions
│   ├── themes/          # Theme configuration
│   └── bindings/        # Initial bindings
├── core/
│   ├── services/        # Core services (Storage, API)
│   └── widgets/         # Reusable widgets
├── data/
│   ├── models/          # Data models
│   ├── repositories/    # Data repositories
│   └── providers/       # Mock data providers
└── presentation/
    ├── auth/            # Auth screens
    ├── home/            # Home & contacts screens
    ├── chat/            # Messaging screens
    ├── calls/           # Call screens
    ├── status/          # Status/story screens
    └── profile/         # Profile & settings screens
```

## Getting Started

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher

### Installation

1. Clone the repository
```bash
cd /Users/ajay/StudioProjects/chat_app
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Usage

### Test Credentials
Use any email from the mock users:
- Email: `john@example.com`, `jane@example.com`, `mike@example.com`
- Password: Any 6+ characters

### Navigation Flow
1. **First Launch**: Splash → Onboarding → Login
2. **Subsequent Launches**: Splash → Chat List (if logged in)
3. **Signup Flow**: Signup → OTP (any 6 digits) → Setup Profile → Chat List

### Key Features to Test

#### Chat List
- Tap on a chat to open conversation
- Swipe right to archive
- Swipe left to delete
- Pull to refresh
- Use menu for profile/settings/logout

#### Private Chat
- Send messages
- Long press message for options
- Add reactions
- View message status (✓/✓✓)
- See online/offline status

#### Theme
- System follows device theme
- Can be changed in Settings (when implemented)

## Architecture

### GetX Pattern
Each screen follows this structure:
- **Controller**: Business logic and state management
- **Binding**: Dependency injection
- **View**: UI components

Example:
```dart
// Controller
class LoginController extends GetxController {
  final isLoading = false.obs;
  void login() { /* logic */ }
}

// Binding
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

// View
class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(/* UI */);
  }
}
```

### State Management
- Reactive variables with `.obs`
- UI updates with `Obx(() => ...)`
- Controllers extend `GetxController`
- Views extend `GetView<Controller>`

### Data Layer
- **Models**: Strongly typed with fromJson/toJson
- **Repositories**: Business logic for data operations
- **Providers**: Mock data for testing (replace with real API)

## Testing

### Run Tests
```bash
flutter test
```

### Test Files
- `test/controllers/login_controller_test.dart` - Login controller tests
- `test/repositories/auth_repository_test.dart` - Auth repository tests

## Customization

### Adding a New Screen
1. Create controller, binding, and view files
2. Add route to `app/routes/app_routes.dart`
3. Add page to `app/routes/app_pages.dart`
4. Implement business logic in controller
5. Build UI in view

### Integrating Backend
1. Update `core/services/api_service.dart` with your API base URL
2. Replace mock repositories with real API calls
3. Update models if needed
4. Handle authentication tokens in API service

### Theme Customization
Edit `app/themes/app_colors.dart` and `app/themes/app_theme.dart`

## Future Enhancements

- [ ] Implement remaining 15 screens
- [ ] Real-time messaging with WebSockets
- [ ] Push notifications
- [ ] End-to-end encryption
- [ ] Voice messages
- [ ] File sharing
- [ ] Group chat management
- [ ] User blocking/reporting
- [ ] Message search
- [ ] Chat backup/restore

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License.

## Acknowledgments

- Built with Flutter and GetX
- Icons from Material Icons
- Sample avatars from pravatar.cc
- Sample images from picsum.photos

## Support

For issues and questions, please create an issue in the repository.

---

**Note**: This app uses mock data. For production use, integrate with a real backend like Supabase or Firebase.
