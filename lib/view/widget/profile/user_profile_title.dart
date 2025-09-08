import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/setting_controller.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_images.dart';

import '../image_widget/circular_image.dart';

class AppUserProfileTile extends StatelessWidget {
  const AppUserProfileTile({super.key, required this.onPressed});
  static final controller = SettingControllerImp.instance;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AppCircularImage(
        image: AppImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        "${controller.lastName} ${controller.firstName}",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: AppColors.white),
      ),
      subtitle: Text(
        controller.email,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: AppColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: AppColors.white),
      ),
    );
  }
}
