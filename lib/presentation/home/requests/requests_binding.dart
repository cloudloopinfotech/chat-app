import 'package:get/get.dart';
import 'requests_controller.dart';

class ContactRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactRequestsController());
  }
}
