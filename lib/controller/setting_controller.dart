import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class SettingController extends GetxController{
  goToProfile();
}

class SettingControllerImp extends SettingController{
  @override
  goToProfile() {
    Get.toNamed(AppRoutes.profile);
  }

}