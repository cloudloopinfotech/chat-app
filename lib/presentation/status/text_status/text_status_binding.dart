import 'package:get/get.dart';
import 'text_status_controller.dart';

class TextStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextStatusController>(() => TextStatusController());
  }
}
