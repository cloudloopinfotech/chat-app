import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'templates_controller.dart';
import '../../../app/themes/app_colors.dart';

class MessageTemplatesView extends GetView<MessageTemplatesController> {
  const MessageTemplatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Templates'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddTemplateDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Category chips
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    final isSelected =
                        controller.selectedCategory.value == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (_) => controller.selectCategory(category),
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    );
                  },
                )),
          ),
          const Divider(height: 1),

          // Templates list
          Expanded(
            child: Obx(() {
              final templates = controller.filteredTemplates;

              if (templates.isEmpty) {
                return const Center(
                  child: Text('No templates in this category'),
                );
              }

              return ListView.builder(
                itemCount: templates.length,
                itemBuilder: (context, index) {
                  final template = templates[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      child:
                          const Icon(Icons.message, color: AppColors.primary),
                    ),
                    title: Text(template['text']!),
                    subtitle: Text(template['category']!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () =>
                              controller.useTemplate(template['text']!),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => controller.deleteTemplate(index),
                        ),
                      ],
                    ),
                    onTap: () => controller.useTemplate(template['text']!),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showAddTemplateDialog(BuildContext context) {
    final textController = TextEditingController();
    String selectedCategory = 'Greetings';

    Get.dialog(
      AlertDialog(
        title: const Text('Add Template'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(labelText: 'Category'),
              items: controller.categories
                  .where((c) => c != 'All')
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) selectedCategory = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Template Text',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                controller.addTemplate(selectedCategory, textController.text);
                Get.back();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
