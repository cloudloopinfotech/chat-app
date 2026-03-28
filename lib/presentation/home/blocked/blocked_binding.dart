import 'package:get/get.dart';
import 'blocked_controller.dart';

class BlockedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlockedController());
  }
}
