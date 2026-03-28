import 'package:get/get.dart';
import 'createstatus_controller.dart';

class CreateStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateStatusController());
  }
}
