import 'package:get/get.dart';
import '../../core/services/api_service.dart';

/// Initial binding to inject core services
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Core Services
    Get.lazyPut(() => ApiService(), fenix: true);
  }
}
