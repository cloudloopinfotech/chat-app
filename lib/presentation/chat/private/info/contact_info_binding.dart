import 'package:get/get.dart';
import 'contact_info_controller.dart';

class ContactInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactInfoController());
  }
}

