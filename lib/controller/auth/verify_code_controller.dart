import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class VerifyCodeController extends GetxController{
  goToForgetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController{
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

}