import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/chat_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/providers/mock_data_provider.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_constants.dart';

class ChatListController extends GetxController {
  final chats = <ChatModel>[].obs;
  final allChats = <ChatModel>[].obs;
  final isLoading = false.obs;
  final searchQuery = ''.obs;
  final currentUser = Rxn<UserModel>();
  final contactSearchQuery = ''.obs;
  final selectedFilter = 'all'.obs; // 'all', 'unread', 'favourites', 'groups'

  @override
  void onInit() {
    super.onInit();
    _loadCurrentUser();
    loadChats();
  }

  void _loadCurrentUser() {
    currentUser.value = MockDataProvider.getCurrentUser();
  }

  Future<void> loadChats() async {
    isLoading.value = true;
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    allChats.value = MockDataProvider.getMockChats();
    _applyFilter();
    isLoading.value = false;
  }
  
  void _applyFilter() {
    switch (selectedFilter.value) {
      case 'unread':
        chats.value = allChats.where((chat) => chat.unreadCount > 0).toList();
        break;
      case 'favourites':
        // For now, show all chats (can be extended with favourite property)
        chats.value = allChats.toList();
        break;
      case 'groups':
        chats.value = allChats.where((chat) => chat.type == ChatType.group).toList();
        break;
      case 'all':
      default:
        chats.value = allChats.toList();
        break;
    }
  }
  
  void setFilter(String filter) {
    selectedFilter.value = filter;
    _applyFilter();
  }
  
  int getUnreadCount() {
    return allChats.where((chat) => chat.unreadCount > 0).length;
  }
  
  int getGroupsCount() {
    return allChats.where((chat) => chat.type == ChatType.group).length;
  }

