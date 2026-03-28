import 'package:get/get.dart';
import 'groupchat_controller.dart';

class GroupChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroupChatController());
  }
}
