import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class VerifyEmailController extends GetxController {
  goToLogin();
  goToVerifyCode();
}

class VerifyEmailControllerImp extends VerifyEmailController {
  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }
  
  @override
  goToVerifyCode() {
    Get.offAllNamed(AppRoutes.verifyCode);
  }
}