  Future<void> searchChats(String query) async {
    searchQuery.value = query;
    if (query.isEmpty) {
      _applyFilter();
    } else {
      // Filter by search query
      final filtered = allChats.where((chat) {
        final name = getChatName(chat).toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
      
      // Apply current filter on search results
      switch (selectedFilter.value) {
        case 'unread':
          chats.value = filtered.where((chat) => chat.unreadCount > 0).toList();
          break;
        case 'favourites':
          chats.value = filtered.toList();
          break;
        case 'groups':
          chats.value = filtered.where((chat) => chat.type == ChatType.group).toList();
          break;
        case 'all':
        default:
          chats.value = filtered.toList();
          break;
      }
    }
  }

  UserModel? getUserById(String userId) {
    final users = MockDataProvider.getMockUsers();
    try {
      return users.firstWhere((u) => u.id == userId);
    } catch (e) {
      return null;
    }
  }

  String getChatName(ChatModel chat) {
    if (chat.type == ChatType.group) {
      return chat.name ?? AppStrings.groups;
    }

    // For private chat, get the other user's name
    final otherUserId = chat.participantIds.firstWhere(
      (id) => id != MockDataProvider.currentUserId,
      orElse: () => '',
    );

    final user = getUserById(otherUserId);
    return user?.name ?? AppStrings.offline;
  }

  String? getChatAvatar(ChatModel chat) {
    if (chat.type == ChatType.group) {
      return chat.avatar;
    }

    final otherUserId = chat.participantIds.firstWhere(
      (id) => id != MockDataProvider.currentUserId,
      orElse: () => '',
    );

    final user = getUserById(otherUserId);
    return user?.avatar;
  }

  bool isUserOnline(ChatModel chat) {
    if (chat.type == ChatType.group) return false;

    final otherUserId = chat.participantIds.firstWhere(
      (id) => id != MockDataProvider.currentUserId,
      orElse: () => '',
    );

    final user = getUserById(otherUserId);
    return user?.isOnline ?? false;
  }

  Future<void> archiveChat(String chatId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    chats.removeWhere((c) => c.id == chatId);
    Get.snackbar(AppStrings.success, AppStrings.chatArchived);
  }

  Future<void> deleteChat(String chatId) async {
    final confirm = await Get.dialog<bool>(
      AlertDialog(
        title: Text(AppStrings.delete),
        content: Text(AppStrings.deleteChatConfirm),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(AppStrings.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      chats.removeWhere((c) => c.id == chatId);
      Get.snackbar(AppStrings.success, AppStrings.deleted);
    }
  }

  void openChat(ChatModel chat) {
    if (chat.type == ChatType.group) {
      Get.toNamed(AppRoutes.GROUP_CHAT, arguments: {'chat': chat});
    } else {
      Get.toNamed(AppRoutes.PRIVATE_CHAT, arguments: {'chat': chat});
    }
  }

  void goToNewChat() {
    Get.toNamed(AppRoutes.CONTACTS);
  }

  void goToSearch() {
    Get.toNamed(AppRoutes.SEARCH);
  }

  void goToArchive() {
    Get.toNamed(AppRoutes.ARCHIVE);
  }

  void goToSettings() {
    Get.toNamed(AppRoutes.SETTINGS);
  }

  void goToProfile() {
    Get.toNamed(AppRoutes.EDIT_PROFILE);
  }

  void goToStatusFeed() {
    Get.toNamed(AppRoutes.STATUS_FEED);
  }

  void goToCallsList() {
    Get.toNamed(AppRoutes.CALLS_LIST);
  }

  void showNewChatBottomSheet() {
    // This will be handled in the view
  }

  void openCameraForStatus() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (photo != null) {
        // Navigate to create status screen with the photo
        Get.toNamed(AppRoutes.CREATE_STATUS, arguments: {
          'imagePath': photo.path,
          'type': 'image',
        });
      }
    } catch (e) {
      Get.snackbar(
        AppStrings.error,
        'Failed to open camera',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void showChatSelectionMenu() {
    // This will be handled in the view
  }

  Future<void> logout() async {
    final confirm = await Get.dialog<bool>(
      AlertDialog(
        title: Text(AppStrings.logout),
        content: Text(AppStrings.logoutConfirm),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(AppStrings.logout, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      // Simulate logout
      await Future.delayed(const Duration(milliseconds: 500));
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }

  void searchContacts(String query) {
    contactSearchQuery.value = query;
  }

  List<UserModel> getFrequentlyContacted() {
    // Get users from recent chats (excluding current user)
    final recentChatUserIds = chats
        .where((chat) => chat.type == ChatType.private)
        .take(3)
        .map((chat) => chat.participantIds.firstWhere(
              (id) => id != MockDataProvider.currentUserId,
              orElse: () => '',
            ))
        .where((id) => id.isNotEmpty)
        .toList();

    final users = MockDataProvider.getMockUsers();
    return recentChatUserIds
        .map((id) => users.firstWhere((u) => u.id == id, orElse: () => users.first))
        .where((user) => user.id != MockDataProvider.currentUserId)
        .toList();
  }

  UserModel? getCurrentUser() {
    return currentUser.value;
  }

  List<UserModel> getAllContacts() {
    final users = MockDataProvider.getMockUsers();
    var allContacts = users
        .where((user) => user.id != MockDataProvider.currentUserId)
        .toList();

    // Filter by search query if present
    if (contactSearchQuery.value.isNotEmpty) {
      final query = contactSearchQuery.value.toLowerCase();
      allContacts = allContacts
          .where((user) =>
              user.name.toLowerCase().contains(query) ||
              user.email.toLowerCase().contains(query) ||
              (user.bio?.toLowerCase().contains(query) ?? false))
          .toList();
    }

    // Sort alphabetically
    allContacts.sort((a, b) => a.name.compareTo(b.name));

    return allContacts;
  }

  void openChatWithUser(UserModel user) {
    // Find existing chat or create new one
    ChatModel? existingChat;
    try {
      existingChat = chats.firstWhere(
        (chat) =>
            chat.type == ChatType.private &&
            chat.participantIds.contains(user.id),
      );
    } catch (e) {
      existingChat = null;
    }

    if (existingChat != null) {
      openChat(existingChat);
    } else {
      // Create a new chat
      final newChat = ChatModel(
        id: 'chat_${user.id}_${MockDataProvider.currentUserId}',
        type: ChatType.private,
        participantIds: [MockDataProvider.currentUserId, user.id],
        lastMessage: null,
        timestamp: DateTime.now(),
        unreadCount: 0,
        createdAt: DateTime.now(),
      );
      openChat(newChat);
    }
  }
}
