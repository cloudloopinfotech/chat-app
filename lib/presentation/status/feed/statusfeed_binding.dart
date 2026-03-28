import 'package:get/get.dart';
import 'statusfeed_controller.dart';

class StatusFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatusFeedController());
  }
}
