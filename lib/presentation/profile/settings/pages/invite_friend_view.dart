import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';

class InviteFriendView extends GetView<SettingsController> {
  const InviteFriendView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Invite a friend',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () => Get.snackbar('Share', 'Sharing invite link...'),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.ios_share, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      'Share invite link',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildContactGroup('A', [
                  {'name': 'A', 'phone': '+91 97149 40052'},
                ]),
                _buildContactGroup('B', [
                  {'name': 'Benjamin White', 'phone': '+1 555 123 4567'},
                  {'name': 'Barbara Lee', 'phone': '+1 555 234 5678'},
                  {
                    'name': 'Ahmedabad Main Branch',
                    'phone': '+91 79 4002 9137'
                  },
                ]),
                _buildContactGroup('C', [
                  {'name': 'Hdfc Credit Card', 'phone': '+91 94292 45731'},
                  {'name': 'Om Credit Card', 'phone': '+91 93283 78008'},
                  {
                    'name': 'Vestige Customer Care',
                    'phone': '+91 1800 102 3424'
                  },
                  {
                    'name': 'Gel Ambe Gtpl Yogi Chowk',
                    'phone': '+91 99251 90038'
                  },
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactGroup(String letter, List<Map<String, String>> contacts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            letter,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...contacts.map((contact) => _buildContactItem(contact)),
      ],
    );
  }

  Widget _buildContactItem(Map<String, String> contact) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: const Icon(Icons.person, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  contact['phone']!,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
