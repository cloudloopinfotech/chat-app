import 'package:get/get.dart';
import 'viewstatus_controller.dart';

class ViewStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewStatusController());
  }
}
