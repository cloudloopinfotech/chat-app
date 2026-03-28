import 'package:get/get.dart';
import '../../../data/models/call_model.dart';
import '../../../data/repositories/call_repository.dart';

class CallsListController extends GetxController {
  final CallRepository _callRepository = Get.find<CallRepository>();

  final calls = <CallModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCalls();
  }

  Future<void> loadCalls() async {
    isLoading.value = true;
    try {
      final result = await _callRepository.getCalls();
      calls.assignAll(result);
    } catch (e) {
      print('Error loading calls: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void startAudioCall(String userId) {
    // Navigate to audio call screen
    Get.toNamed('/calls/audio', arguments: {'userId': userId});
  }

  void startVideoCall(String userId) {
    // Navigate to video call screen
    Get.toNamed('/calls/video', arguments: {'userId': userId});
  }
}
