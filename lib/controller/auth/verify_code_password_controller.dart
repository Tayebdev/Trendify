import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class VerifyCodePasswordController extends GetxController {
  goToUpdatePassword();
}

class VerifyCodePasswordControllerImp extends VerifyCodePasswordController {
  @override
  goToUpdatePassword() {
    Get.offAllNamed(AppRoutes.updatePassword);
  }
}
