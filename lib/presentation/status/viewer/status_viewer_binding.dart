import 'package:get/get.dart';
import 'status_viewer_controller.dart';

class StatusViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusViewerController>(() => StatusViewerController());
  }
}
