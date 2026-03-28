import 'package:get/get.dart';
import 'media_gallery_controller.dart';

class MediaGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MediaGalleryController());
  }
}
