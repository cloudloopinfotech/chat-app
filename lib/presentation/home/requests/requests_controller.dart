import 'package:get/get.dart';

class ContactRequestsController extends GetxController {
  final isLoading = false.obs;
  final requests = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRequests();
  }

  void loadRequests() {
    // Mock data - replace with actual API call
    requests.value = [
      {
        'id': '1',
        'name': 'Alex Johnson',
        'avatar': 'https://i.pravatar.cc/150?img=11',
        'message': 'Hi! I\'d like to connect',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
      },
      {
        'id': '2',
        'name': 'Sarah Williams',
        'avatar': 'https://i.pravatar.cc/150?img=12',
        'message': 'Let\'s chat!',
        'timestamp': DateTime.now().subtract(const Duration(days: 1)),
      },
    ];
  }

  Future<void> acceptRequest(String requestId) async {
    requests.removeWhere((r) => r['id'] == requestId);
    Get.snackbar('Success', 'Contact request accepted');
  }

  Future<void> rejectRequest(String requestId) async {
    requests.removeWhere((r) => r['id'] == requestId);
    Get.snackbar('Success', 'Contact request rejected');
  }
}
