import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 2.obs; // Default to Chats (index 2)

  void changePage(int index) {
    currentIndex.value = index;
  }
}
