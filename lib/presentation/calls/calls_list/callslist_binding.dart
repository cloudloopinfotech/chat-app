import 'package:get/get.dart';
import 'callslist_controller.dart';

class CallsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallsListController());
  }
}
