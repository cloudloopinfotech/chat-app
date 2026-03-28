import 'package:get/get.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../core/services/storage_service.dart';
import '../../../app/routes/app_routes.dart';

/// Splash screen controller
class SplashController extends GetxController {
  late final AuthRepository _authRepository;
  late final StorageService _storageService;

  @override
  void onInit() {
    super.onInit();
    try {
      _authRepository = AuthRepository();
      _storageService = Get.find<StorageService>();
    } catch (e) {
      print('❌ Splash: Error initializing dependencies: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    try {
      // Show splash for 2 seconds
      await Future.delayed(const Duration(seconds: 2));

      // Check if user has seen onboarding
      final hasSeenOnboarding = _storageService.hasSeenOnboarding;

      if (!hasSeenOnboarding) {
        Get.offAllNamed(AppRoutes.ONBOARDING);
        return;
      }

      // Check if user is logged in
      final isLoggedIn = _authRepository.isLoggedIn();

      if (isLoggedIn) {
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        Get.offAllNamed(AppRoutes.LOGIN);
      }
    } catch (e) {
      print('❌ Splash: Error during auth check: $e');
      // Fallback to login on error
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }
}
