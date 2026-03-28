import 'package:get/get.dart';
import 'templates_controller.dart';

class MessageTemplatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageTemplatesController());
  }
}
