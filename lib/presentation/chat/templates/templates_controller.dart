import 'package:get/get.dart';

class MessageTemplatesController extends GetxController {
  final templates = <Map<String, String>>[].obs;
  final selectedCategory = 'All'.obs;

  final categories = [
    'All',
    'Greetings',
    'Business',
    'Personal',
    'Quick Replies'
  ];

  @override
  void onInit() {
    super.onInit();
    loadTemplates();
  }

  void loadTemplates() {
    templates.value = [
      {'category': 'Greetings', 'text': 'Good morning! How are you?'},
      {'category': 'Greetings', 'text': 'Hi! Hope you\'re having a great day!'},
      {
        'category': 'Business',
        'text': 'Thank you for your inquiry. I\'ll get back to you soon.'
      },
      {
        'category': 'Business',
        'text': 'Meeting scheduled for tomorrow at 10 AM.'
      },
      {'category': 'Personal', 'text': 'Miss you! Let\'s catch up soon.'},
      {'category': 'Personal', 'text': 'Happy Birthday! 🎉'},
      {'category': 'Quick Replies', 'text': 'Yes'},
      {'category': 'Quick Replies', 'text': 'No'},
      {'category': 'Quick Replies', 'text': 'Maybe later'},
      {'category': 'Quick Replies', 'text': 'On my way!'},
    ];
  }

  List<Map<String, String>> get filteredTemplates {
    if (selectedCategory.value == 'All') {
      return templates;
    }
    return templates
        .where((t) => t['category'] == selectedCategory.value)
        .toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void useTemplate(String text) {
    Get.back(result: text);
  }

  void addTemplate(String category, String text) {
    templates.add({'category': category, 'text': text});
    Get.snackbar('Success', 'Template added');
  }

  void deleteTemplate(int index) {
    templates.removeAt(index);
    Get.snackbar('Success', 'Template deleted');
  }
}
