import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/profile/profile_controller.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_link_api.dart';
import '../../../core/constant/app_texts.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/image_widget/circular_image.dart';
import '../../widget/profile/profile_menu.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          AppTexts.profile,
          style: Theme.of(context).textTheme.headlineMedium!.apply(
            color: dark ? AppColors.white : AppColors.dark,
          ),
        ),
      ),
      body: GetBuilder<ProfileControllerImp>(
        builder: (controller) {
          return HandleDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  children: [
                    // Profile Image Section
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          AppCircularImage(
                            image: controller.user?.image != null
                                ? '${AppLinkApi.imageUser}/${controller.user!.image}'
                                : AppImages.user,
                            width: 80,
                            height: 80,
                            isNetworkImage: controller.user?.image != null,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Change profile picture",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .apply(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems / 2),
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    SectionHeader(
                      title: "Profile information",
                      showButton: false,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    ProfileMenu(
                      iconData: Iconsax.arrow_right_34,
                      title: "First Name",
                      subTitle: controller.user?.firstName ?? "Not set",
                      onTap: () => Get.toNamed(
                        AppRoutes.editProfile,
                        arguments: {
                          "firstName": controller.user?.firstName,
                          "lastName": controller.user?.lastName,
                        },
                      ),
                    ),
                    ProfileMenu(
                      iconData: Iconsax.arrow_right_34,
                      title: "Last Name",
                      subTitle: controller.user?.lastName ?? "Not set",
                      onTap: () => Get.toNamed(
                        AppRoutes.editProfile,
                        arguments: {
                          "firstName": controller.user?.firstName,
                          "lastName": controller.user?.lastName,
                        },
                      ),
                    ),
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    SectionHeader(
                      title: "Personal information",
                      showButton: false,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    ProfileMenu(
                      iconData: Iconsax.copy,
                      title: "User ID",
                      subTitle:
                          controller.user?.sId?.substring(0, 8) ??
                          "Not available",
                      onTap: () {},
                    ),
                    ProfileMenu(
                      iconData: Iconsax.arrow_right_34,
                      title: "Email",
                      subTitle: controller.user?.email ?? "Not set",
                      onTap: () => Get.toNamed(
                        AppRoutes.editPersonal,
                        arguments: {
                          "email": controller.user?.email,
                          "phone": controller.user?.phone,
                        },
                      ),
                    ),
                    ProfileMenu(
                      iconData: Iconsax.arrow_right_34,
                      title: "Phone Number",
                      subTitle: controller.user?.phone ?? "Not set",
                      onTap: () => Get.toNamed(
                        AppRoutes.editPersonal,
                        arguments: {
                          "email": controller.user?.email,
                          "phone": controller.user?.phone,
                        },
                      ),
                    ),
                    ProfileMenu(
                      iconData: Iconsax.arrow_right_34,
                      title: "Password",
                      subTitle: "●●●●●●●●",
                      onTap: () {},
                    ),
                    ProfileMenu(
                      iconData: Iconsax.arrow_right_34,
                      title: "Gender",
                      subTitle: "Male",
                      onTap: () {},
                    ),
                    Divider(),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>((states) {
                              if (states.contains(WidgetState.pressed)) {
                                // ignore: deprecated_member_use
                                return AppColors.error.withOpacity(0.2);
                              }
                              return Colors.transparent;
                            }),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Text(
                        "Close Account",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.apply(color: AppColors.error),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
