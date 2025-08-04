import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:trendify_app/data/static/static.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../helpers/device_helpers.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});
  static final controller = Get.put(OnboardingControllerImp());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.currentPage.value == onboardingList.length - 1
          ? SizedBox()
          : Positioned(
              right: 0,
              top: UDeviceHelper.getAppBarHeight(),
              child: TextButton(
                onPressed: controller.skipPage,
                child: const Text(
                  'Skip',
                  style: TextStyle(color: AppColors.primary, fontSize: 20),
                ),
              ),
            ),
    );
  }
}
