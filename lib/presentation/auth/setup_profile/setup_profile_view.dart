import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'setup_profile_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class SetupProfileView extends GetView<SetupProfileController> {
  const SetupProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Avatar
              Obx(() => GestureDetector(
                    onTap: controller.pickImage,
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withOpacity(0.1),
                            image: controller.selectedAvatar.value != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                        controller.selectedAvatar.value!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: controller.selectedAvatar.value == null
                              ? const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: AppColors.primary,
                                )
                              : null,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 8),
              Text(
                'Tap to upload photo',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),

              // Name Field
              Obx(() => CustomTextField(
                    controller: controller.nameController,
                    label: 'Full Name',
                    hint: 'Enter your name',
                    errorText: controller.nameError.value,
                    prefixIcon: const Icon(Icons.person_outline),
                    onChanged: (_) => controller.nameError.value = null,
                  )),
              const SizedBox(height: 20),

              // Status Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedStatus.value,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: controller.statusOptions.map((status) {
                              return DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectedStatus.value = value;
                              }
                            },
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 20),

              // Bio Field
              CustomTextField(
                controller: controller.bioController,
                label: 'Bio (Optional)',
                hint: 'Tell us about yourself',
                maxLines: 3,
                maxLength: 150,
                prefixIcon: const Icon(Icons.info_outline),
              ),
              const SizedBox(height: 32),

              // Complete Button
              Obx(() => CustomButton(
                    text: 'Complete Setup',
                    onPressed: controller.completeSetup,
                    isLoading: controller.isLoading.value,
                    width: double.infinity,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
