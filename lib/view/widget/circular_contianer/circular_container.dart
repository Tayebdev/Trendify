import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../helpers/device_helpers.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UDeviceHelper.getScreenHeight(context) * 0.4,
      width: UDeviceHelper.getScreenHeight(context) * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: AppColors.white.withValues(alpha: 0.1),
      ),
    );
  }
}
