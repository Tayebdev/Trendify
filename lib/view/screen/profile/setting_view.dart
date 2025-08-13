import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/setting_controller.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import '../../../core/constant/app_sizes.dart';
import '../../widget/home/section_header.dart';
import '../../widget/profile/user_profile_title.dart';
import '../../widget/setting/app_setting_primary_header_container.dart';
import '../../widget/setting/setting_menu_title.dart';
import '../../widget/switch/app_switch.dart';

// ignore: must_be_immutable
class SettingView extends StatelessWidget {
  SettingView({super.key});
  SettingControllerImp controller = Get.put(SettingControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  UAppBar(
                    title: Text(
                      AppTexts.account,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: AppColors.white),
                    ),
                  ),
                  AppUserProfileTile(
                    onPressed: () {
                      controller.goToProfile();
                    },
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const SectionHeader(
                    title: AppTexts.acountSetting,
                    textButton: '',
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  AppSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: AppTexts.address,
                    subTitle: AppTexts.subTitleAddress,
                    onTap: () {
                      controller.goToAddressUser();
                    },
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: AppTexts.cart,
                    subTitle: AppTexts.subTitleCart,
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: AppTexts.order,
                    subTitle: AppTexts.subTitleOrders,
                    onTap: () {
                      // => Get.to(() => const OrdersScreen())
                    },
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: AppTexts.acountBank,
                    subTitle: AppTexts.subTitleAcountBank,
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: AppTexts.coupons,
                    subTitle: AppTexts.subTitleCoupons,
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: AppTexts.notification,
                    subTitle: AppTexts.subTitleNotification,
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: AppTexts.accountPrivacy,
                    subTitle: AppTexts.subTitleAccount,
                    onTap: () {},
                  ),

                  /// App Settings
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const SectionHeader(title: AppTexts.setting, textButton: ''),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  AppSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: AppTexts.loadData,
                    subTitle: AppTexts.subTitleLoadData,
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.location,
                    title: AppTexts.geolocation,
                    subTitle: AppTexts.subTitleGeolocation,
                    trailing: AppSwitch(onChanged: (value) {}, changed: true),
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: AppTexts.safeMode,
                    subTitle: AppTexts.subTitleSafeMode,
                    trailing: AppSwitch(onChanged: (value) {}, changed: true),
                  ),

                  Obx(
                    () => AppSettingsMenuTile(
                      icon: controller.isDarkMode.value
                          ? Iconsax.sun_1
                          : Iconsax.moon,
                      title: "Theme",
                      subTitle: controller.isDarkMode.value
                          ? "Dark theme enabled"
                          : "Light theme enabled",
                      trailing: AppSwitch(
                        onChanged: (value) {
                          controller.toggleTheme(value);
                        },
                        changed: controller.isDarkMode.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.logout,
                            size: AppSizes.iconMd,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: AppSizes.sm),
                          Text(
                            AppTexts.logout,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections / 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
