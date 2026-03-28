import 'package:get/get.dart';

class GroupInfoController extends GetxController {
  final isMuted = true.obs;
  final isLocked = false.obs;

  // Mock member data
  final members = [
    {
      'name': 'You',
      'status': 'Act like a fool, Play like a king',
      'isAdmin': false,
      'isMe': true
    },
    {
      'name': 'Daniel White',
      'status': 'Living life to the fullest',
      'isAdmin': true,
      'isMe': false
    },
    {
      'name': 'Christopher Lee',
      'status': 'Tech enthusiast and developer',
      'isAdmin': true,
      'isMe': false,
      'phone': '+1 555 123 4567'
    },
    {
      'name': 'Amanda Wilson',
      'status': 'Designer & Creative',
      'isAdmin': false,
      'isMe': false
    },
    {
      'name': 'Thomas Brown',
      'status': 'Software Engineer',
      'isAdmin': false,
      'isMe': false
    },
    {
      'name': 'Adrian Martinez',
      'status': 'Available',
      'isAdmin': false,
      'isMe': false,
      'phone': '+1 555 234 5678'
    },
    {
      'name': 'Jennifer Lopez',
      'status': 'Product Manager',
      'isAdmin': false,
      'isMe': false,
      'phone': '+1 555 345 6789'
    },
    {
      'name': 'Ryan Anderson',
      'status': 'Marketing Specialist',
      'isAdmin': false,
      'isMe': false,
      'phone': '+1 555 456 7890'
    },
    {
      'name': 'Lauren Taylor',
      'status': 'UX Designer',
      'isAdmin': false,
      'isMe': false,
      'phone': '+1 555 567 8901'
    },
  ].obs;

  void toggleMute() {
    isMuted.toggle();
  }

  void toggleLock() {
    isLocked.toggle();
  }
}
