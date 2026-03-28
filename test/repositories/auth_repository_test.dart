import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:chat_app/data/repositories/auth_repository.dart';
import 'package:chat_app/core/services/storage_service.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  late AuthRepository repository;

  setUp(() async {
    // Initialize GetStorage for tests
    await GetStorage.init();

    // Initialize services
    Get.put(StorageService());

    // Create repository
    repository = AuthRepository();
  });

  tearDown(() {
    Get.reset();
  });

  group('AuthRepository Tests', () {
    test('Login with valid credentials should return user', () async {
      final user = await repository.login('john@example.com', 'password123');

      expect(user, isNotNull);
      expect(user?.email, 'john@example.com');
    });

    test('Login with invalid credentials should return null', () async {
      final user = await repository.login('invalid@example.com', 'wrong');

      expect(user, isNull);
    });

    test('Login with short password should return null', () async {
      final user = await repository.login('john@example.com', '12345');

      expect(user, isNull);
    });

    test('Signup with valid data should return user', () async {
      final user = await repository.signup(
        username: 'newuser',
        email: 'newuser@example.com',
        password: 'password123',
      );

      expect(user, isNotNull);
      expect(user?.username, 'newuser');
      expect(user?.email, 'newuser@example.com');
    });

    test('Signup with existing email should return null', () async {
      final user = await repository.signup(
        username: 'testuser',
        email: 'john@example.com', // Existing email
        password: 'password123',
      );

      expect(user, isNull);
    });

    test('Verify OTP with 6 digits should return true', () async {
      final isValid = await repository.verifyOTP('123456');

      expect(isValid, true);
    });

    test('Verify OTP with invalid length should return false', () async {
      final isValid = await repository.verifyOTP('12345');

      expect(isValid, false);
    });

    test('IsLoggedIn should return false initially', () {
      final isLoggedIn = repository.isLoggedIn();

      expect(isLoggedIn, false);
    });

    test('IsLoggedIn should return true after login', () async {
      await repository.login('john@example.com', 'password123');
      final isLoggedIn = repository.isLoggedIn();

      expect(isLoggedIn, true);
    });

    test('Logout should clear auth data', () async {
      // Login first
      await repository.login('john@example.com', 'password123');
      expect(repository.isLoggedIn(), true);

      // Logout
      await repository.logout();
      expect(repository.isLoggedIn(), false);
    });
  });
}
