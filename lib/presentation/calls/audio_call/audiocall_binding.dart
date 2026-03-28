import 'package:get/get.dart';
import 'audiocall_controller.dart';

class AudioCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioCallController());
  }
}
