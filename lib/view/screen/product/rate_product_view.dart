import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';

import '../../../controller/product/rate_product_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../utils/helpers/device_helpers.dart';

class RateProductView extends StatelessWidget {
  const RateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RateProductControllerImp());
    final dark = AppHelperFunctions.isDarkMode(context);

    return Container(
      height: UDeviceHelper.getScreenHeight(context) * 0.55,
      decoration: BoxDecoration(
        color: dark ? AppColors.dark : AppColors.light,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            // Title
            Text(
              'Rate this Product',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: dark ? AppColors.light : AppColors.dark,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            // Subtitle
            Text(
              'We’d love to hear your thoughts.Your feedback\n helps us improve.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: AppSizes.spaceBtwItems),

            // Rating question
            Text(
              'How would you rate your experience?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            // Stars
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final isSelected = index < controller.selectedRating.value;
                  return GestureDetector(
                    onTap: () => controller.setRating(index + 1),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppSizes.cardRadiusLg,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Iconsax.star1,
                          size: 28,
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems * 1.5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tell us more (optional)',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: dark ? AppColors.darkerGrey : AppColors.grey,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: controller.feedbackController,
                cursorColor: AppColors.primary,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: 'Share your experience with this product...',
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppSizes.inputFieldRadius,
                    ),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppSizes.inputFieldRadius,
                    ),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.darkerGrey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppSizes.inputFieldRadius,
                    ),
                    borderSide: const BorderSide(
                      width: 2,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      controller.selectedRating.value > 0 &&
                          !controller.isSubmitting.value
                      ? () => controller.submitFeedback()
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.selectedRating.value > 0 &&
                            !controller.isSubmitting.value
                        ? AppColors.primary
                        : Colors.grey[300],
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: controller.isSubmitting.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Submit Feedback',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
