import 'package:get/get.dart';
import 'home_controller.dart';
import 'chat_list/chat_list_controller.dart';
import '../status/feed/statusfeed_controller.dart';
import '../calls/calls_list/callslist_controller.dart';
import '../profile/settings/settings_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatListController>(() => ChatListController());
    Get.lazyPut<StatusFeedController>(() => StatusFeedController());
    Get.lazyPut<CallsListController>(() => CallsListController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
